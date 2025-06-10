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
import logging

# Global variables for DBC database, CAN bus, and CANape session
db = None
bus = None
module = None
canape_instance = None
# Suppress pycanape warnings
logging.getLogger("pycanape").setLevel(logging.CRITICAL)
# Function: Open CANape and load the IMU configuration
def open_canape_and_load_imu_configuration():
    global module, canape_instance

    # If CANape or module isn't already initialized, create new instance
    if module is None or canape_instance is None:
        try:
            canape_instance = pycanape.CANape(
                project_path=r"D:\Validation\Vinayak\BSW",
                modal_mode=True,
            )
            module = canape_instance.get_module_by_name("BSW")
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

        # Convert string values to float (or int if needed)
        if isinstance(value, str):
            if "." in value:
                value = float(value)
            else:
                value = int(value)
        elif not isinstance(value, (int, float)):
            raise TypeError(f"Unsupported value type: {type(value)} for variable {variable_name}")

        cal_obj.value = value

    except Exception as e:
        raise RuntimeError(f"❌ Failed to write XCP variable '{variable_name}': {str(e)}")

def verify_led(set_signal, set_value, observed_signal, observed_value):
    """
    Prints a simple and readable validation summary between a written and observed XCP signal.
    """

    try:
        set_value = float(set_value)
        observed_value = float(observed_value)

        # Format effect message based on value
        effect = "glowing" if set_value == 1 else "not glowing"

        if set_value == observed_value:
            print(
                f"\n✅ The parameter '{set_signal}' is set to {set_value}. "
                f"LED '{observed_signal}' is {effect} as expected.\n"
            )
        else:
            print(
                f"\n❌ The parameter '{set_signal}' was set to {set_value}, "
                f"but LED '{observed_signal}' is showing {observed_value} instead of being {effect}.\n"
            )
            raise AssertionError("Observed signal value does not match expected LED behavior.")

    except Exception as e:
        raise AssertionError(f"⚠️ Error during verification: {str(e)}")


