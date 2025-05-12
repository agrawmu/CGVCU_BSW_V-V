# ==============================================================================
# CANape XCP Interface for IMU Module
#
# This script provides utility functions to:
# - Open and close CANape with a specific IMU configuration
# - Read and write calibration variables via XCP
# - Integrate with automated test frameworks (e.g., Robot Framework)
#
# Dependencies: pycanape, pyautogui, cantools, python-can
# ==============================================================================

import struct
import time
import can
import cantools
import pycanape
import pyautogui

# Global variables for DBC database, CAN bus, and CANape session
db = None
bus = None
module = None
canape_instance = None

# Function: Open CANape and load the IMU configuration
def open_canape_and_load_imu_configuration() -> pycanape.CANapeModule:
    global module, canape_instance

    # If CANape or module isn't already initialized, create new instance
    if module is None or canape_instance is None:
        try:
            canape_instance = pycanape.CANape(
                project_path=r"D:\Validation\Vinayak\IMU\XCP_Configuration\IMU\IMU",
                modal_mode=True,
            )
            module = canape_instance.get_module_by_name("IMU")
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
def read_xcp_variable(xcp_variable: str) -> any:
    try:
        # Fetch calibration object by name and return its value
        cal_obj = module.get_calibration_object(xcp_variable)
        return cal_obj.value
    except Exception as e:
        raise RuntimeError(f"Failed to read XCP variable {xcp_variable}: {str(e)}")

# Function: Write a value to an XCP calibration variable
def write_xcp_variable(variable_name: str, value: any) -> None:
    try:
        cal_obj = module.get_calibration_object(variable_name)

        # Check the value type and assign to calibration object
        if isinstance(value, (float, int, str)):
            cal_obj.value = value
        else:
            raise TypeError(f"Unsupported value type: {type(value)} for {variable_name}")
    except Exception as e:
        raise RuntimeError(f"Failed to write XCP variable {variable_name}: {str(e)}")
