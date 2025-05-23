*** Settings ***
Library    ../can_tx_validation_interface.py
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
Send Tx XCP variables and validating on CAN signals for message mVehOdo
    [Documentation]    Validate TX message 'mVehOdo' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehOdo": 0, "VcuTripMeter": 0, "BackendTripMeter": 0}
    ${xcp_var_map}=    Evaluate    {"VehOdo": "Rte_C_SG_mVehOdo_adt_0E59EED87CCD08BF802DE006BA19BEEF.VehOdo", "VcuTripMeter": "Rte_C_SG_mVehOdo_adt_0E59EED87CCD08BF802DE006BA19BEEF.VcuTripMeter", "BackendTripMeter": "Rte_C_SG_mVehOdo_adt_0E59EED87CCD08BF802DE006BA19BEEF.BackendTripMeter"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehOdo": 0, "VcuTripMeter": 0, "BackendTripMeter": 0}
    Validate TX Message With Expected Values    mVehOdo    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehOdo": 1000.5, "VcuTripMeter": 35.5, "BackendTripMeter": 35.5}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehOdo": 1000.5, "VcuTripMeter": 35.5, "BackendTripMeter": 35.5}
    Validate TX Message With Expected Values    mVehOdo    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehOdo": 65.535, "VcuTripMeter": 65.535, "BackendTripMeter": 16777.213}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehOdo": 65.535, "VcuTripMeter": 65.535, "BackendTripMeter": 16777.213}
    Validate TX Message With Expected Values    mVehOdo    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVscStat
    [Documentation]    Validate TX message 'mVscStat' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VscMode": 1, "CtrlMode": 0, "VscEstop": 0}
    ${xcp_var_map}=    Evaluate    {"VscMode": "Rte_C_SG_mVscStat_adt_317D5362456BDAB18A711606B47078C5.VscMode", "CtrlMode": "Rte_C_SG_mVscStat_adt_317D5362456BDAB18A711606B47078C5.CtrlMode", "VscEstop": "Rte_C_SG_mVscStat_adt_317D5362456BDAB18A711606B47078C5.VscEstop"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VscMode": Searching, "CtrlMode": User, "VscEstop": 0}
    Validate TX Message With Expected Values    mVscStat    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VscMode": 4, "CtrlMode": 1, "VscEstop": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VscMode": Local, "CtrlMode": Shared, "VscEstop": Ok}
    Validate TX Message With Expected Values    mVscStat    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VscMode": 11, "CtrlMode": 2, "VscEstop": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VscMode": Pause, "CtrlMode": Auton, "VscEstop": Stop}
    Validate TX Message With Expected Values    mVscStat    ${expected_can_signals}    30