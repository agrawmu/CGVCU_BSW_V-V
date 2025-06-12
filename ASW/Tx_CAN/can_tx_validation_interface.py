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
        canape_instance.exit()
        time.sleep(2)
        pyautogui.press("right")  # Move from Yes to No
        pyautogui.press("enter")  # Confirm No to discard changes

# Function: Read an XCP variable
def read_xcp_variable(xcp_variable: str):
    try:
        cal_obj = module.get_calibration_object(xcp_variable)
        return cal_obj.value
    except Exception as e:
        raise RuntimeError(f"❌ Failed to read XCP variable '{xcp_variable}': {str(e)}")

# Function: Write an XCP variable
def write_xcp_variable(variable_name, value):
    try:
        cal_obj = module.get_calibration_object(variable_name)
        if isinstance(value, (float, int, str)):
            cal_obj.value = value
        else:
            raise TypeError(f"Unsupported value type: {type(value)} for variable {variable_name}")
    except Exception as e:
        raise RuntimeError(f"❌ Failed to write XCP variable '{variable_name}': {str(e)}")

# Function: Write multiple XCP variables
def write_multiple_xcp_variables(xcp_var_map, values):
    for signal, xcp_name in xcp_var_map.items():
        # time.sleep(1)
        write_xcp_variable(xcp_name, values[signal])
    print("✅ All XCP variables written")

# Function: Read multiple XCP variables
def read_multiple_xcp_variables(xcp_var_map):
    results = {}
    for signal, xcp_name in xcp_var_map.items():
        try:

            value = read_xcp_variable(xcp_name)
            results[signal] = value
            print(f"📘 XCP Read: {xcp_name} = {value}")
        except Exception as e:
            raise RuntimeError(f"❌ Failed to read XCP variable for '{signal}': {e}")
    print("✅ All XCP variables read")
    return results


# Function: Initialize CAN and load DBC
def initialize_can(db_file_path='CAN_VM_v3.7.1.dbc', channel=3, bitrate=500000):
    global db, bus
    try:
        db = cantools.database.load_file(db_file_path)
        bus = can.Bus(interface='vector', channel=channel, bitrate=bitrate)
        print("✅ CAN interface initialized")
    except Exception as e:
        raise RuntimeError(f"❌ Failed to initialize CAN: {e}")
def initialize_canfd(db_file_path='CAN_VM_v3.7.1.dbc', channel=1, bitrate=500000, data_bitrate=2000000):
    """
    Initialize a CAN FD interface using the Vector hardware.

    Parameters:
        db_file_path (str): Path to the DBC file.
        channel (int or str): Channel index or name (e.g., 0, 1, '0', '1').
        bitrate (int): Nominal bitrate (arbitration phase), typically 500000.
        data_bitrate (int): Data phase bitrate for CAN FD, typically higher like 2000000.
    """
    global db, bus
    try:
        # Load the DBC file
        db = cantools.database.load_file(db_file_path)

        # Initialize CAN FD bus
        bus = can.Bus(
            interface='vector',     # Change this if using other interfaces like 'socketcan', 'kvaser', etc.
            channel=channel,
            bitrate=bitrate,
            fd=True,                # Enable CAN FD
            data_bitrate=data_bitrate
        )

        print("CAN FD interface initialized successfully!")

    except Exception as e:
        print(f"CAN FD initialization failed: {e}")
# Function: Shutdown CAN safely
def shutdown_can():
    global bus
    if bus is not None:
        bus.shutdown()

