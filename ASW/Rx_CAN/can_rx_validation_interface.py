# ==============================================================================
# CANape XCP Interface for IMU Module
#
# This script provides utility functions to:
# - Open and close CANape with a specific IMU configuration
# - Read and write calibration variables via XCP
# - Send CAN messages using a DBC
#
# Dependencies: pycanape, pyautogui, cantools, python-can
# ==============================================================================

import struct
import time
import can
import cantools
import pycanape
import pyautogui
import logging

# Suppress pycanape internal warnings
logging.getLogger("pycanape").setLevel(logging.CRITICAL)

# Global variables
db = None
bus = None
module = None
canape_instance = None


# Function: Open CANape and load the IMU configuration module
def open_canape_and_load_imu_configuration():
    global module, canape_instance

    # Initialize CANape and get module if not already done
    if module is None or canape_instance is None:
        try:
            canape_instance = pycanape.CANape(
                project_path=r"D:\Validation\Vinayak\ASW Canope\ASW_RX_Configuration\ASW_RX",
                modal_mode=True,
            )
            module = canape_instance.get_module_by_name("ASW_RX")
        except Exception as e:
            raise RuntimeError(f"Failed to connect to CANape: {str(e)}")

    return module


# Function: Close CANape without saving changes
def close_canape() -> None:
    global canape_instance

    # If CANape was started, proceed to close
    if canape_instance is not None:
        canape_instance.exit(close_canape=True)
        time.sleep(2)  # Delay to allow UI prompt to appear

        # Navigate UI to discard save prompt
        pyautogui.press("right")  # Move from "Yes" to "No"
        pyautogui.press("enter")  # Confirm "No" to avoid saving


# Function: Read the value of an XCP calibration variable
def read_xcp_variable(xcp_variable: str):
    try:
        # Fetch calibration object by name and return its value
        cal_obj = module.get_calibration_object(xcp_variable)
        return cal_obj.value
    except Exception as e:
        raise RuntimeError(f"Failed to read XCP variable {xcp_variable}: {str(e)}")


# Function: Write a value to an XCP calibration variable
def write_xcp_variable(variable_name: str, value):
    try:
        cal_obj = module.get_calibration_object(variable_name)

        # Accept only float, int, or str values
        if isinstance(value, (float, int, str)):
            cal_obj.value = value
        else:
            raise TypeError(f"Unsupported value type: {type(value)} for {variable_name}")
    except Exception as e:
        raise RuntimeError(f"Failed to write XCP variable {variable_name}: {str(e)}")


# Function: Initialize CAN interface and load DBC file
def initialize_can(db_file_path='CAN_VM_v3.7.1.dbc', channel=1, bitrate=500000):
    global db, bus
    try:
        db = cantools.database.load_file(db_file_path)
        bus = can.Bus(interface='vector', channel=channel, bitrate=bitrate)
        print("CAN interface initialized!")
    except Exception as e:
        print(f"Initialization failed: {e}")


# Function: Shutdown the CAN interface safely
def shutdown_can():
    global bus
    if bus is not None:
        bus.shutdown()


# Function: Encode and send a CAN message using cantools and python-can
def send_can_message(message_name, signal_values):
    global db, bus

    if db is None or bus is None:
        raise Exception("CAN bus or DBC not initialized")

    try:
        message = db.get_message_by_name(message_name)
        if message is None:
            raise ValueError(f"Message '{message_name}' not found in DBC")

        data = message.encode(signal_values)

        can_msg = can.Message(
            arbitration_id=message.frame_id,
            data=data,
            is_extended_id=message.is_extended_frame,
            is_fd=message.is_fd,
        )
        bus.send(can_msg)

        print(f"Sent CAN message: {message_name} with data: {data.hex()}")
    except Exception as e:
        print(f"Error sending message: {e}")

