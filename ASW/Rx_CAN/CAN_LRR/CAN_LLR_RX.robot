*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***

Setup
    Open Canape And Load Imu Configuration    D:/Jenkins/workspace/CGVCU_ASW_Testing/ASW/Rx_CAN/Rx_CAN_Config    CAN_RX
    Initialize Can    D:/Jenkins/workspace/CGVCU_ASW_Testing/ASW/DBC/CAN_TC_V1.0.4.dbc    1    500000
    Sleep    3s

Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
