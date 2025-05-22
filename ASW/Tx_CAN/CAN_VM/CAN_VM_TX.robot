*** Settings ***
Library    ../can_tx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Validation/Vinayak/ASW/CAN_VM_Configuration/ASW_CAN_VM_RX    CAN_VM_RX
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/Tx_Testing/CAN_VM_v3.7.1.dbc    3    500000
    Sleep    3s

Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***

Send Tx XCP variables and validating on CAN signals for message mVcuSwVer
    [Documentation]    Validate TX message 'mVcuSwVer' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": 0}
    ${xcp_var_map}=    Evaluate    {"SwMaj": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwMaj", "SwMin": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwMin", "SwRev": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwRev", "SwStat": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwStat"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": "Development"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 100, "SwMin": 100, "SwRev": 100, "SwStat": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 100, "SwMin": 100, "SwRev": 100, "SwStat": "Development"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": "Released"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVcuGyroAngle
    [Documentation]    Validate TX message 'mVcuGyroAngle' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": -30000, "GyroYAng": -30000, "Pitch": -2500, "Tilt": -2500}
    ${xcp_var_map}=    Evaluate    {"GyroXAng": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.GyroXAng", "GyroYAng": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.GyroYAng", "Pitch": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.Pitch", "Tilt": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.Tilt",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": -30.0, "GyroYAng": -30.0, "Pitch": -25.0, "Tilt": -25.0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": 0, "GyroYAng": 0, "Pitch": 0, "Tilt": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": 0.0, "GyroYAng": 0.0, "Pitch": 0.0, "Tilt": 0.0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": 30000, "GyroYAng": 30000, "Pitch": 2500, "Tilt": 2500}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": 30.0, "GyroYAng": 30.0, "Pitch": 25.0, "Tilt": 25.0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30
