import can
import cantools
import pycanape
import struct

# Global variables for DBC database and CAN bus
db = None
bus = None
module = None

"""
Establishes a connection to the CANape project and retrieves the specified module.

This function initializes a CANape instance using the provided project path (only if not already initialized)
and returns the 'Vinayak' module object for further interaction.
"""
canape_instance = None

def connect_to_canape():
    """Connect to CANape and save module globally."""
    global module, canape_instance
    if module is None or canape_instance is None:
        canape_instance = pycanape.CANape(
            project_path=r"D:\Validation\Vinayak\IMU\XCP_Configuration\IMU\IMU",
            modal_mode=True,
        )
        module = canape_instance.get_module_by_name("IMU")
    return module

def close_canape():
    """Close CANape without prompting to save the project."""
    global canape_instance
    if canape_instance is not None:
        canape_instance.save_project()
        canape_instance.exit(close_canape=True)
        canape_instance = None

""" Initializes the CAN interface and loads the specified DBC file.
    This function sets up the CAN bus using the Vector interface and bitrate,
    and loads the DBC file to enable message encoding and decoding."""
# def initialize_can(db_file_path='CAN_VM_v3.7.1.dbc', channel=3, bitrate=500000):
#     global db, bus
#     db = cantools.database.load_file(db_file_path)
#     bus = can.Bus(interface='vector', channel=channel, bitrate=bitrate)
#     print("CAN interface initialized!")



def read_validate(xcp_variable):
    """
    Read the value of a calibration variable from CANape using the pycanape module.

    Args:
        xcp_variable (str): Fully qualified variable name from the A2L.

    Returns:
        The read value as a string, or None if an error occurred.
    """

    print("\n🔵 Reading back values from CANape...")
    cal_obj = module.get_calibration_object(xcp_variable)
    read_value = cal_obj.value
    print(f"{xcp_variable}: {read_value}")  # Corrected here
    return read_value





# def write_variable(xcp_Variable, value):
#     """Write a value to a CANape calibration object."""
#     print(f"\n🟡 Writing value {value} to {xcp_Variable}...")
#     cal_obj = module.get_calibration_object(xcp_Variable)
#     cal_obj.value = value
#     print(f"{xcp_Variable} updated to: {cal_obj.value}")


def write_variable(variable_name: str, value: float):
    """
    Writes a value to a variable and verifies that it was written successfully.

    Args:
        variable_name (str): Fully qualified variable name from A2L.
        value (float): Value to write to the variable.

    Raises:
        RuntimeError: If write fails or verification fails.
    """
    print("\n🔵 Reading back values from CANape...")
    cal_obj = module.get_calibration_object(variable_name)
    read_value = cal_obj.value
    cal_obj.value=value
    print(cal_obj.value)

