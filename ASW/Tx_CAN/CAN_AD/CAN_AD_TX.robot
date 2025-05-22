*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/RX_Testing/CAN_AD/CAN_AD_V1.6.4.dbc    3    500000
    Sleep    3s

Shutdown
    Shutdown Can
    Close Canape


*** Test Cases ***
