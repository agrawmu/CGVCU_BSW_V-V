import time
import can
import cantools
import pycanape
import pyautogui
import logging
import math

# Suppress pycanape warnings
logging.getLogger("pycanape").setLevel(logging.CRITICAL)

# Globals
db = None
bus = None
module = None
canape_instance = None

# Function: Open CANape and load the IMU configuration module
def open_canape_and_load_imu_configuration(project_path, module_name):
    global module, canape_instance

    if module is None or canape_instance is None:
        try:
            canape_instance = pycanape.CANape(
                project_path=project_path,
                modal_mode=True,
            )
            module = canape_instance.get_module_by_name(module_name)
        except Exception as e:
            raise RuntimeError(f"❌ Failed to connect to CANape: {str(e)}")

    return module

# Function: Close CANape safely
def close_canape():
    global canape_instance

    if canape_instance is not None:
        canape_instance.exit(close_canape=True)
        time.sleep(2)
        pyautogui.press("right")  # Move from Yes to No
        pyautogui.press("enter")  # Confirm No to discard changes

# Function: Write to an XCP variable
def write_xcp_variable(variable_name, value):
    try:
        cal_obj = module.get_calibration_object(variable_name)
        if isinstance(value, (float, int, str)):
            cal_obj.value = value
        else:
            raise TypeError(f"Unsupported value type: {type(value)} for variable {variable_name}")
    except Exception as e:
        raise RuntimeError(f"❌ Failed to write XCP variable '{variable_name}': {str(e)}")

def write_multiple_xcp_variables(xcp_var_map, values):
    for signal, xcp_name in xcp_var_map.items():
        write_xcp_variable(xcp_name, values[signal])
    print("✅ All XCP variables written")

# Function: Initialize CAN and load DBC
def initialize_can(db_file_path, channel=1, bitrate=500000):
    global db, bus
    try:
        db = cantools.database.load_file(db_file_path)
        bus = can.Bus(interface='vector', channel=channel, bitrate=bitrate)
        print("✅ CAN interface initialized")
    except Exception as e:
        raise RuntimeError(f"❌ Failed to initialize CAN: {e}")

# Function: Shutdown CAN safely
def shutdown_can():
    global bus
    if bus is not None:
        bus.shutdown()

# Function: Wait for a TX CAN message and decode it
# Function: Wait for a CAN message by name, return it on the N-th occurrence
def wait_for_can_message(message_name, timeout=2.0, occurrence=2):
    global db, bus

    if db is None or bus is None:
        raise Exception("CAN bus or DBC not initialized")

    target_msg = db.get_message_by_name(message_name)
    if target_msg is None:
        raise ValueError(f"Message '{message_name}' not found in DBC")

    deadline = time.time() + timeout
    count = 0

    while time.time() < deadline:
        msg = bus.recv(timeout=0.1)
        if msg and msg.arbitration_id == target_msg.frame_id:
            count += 1
            if count == occurrence:
                try:
                    decoded = target_msg.decode(msg.data)
                    print(f"📥 Received '{message_name}' (occurrence {occurrence}): {decoded}")
                    return decoded
                except Exception as e:
                    raise RuntimeError(f"Error decoding CAN message: {e}")

    raise TimeoutError(f"❌ Message '{message_name}' not received {occurrence} times within {timeout} seconds")

# Function: Validate a TX message using expected signal values
def validate_tx_message_with_expected_values(message_name, expected_signals, timeout=2, tolerance=1e-2):
    received = wait_for_can_message(message_name, timeout=timeout, occurrence=2)
    mismatches = []

    for signal, expected in expected_signals.items():
        actual = received.get(signal)
        if isinstance(expected, float):
            if not math.isclose(actual, expected, abs_tol=tolerance):
                msg = f"❌ {signal} mismatch: expected {expected}, got {actual}"
                print(msg)
                mismatches.append(msg)
            else:
                print(f"✅ {signal} matched (float): {actual}")
        else:
            if actual != expected:
                msg = f"❌ {signal} mismatch: expected {expected}, got {actual}"
                print(msg)
                mismatches.append(msg)
            else:
                print(f"✅ {signal} matched: {actual}")

    if mismatches:
        raise AssertionError("TX Message Validation Failed:\n" + "\n".join(mismatches))
    else:
        print(f"✅ TX message '{message_name}' validated successfully on 2nd occurrence")