# Function: Wait for a specific CAN message occurrence and decode it
# def wait_for_can_message(message_name, timeout=2.0, occurrence=1, clear_buffer=True):
#     """
#     Wait for a specific CAN message after optionally clearing the receive buffer
#
#     Args:
#         message_name (str): Name of the CAN message to wait for (must exist in DBC)
#         timeout (float): Maximum time to wait in seconds
#         occurrence (int): Number of times the message should be received
#         clear_buffer (bool): Whether to clear existing messages before observing
#
#     Returns:
#         dict: Decoded message data when found
#
#     Raises:
#         TimeoutError: If message isn't received enough times before timeout
#         RuntimeError: For decoding or other CAN communication errors
#     """
#     global db, bus
#
#     # Validate initialization
#     if db is None or bus is None:
#         raise Exception("CAN bus or DBC not initialized")
#
#
#     # Get message details from DBC
#     target_msg = db.get_message_by_name(message_name)
#     if target_msg is None:
#         raise ValueError(f"Message '{message_name}' not found in DBC")
#
#     # Clear the receive buffer if requested
#     if clear_buffer:
#         start_time = time.time()
#         cleared_count = 0
#         while time.time() - start_time < 1:  # Clear for max 0.5 seconds
#             msg = bus.recv(timeout=0.01)
#             if msg:
#                 cleared_count += 1
#             else:
#                 break
#         print(f"🧹 Cleared {cleared_count} messages from buffer")
#
#     # Main observation loop
#     deadline = time.time() + timeout
#     count = 0
#
#     while time.time() < deadline:
#         msg = bus.recv(timeout=3)
#         if msg and msg.arbitration_id == target_msg.frame_id:
#             try:
#                 decoded = target_msg.decode(msg.data)
#                 count += 1
#                 print(f"📥 Received"
#
#                       f" '{message_name}' ({count}/{occurrence}): {decoded}")
#
#                 if count == occurrence:
#                     return decoded
#
#             except Exception as e:
#                 raise RuntimeError(f"❌ Error decoding CAN message: {e}")
#
#     raise TimeoutError(
#         f"❌ Message '{message_name}' only received {count} times "
#         f"(needed {occurrence}) within {timeout} seconds"
#     )
def wait_for_can_message(message_name, timeout=2.0, occurrence=1, clear_buffer=True, verbose=True):
    """
    Wait for a specific CAN message and return its decoded data

    Args:
        message_name (str): CAN message name from DBC
        timeout (float): Max time to wait
        occurrence (int): Number of times to wait for
        clear_buffer (bool): Clear buffer before start
        verbose (bool): Print debug logs

    Returns:
        dict: Decoded CAN message content

    Raises:
        TimeoutError, ValueError, RuntimeError
    """
    global db, bus

    if db is None or bus is None:
        raise Exception("CAN bus or DBC not initialized")

    target_msg = db.get_message_by_name(message_name)
    if target_msg is None:
        raise ValueError(f"Message '{message_name}' not found in DBC")

    target_id = target_msg.frame_id
    # if verbose:
    #     print(f"🎯 Waiting for message '{message_name}' (ID: 0x{target_id:X})")

    if clear_buffer:
        start_time = time.time()
        while time.time() - start_time < 0.5:
            bus.recv(timeout=0.01)  # Just flush
        # if verbose:
        #     print("🧹 Cleared buffer")

    count = 0
    deadline = time.time() + timeout

    while time.time() < deadline:
        msg = bus.recv(timeout=0.05)
        if msg:
            # if verbose:
            #     print(f"🔍 Got CAN ID: 0x{msg.arbitration_id:X}, Data: {msg.data.hex()}")
            if msg.arbitration_id == target_id:
                try:
                    decoded = target_msg.decode(msg.data)
                    count += 1
                    print(f"📥 Received '{message_name}' ({count}/{occurrence}): {decoded}")
                    if count == occurrence:
                        return decoded
                except Exception as e:
                    raise RuntimeError(f"❌ Decoding error: {e}")

    raise TimeoutError(
        f"❌ '{message_name}' only received {count} times (needed {occurrence}) in {timeout}s"
    )


# Function: Validate TX message by checking expected signal values
# def validate_tx_message_with_expected_values(message_name, expected_signals, timeout=2, tolerance=1e-1):
#     received = wait_for_can_message(message_name, timeout=timeout, occurrence=2)
#
#     mismatches = []
#
#     for signal, expected in expected_signals.items():
#         actual = received.get(signal)
#         if isinstance(expected, float):
#             if not math.isclose(actual, expected, abs_tol=tolerance):
#                 msg = f"❌ {signal} mismatch: expected {expected}, got {actual}"
#                 print(msg)
#                 mismatches.append(msg)
#             else:
#                 print(f"✅ {signal} matched (float): {actual}")
#         else:
#             if actual != expected:
#                 msg = f"❌ {signal} mismatch: expected {expected}, got {actual}"
#                 print(msg)
#                 mismatches.append(msg)
#             else:
#                 print(f"✅ {signal} matched: {actual}")
#
#     if mismatches:
#         raise AssertionError("TX Message Validation Failed:\n" + "\n".join(mismatches))
#     else:
#         print(f"✅ TX message '{message_name}' validated successfully")
import math
import logging

logger = logging.getLogger(__name__)

def validate_tx_message_with_expected_values(message_name, expected_signals, test_case_type="", timeout=2, tolerance=1e-1):
    """
    Validates that values written to ASW variables are correctly reflected in BSW CAN message signals.

    Parameters:
        message_name     (str): Name of the TX CAN message to be validated.
        expected_signals (dict): Dictionary of expected signal values {signal_name: expected_value}.
        timeout          (int): Timeout in seconds to wait for the CAN message.
        tolerance        (float): Tolerance for comparing float values.
        test_case_type   (str): Type of test (e.g., 'Minimum', 'Maximum', 'Mid').
    """
    received = wait_for_can_message(message_name, timeout=timeout, occurrence=2)

    logger.info("")
    logger.info(f"📡 Verifying TX Message: {message_name} [{test_case_type} Value Test]")
    logger.info("===========================================================")

    failed_signals = []
    total_signals = len(expected_signals)

    for index, (signal, expected_value) in enumerate(expected_signals.items()):
        actual_value = received.get(signal)
        logger.info(f"🔎 Signal: {signal}")
        logger.info(f"   🧩 ASW Variable Value (Expected) : {expected_value}")
        logger.info(f"   🛠️ BSW Signal Value   (Actual)   : {actual_value}")

        if isinstance(expected_value, float):
            if not math.isclose(actual_value, expected_value, abs_tol=tolerance):
                logger.info(f"❌ FAIL: Signal '{signal}' [{test_case_type}]")
                logger.info(f"   → Result: Value written to ASW Variable is NOT correctly reflected in BSW Signal (±{tolerance} allowed)")
                failed_signals.append(signal)
            else:
                logger.info(f"✅ PASS: Signal '{signal}' [{test_case_type}]")
                logger.info(f"   → Result: Value written to ASW Variable is correctly reflected in BSW Signal (within ±{tolerance})")
        else:
            if actual_value != expected_value:
                logger.info(f"❌ FAIL: Signal '{signal}' [{test_case_type}]")
                logger.info(f"   → Result: Value written to ASW Variable is NOT correctly reflected in BSW Signal")
                failed_signals.append(signal)
            else:
                logger.info(f"✅ PASS: Signal '{signal}' [{test_case_type}]")
                logger.info(f"   → Result: Value written to ASW Variable is correctly reflected in BSW Signal")

        if index < total_signals - 1:
            logger.info("-----------------------------------------------------------")

    # Final log section separator
    logger.info("===========================================================")
    logger.info(f"📥 Received Message '{message_name}': {received}")

    if failed_signals:
        raise AssertionError(
            f"\n❌ TX Message Validation Failed for '{message_name}' [{test_case_type}] test.\n"
            f"   → Failed Signals: {', '.join(failed_signals)}"
        )
    else:
        logger.info(f"🎯 PASS: TX Message '{message_name}' validated successfully [{test_case_type}] test.")



def trace_can_messages(duration=10.0, message_filter=None, callback=None):
    """
    Continuously trace and display CAN messages for a specified duration

    Args:
        duration (float): Time in seconds to trace messages (None for infinite)
        message_filter (list): Optional list of message names to filter for
        callback (function): Optional callback function to process each message
                             Signature: callback(msg_name, decoded_data)

    Returns:
        list: Collected messages (if callback is None)
    """
    global db, bus
    if db is None or bus is None:
        raise Exception("CAN bus or DBC not initialized")

    collected_messages = []
    start_time = time.time()
    print(f"🔍 Starting CAN trace for {duration if duration else 'infinite'} seconds...")

    try:
        while duration is None or (time.time() - start_time < duration):
            msg = bus.recv(timeout=0.1)
            if msg:
                try:
                    msg_name = db.get_message_by_frame_id(msg.arbitration_id).name
                    if message_filter is None or msg_name in message_filter:
                        decoded = db.decode_message(msg.arbitration_id, msg.data)
                        timestamp = time.time() - start_time

                        if callback:
                            callback(msg_name, decoded)
                        else:
                            print(f"[{timestamp:.3f}s] {msg_name}: {decoded}")
                            collected_messages.append((timestamp, msg_name, decoded))

                except KeyError:
                    print(f"⚠️ Unknown message ID: {hex(msg.arbitration_id)}")
                except Exception as e:
                    print(f"⚠️ Error decoding message: {str(e)}")

    except KeyboardInterrupt:
        print("⏹️ CAN trace stopped by user")

    print("✅ CAN trace completed")
    return collected_messages if not callback else None

# Optional: Test/debug from command line
if __name__ == "__main__":
    initialize_can()
    trace_can_messages()
