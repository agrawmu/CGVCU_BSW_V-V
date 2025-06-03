*** Settings ***
Library    ../can_tx_validation_interface.py
Library    BuiltIn


Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Validation/Vinayak/ASW/CAN_TX/TX_Configuration    CAN_Tx
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/Tx_Testing/CAN_VM_v3.7.1.dbc    3    500000

Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***

VM-TX-0x1cffcccc: Send Tx XCP variables and validating on CAN signals for message mVcuSwVer
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

VM-TX-0x20d: Send Tx XCP variables and validating on CAN signals for message mVcuGyroAngle
    [Documentation]    Validate TX message 'mVcuGyroAngle' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": -30.0, "GyroYAng": -30.0, "Pitch": -25, "Tilt": -25}
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
    ${xcp_values}=    Evaluate    {"GyroXAng": 30, "GyroYAng": 30, "Pitch": 25, "Tilt": 25}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": 30.0, "GyroYAng": 30.0, "Pitch": 25.0, "Tilt": 25.0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

VM-TX-0x301: Send Tx XCP variables and validating on CAN signals for message mAVASCmd
    [Documentation]    Validate TX message 'mAVASCmd' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode": 0,"GearRq_AVAS": 0,"MsgCntr": 0,"VehSpdAVAS": -64,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"AVAS_TestMode": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.AVAS_TestMode","GearRq_AVAS": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.GearRq_AVAS","MsgCntr": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.MsgCntr","VehSpdAVAS": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.VehSpdAVAS","MsgCrc": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}

    Read Multiple Xcp Variables    ${xcp_var_map}

    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode": 0,"GearRq_AVAS": "Park","MsgCntr": 0,"VehSpdAVAS": -64,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mAVASCmd    ${expected_can_signals}    10
    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": 1,"MsgCntr": 7,"VehSpdAVAS": -0.015625,"MsgCrc": 100}



    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}

    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": "Rvrs","MsgCntr": 7,"VehSpdAVAS": -0.015625,"MsgCrc": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mAVASCmd    ${expected_can_signals}    10

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": 3,"MsgCntr": 15,"VehSpdAVAS": 63,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": "Fwd","MsgCntr": 15,"VehSpdAVAS": 63,"MsgCrc": 255}

    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mAVASCmd    ${expected_can_signals}    10




VM-TX-0x74: Send Tx XCP Variables and validating on CAN signals for message mBrkCtrl
    [Documentation]    Validate TX message 'mBrkCtrl' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq": 0, "BrkEnbl_EBCM1U": 0, "BrkEnbl_EBCM2L": 0, "DsblTCS": 0, "EbcmShtdwnRq": 0, "RegBrkAvail": 0, "ClearFltRq": 0, "EbcmMaintModeRq": 0, "HoldRq": 0, "EPBCmd": 0, "EpbCalCmd": 0, "MsgCntr": 0, "MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"BrkTrqRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkTrqRq", "BrkEnbl_EBCM1U": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkEnbl_EBCM1U", "BrkEnbl_EBCM2L": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkEnbl_EBCM2L", "DsblTCS": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.DsblTCS", "EbcmShtdwnRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EbcmShtdwnRq", "RegBrkAvail": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.RegBrkAvail", "ClearFltRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.ClearFltRq", "EbcmMaintModeRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EbcmMaintModeRq", "HoldRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.HoldRq", "EPBCmd": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EPBCmd", "EpbCalCmd": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EpbCalCmd", "MsgCntr": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.MsgCntr", "MsgCrc": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": 0, "BrkEnbl_EBCM1U": 0, "BrkEnbl_EBCM2L": 0, "DsblTCS": "Enable TCS", "EbcmShtdwnRq": "False", "RegBrkAvail": 0, "ClearFltRq": 0, "EbcmMaintModeRq": "False", "HoldRq": 0, "EPBCmd": "Idle", "EpbCalCmd": "Normal Operation", "MsgCntr": 0, "MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq": 3276.75, "BrkEnbl_EBCM1U": 0, "BrkEnbl_EBCM2L": 0, "DsblTCS": 0, "EbcmShtdwnRq": 0, "RegBrkAvail": 102.375, "ClearFltRq": 0, "EbcmMaintModeRq": 0, "HoldRq": 0, "EPBCmd": 1, "EpbCalCmd": 0, "MsgCntr": 7, "MsgCrc": 127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": 3276.75, "BrkEnbl_EBCM1U": 0, "BrkEnbl_EBCM2L": 0, "DsblTCS": "Enable TCS", "EbcmShtdwnRq": "False", "RegBrkAvail": 102.375, "ClearFltRq": 0, "EbcmMaintModeRq": "False", "HoldRq": 0, "EPBCmd": "Engage", "EpbCalCmd": "Normal Operation", "MsgCntr": 7, "MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq": 6553.5, "BrkEnbl_EBCM1U": 1, "BrkEnbl_EBCM2L": 1, "DsblTCS": 1, "EbcmShtdwnRq": 1, "RegBrkAvail": 204.75, "ClearFltRq": 0, "EbcmMaintModeRq": 1, "HoldRq": 1, "EPBCmd": 3, "EpbCalCmd": 1, "MsgCntr": 15, "MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": 6553.5, "BrkEnbl_EBCM1U": 1, "BrkEnbl_EBCM2L": 1, "DsblTCS": "Disable TCS", "EbcmShtdwnRq": "True", "RegBrkAvail": 204.75, "ClearFltRq": 0, "EbcmMaintModeRq": "True", "HoldRq": 1, "EPBCmd": "Fully Release", "EpbCalCmd": "Start EPB Calibration", "MsgCntr": 15, "MsgCrc": 255}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": "VehSafeTest", "BrkEnbl_EBCM1U": 1, "BrkEnbl_EBCM2L": 1, "DsblTCS": "Disable TCS", "EbcmShtdwnRq": "True", "RegBrkAvail": 204.75, "ClearFltRq": 0, "EbcmMaintModeRq": "True", "HoldRq": 1, "EPBCmd": "Fully Release", "EpbCalCmd": "Start EPB Calibration", "MsgCntr": 15, "MsgCrc": 255}

    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30


VM-TX-0x7F: Send Tx XCP variables and validating on CAN signals for message mEbcm2L_WhlSpd
    [Documentation]    Validate TX message 'mEbcm2L_WhlSpd' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL": -20.48,"WhlSpdFR": -20.48,"WhlSpdR": -20.48,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"WhlSpdFL": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFL","WhlSpdFR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFR","WhlSpdR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdR","MsgCntr": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCntr","MsgCrc": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlSpdFL": -20.48,"WhlSpdFR": -20.48,"WhlSpdR": -20.48,"MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL": -0.015,"WhlSpdFR": -0.015,"WhlSpdR": -0.015,"MsgCntr": 7,"MsgCrc": 127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlSpdFL": -0.015,"WhlSpdFR": -0.015,"WhlSpdR": -0.015,"MsgCntr": 7,"MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL": 20.45,"WhlSpdFR": 20.45,"WhlSpdR": 20.45,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlSpdFL": 20.45,"WhlSpdFR": 20.45,"WhlSpdR": 20.45,"MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

VM-TX-0x510: Send Tx XCP variables and validating on CAN signals for message mHmiPadStat
    [Documentation]    Validate TX message 'mHmiPadStat' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO": 0,"Keypad1": 0,"Keypad2": 0,"Keypad3": 0,"Keypad4": 0,"KeypadC": 0,"PadCodeState": 0,"PadActive": 0,"PadLight": 0,"AudioVoice": 0,"AudioMp3": 0,"VolVoice": 0,"VolMp3": 0}
    ${xcp_var_map}=    Evaluate    {"KeypadO": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.KeypadO","Keypad1": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad1","Keypad2": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad2","Keypad3": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad3","Keypad4": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad4","KeypadC": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.KeypadC","PadCodeState": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadCodeState","PadActive": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadActive","PadLight": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadLight","AudioVoice": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.AudioVoice","AudioMp3": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.AudioMp3","VolVoice": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.VolVoice","VolMp3": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.VolMp3",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO": "False","Keypad1": "False","Keypad2": "False","Keypad3": "False","Keypad4": "False","KeypadC": "False","PadCodeState": "N/A","PadActive": "False","PadLight": "False","AudioVoice": "None","AudioMp3": "Stop","VolVoice": 0,"VolMp3": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO": 0,"Keypad1": 0,"Keypad2": 0,"Keypad3": 0,"Keypad4": 0,"KeypadC": 0,"PadCodeState": 3,"PadActive": 0,"PadLight": 0,"AudioVoice": 127,"AudioMp3": 127,"VolVoice": 50,"VolMp3": 50}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO": "False","Keypad1": "False","Keypad2": "False","Keypad3": "False","Keypad4": "False","KeypadC": "False","PadCodeState": "Invalid","PadActive": "False","PadLight": "False","AudioVoice": 127,"AudioMp3": 127,"VolVoice": 50,"VolMp3": 50}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO": 1,"Keypad1": 1,"Keypad2": 1,"Keypad3": 1,"Keypad4": 1,"KeypadC": 1,"PadCodeState": 4,"PadActive": 1,"PadLight": 1,"AudioVoice": 255,"AudioMp3": 255,"VolVoice": 100,"VolMp3": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO": "True","Keypad1": "True","Keypad2": "True","Keypad3": "True","Keypad4": "True","KeypadC": "True","PadCodeState": "Lockout","PadActive": "True","PadLight": "True","AudioVoice": 255,"AudioMp3": 255,"VolVoice": 100,"VolMp3": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

VM-TX-0xC1BA6F9: Send Tx XCP variables and validating on CAN signals for message mHVESSC1_BMS2
    [Documentation]    Validate TX message 'mHVESSC1_BMS2' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"EnblRq": 0,"PwrDownCmd": 0,"HvIsoActiveRq": 0,"HvIsoPassiveRq": 0,"CellBalRq": 0,"EnblIntChrgrRq": 0,"EnblConsent": 0,"HvResistHighRq": 0,"HvResistLowRq": 0,"ThrmlMgmtRq": 0,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"EnblRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.EnblRq","PwrDownCmd": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.PwrDownCmd","HvIsoActiveRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvIsoActiveRq","HvIsoPassiveRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvIsoPassiveRq","CellBalRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.CellBalRq","EnblIntChrgrRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.EnblIntChrgrRq","EnblConsent": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.EnblConsent","HvResistHighRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvResistHighRq","HvResistLowRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvResistLowRq","ThrmlMgmtRq": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.ThrmlMgmtRq","MsgCntr": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.MsgCntr","MsgCrc": "Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EnblRq": "FALSE","PwrDownCmd": "FALSE","HvIsoActiveRq": "FALSE","HvIsoPassiveRq": "FALSE","CellBalRq": "FALSE","EnblIntChrgrRq": "FALSE","EnblConsent": "FALSE","HvResistHighRq": "FALSE","HvResistLowRq": "FALSE","ThrmlMgmtRq": "FALSE","MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mHVESSC1_BMS2    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"EnblRq": 1,"PwrDownCmd": 1,"HvIsoActiveRq": 1,"HvIsoPassiveRq": 1,"CellBalRq": 1,"EnblIntChrgrRq": 1,"EnblConsent": 1,"HvResistHighRq": 1,"HvResistLowRq": 1,"ThrmlMgmtRq": 1,"MsgCntr": 7,"MsgCrc": 127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EnblRq": "TRUE","PwrDownCmd": "TRUE","HvIsoActiveRq": "TRUE","HvIsoPassiveRq": "TRUE","CellBalRq": "TRUE","EnblIntChrgrRq": "TRUE","EnblConsent": "TRUE","HvResistHighRq": "TRUE","HvResistLowRq": "TRUE","ThrmlMgmtRq": "TRUE","MsgCntr": 7,"MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHVESSC1_BMS2    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"EnblRq": 3,"PwrDownCmd": 3,"HvIsoActiveRq": 3,"HvIsoPassiveRq": 3,"CellBalRq": 3,"EnblIntChrgrRq": 3,"EnblConsent": 3,"HvResistHighRq": 3,"HvResistLowRq": 3,"ThrmlMgmtRq": 3,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EnblRq": "N/A","PwrDownCmd": "N/A","HvIsoActiveRq": "N/A","HvIsoPassiveRq": "N/A","CellBalRq": "N/A","EnblIntChrgrRq": "N/A","EnblConsent": "N/A","HvResistHighRq": "N/A","HvResistLowRq": "N/A","ThrmlMgmtRq": "N/A","MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHVESSC1_BMS2    ${expected_can_signals}    30

VM-TX-0x29A: Send Tx XCP variables and validating on CAN signals for message mSbwCtrl
    [Documentation]    Validate TX message 'mSbwCtrl' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"CtrlMode": 0,"AngleCmd": 0,"MtrDcCmd": -100,"MsgCrc": 0,"MsgCntr": 0}
    ${xcp_var_map}=    Evaluate    {"CtrlMode": "Rte_C_SG_mSbwCtrl_adt_66281685D9F13E0F5486D83963895018.CtrlMode","AngleCmd": "Rte_C_SG_mSbwCtrl_adt_66281685D9F13E0F5486D83963895018.AngleCmd","MtrDcCmd": "Rte_C_SG_mSbwCtrl_adt_66281685D9F13E0F5486D83963895018.MtrDcCmd","MsgCrc": "Rte_C_SG_mSbwCtrl_adt_66281685D9F13E0F5486D83963895018.MsgCrc","MsgCntr": "Rte_C_SG_mSbwCtrl_adt_66281685D9F13E0F5486D83963895018.MsgCntr",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CtrlMode": "Local","AngleCmd": 0,"MtrDcCmd": -100,"MsgCrc": 0,"MsgCntr": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mSbwCtrl    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"CtrlMode": 2,"AngleCmd": 511,"MtrDcCmd": 0,"MsgCrc": 127,"MsgCntr": 7}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CtrlMode": "Angle - Gain 2","AngleCmd": 511,"MtrDcCmd": 0,"MsgCrc": 127,"MsgCntr": 7}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"CtrlMode": 5,"AngleCmd": 1023,"MtrDcCmd": 100,"MsgCrc": 255,"MsgCntr": 15}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CtrlMode": "Angle - Gain 5","AngleCmd": 1023,"MtrDcCmd": 100,"MsgCrc": 255,"MsgCntr": 15}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl    ${expected_can_signals}    30

VM-TX-0x29B: Send Tx XCP variables and validating on CAN signals for message mSbwCtrl_Allied
    [Documentation]    Validate TX message 'mSbwCtrl_Allied' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"CommandMode": 0,"CommandVariable1": -8192,"CommandVariable2": -128,"MsgCntr": 0,"EstopReq": 0,"ClearFaults": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"CommandMode": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.CommandMode","CommandVariable1": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.CommandVariable1","CommandVariable2": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.CommandVariable2","MsgCntr": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.MsgCntr","EstopReq": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.EstopReq","ClearFaults": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.ClearFaults","MsgCrc": "Rte_C_SG_mSbwCtrl_Allied_adt_2DA0A523434CBC4C5274519B350888E5.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CommandMode": "Off","CommandVariable1": -8192,"CommandVariable2": -128,"MsgCntr": 0,"EstopReq": "No Estop","ClearFaults": "False","MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mSbwCtrl_Allied    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"CommandMode": 0,"CommandVariable1": 0,"CommandVariable2": 0,"MsgCntr": 7,"EstopReq": 0,"ClearFaults": 0,"MsgCrc": 127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CommandMode": "Off","CommandVariable1": 0,"CommandVariable2": 0,"MsgCntr": 7,"EstopReq": "No Estop","ClearFaults": "False","MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl_Allied    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"CommandMode": 0,"CommandVariable1": 8192,"CommandVariable2": 127.99609375,"MsgCntr": 15,"EstopReq": 1,"ClearFaults": 1,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CommandMode": "Off","CommandVariable1": 8192,"CommandVariable2": 127.99609375,"MsgCntr": 15,"EstopReq": "ESTOP Requested","ClearFaults": "True","MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl_Allied    ${expected_can_signals}    30

VM-TX-0x660: Send Tx XCP variables and validating on CAN signals for message mVcuEcuStat
    [Documentation]    Validate TX message 'mVcuEcuStat' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"WakeHoldStat": 0,"EcuModingStat": 0,"EcuWakeSource": 0,"VcuLvOk": 0,"DrvpOk": 0,"SnsrPwrOk": 0,"NvmOk": 0,"Hso16WakeHoldOutCmd": 0,"Hso16Status": 0,"RaptorWakeSource": 0,"MomSwPress": 0,"MprdEnCmd": 0,"MomSwInRaw": 0,"CanChk": 0,"EthChk": 0,"LinChk": 0,"FlashChk": 0,"IdleTmr": 0}
    ${xcp_var_map}=    Evaluate    {"WakeHoldStat": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.WakeHoldStat","EcuModingStat": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.EcuModingStat","EcuWakeSource": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.EcuWakeSource","VcuLvOk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.VcuLvOk","DrvpOk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.DrvpOk","SnsrPwrOk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.SnsrPwrOk","NvmOk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.NvmOk","Hso16WakeHoldOutCmd": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.Hso16WakeHoldOutCmd","Hso16Status": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.Hso16Status","RaptorWakeSource": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.RaptorWakeSource","MomSwPress": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.MomSwPress","MprdEnCmd": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.MprdEnCmd","MomSwInRaw": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.MomSwInRaw","CanChk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.CanChk","EthChk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.EthChk","LinChk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.LinChk","FlashChk": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.FlashChk","IdleTmr": "Rte_C_SG_mVcuEcuStat_adt_F182D5FB5A6225C493C9C7BCD96EF884.IdleTmr",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WakeHoldStat": "Undetermined","EcuModingStat": "None","EcuWakeSource": "Pending","VcuLvOk": 0,"DrvpOk": 0,"SnsrPwrOk": 0,"NvmOk": 0,"Hso16WakeHoldOutCmd": 0,"Hso16Status": "NO FAULT","RaptorWakeSource": "None","MomSwPress": 0,"MprdEnCmd": 0,"MomSwInRaw": 0,"CanChk": 0,"EthChk": 0,"LinChk": 0,"FlashChk": 0,"IdleTmr": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuEcuStat    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"WakeHoldStat": 1,"EcuModingStat": 3,"EcuWakeSource": 3,"VcuLvOk": 0,"DrvpOk": 0,"SnsrPwrOk": 0,"NvmOk": 0,"Hso16WakeHoldOutCmd": 0,"Hso16Status": 2,"RaptorWakeSource": 40,"MomSwPress": 0,"MprdEnCmd": 0,"MomSwInRaw": 0,"CanChk": 0,"EthChk": 0,"LinChk": 0,"FlashChk": 0,"IdleTmr": 5000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WakeHoldStat": "WakeHold","EcuModingStat": "EcuInit","EcuWakeSource": "CGM_CAN","VcuLvOk": 0,"DrvpOk": 0,"SnsrPwrOk": 0,"NvmOk": 0,"Hso16WakeHoldOutCmd": 0,"Hso16Status": "SHORTED","RaptorWakeSource": 40,"MomSwPress": 0,"MprdEnCmd": 0,"MomSwInRaw": 0,"CanChk": 0,"EthChk": 0,"LinChk": 0,"FlashChk": 0,"IdleTmr": 5000}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuEcuStat    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"WakeHoldStat": 3,"EcuModingStat": 7,"EcuWakeSource": 7,"VcuLvOk": 1,"DrvpOk": 1,"SnsrPwrOk": 1,"NvmOk": 1,"Hso16WakeHoldOutCmd": 1,"Hso16Status": 4,"RaptorWakeSource": 60,"MomSwPress": 1,"MprdEnCmd": 1,"MomSwInRaw": 1,"CanChk": 1,"EthChk": 1,"LinChk": 1,"FlashChk": 1,"IdleTmr": 10000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WakeHoldStat": "N/A","EcuModingStat": "EcuSleep","EcuWakeSource": "VBatt","VcuLvOk": 1,"DrvpOk": 1,"SnsrPwrOk": 1,"NvmOk": 1,"Hso16WakeHoldOutCmd": 1,"Hso16Status": "OPEN LOAD","RaptorWakeSource": 60,"MomSwPress": 1,"MprdEnCmd": 1,"MomSwInRaw": 1,"CanChk": 1,"EthChk": 1,"LinChk": 1,"FlashChk": 1,"IdleTmr": 10000}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuEcuStat    ${expected_can_signals}    30

VM-TX-0x204: Send Tx XCP variables and validating on CAN signals for message mVcuFaults
    [Documentation]    Validate TX message 'mVcuFaults' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"Flt_12Volt": 0,"Flt_48Volt": 0,"Flt_MstrSwitch": 0,"Flt_SafeCircuit": 0,"Flt_LocWhd": 0,"Flt_LocAdcu": 0,"Flt_LocEbcm1": 0,"Flt_LocEbcm2": 0,"Flt_LocEss": 0,"Flt_LocVsc": 0,"Flt_LocAVAS": 0,"Flt_LocSbw": 0,"Flt_LocTc": 0,"Flt_WriteEeprom": 0,"Flt_ReadEeprom": 0,"Flt_12vSys": 0,"Flt_Bay1BeltSns": 0,"Flt_Bay1MtrPos": 0,"Flt_Bay1Mtr": 0,"Flt_Bay1Pwr12v": 0,"Flt_LocBe": 0,"Flt_LocTo": 0,"Flt_Bay2BeltSns": 0,"Flt_Bay2MtrPos": 0,"Flt_Bay2Mtr": 0,"Flt_Bay2Pwr12v": 0,"Flt_LocLrr": 0,"Flt_ImuSns": 0,"Flt_ImuRst": 0,"Flt_LocFcmCan": 0,"Flt_Keypad4": 0,"Flt_KeypadC": 0,"Flt_KeypadLight": 0,"Flt_SbwEnbl": 0,"Flt_SafeExtLight": 0,"Flt_SafeProp": 0,"Flt_SafeSteer": 0,"Flt_LocEpb": 0,"Flt_BrkPrsr": 0,"Flt_EpbSys": 0,"Flt_BrkSafeSys": 0,"Flt_CntctrStat": 0,"Flt_InvalidGearRq": 0,"Flt_WhdEnbl": 0,"Flt_DcdcEnbl": 0}
    ${xcp_var_map}=    Evaluate    {"Flt_12Volt": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_12Volt","Flt_48Volt": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_48Volt","Flt_MstrSwitch": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_MstrSwitch","Flt_SafeCircuit": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeCircuit","Flt_LocWhd": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocWhd","Flt_LocAdcu": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocAdcu","Flt_LocEbcm1": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEbcm1","Flt_LocEbcm2": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEbcm2","Flt_LocEss": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEss","Flt_LocVsc": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocVsc","Flt_LocAVAS": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocAVAS","Flt_LocSbw": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocSbw","Flt_LocTc": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocTc","Flt_WriteEeprom": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_WriteEeprom","Flt_ReadEeprom": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_ReadEeprom","Flt_12vSys": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_12vSys","Flt_Bay1BeltSns": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1BeltSns","Flt_Bay1MtrPos": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1MtrPos","Flt_Bay1Mtr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1Mtr","Flt_Bay1Pwr12v": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1Pwr12v","Flt_LocBe": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocBe","Flt_LocTo": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocTo","Flt_Bay2BeltSns": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2BeltSns","Flt_Bay2MtrPos": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2MtrPos","Flt_Bay2Mtr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2Mtr","Flt_Bay2Pwr12v": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2Pwr12v","Flt_LocLrr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocLrr","Flt_ImuSns": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_ImuSns","Flt_ImuRst": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_ImuRst","Flt_LocFcmCan": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocFcmCan","Flt_Keypad4": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Keypad4","Flt_KeypadC": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_KeypadC","Flt_KeypadLight": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_KeypadLight","Flt_SbwEnbl": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SbwEnbl","Flt_SafeExtLight": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeExtLight","Flt_SafeProp": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeProp","Flt_SafeSteer": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeSteer","Flt_LocEpb": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEpb","Flt_BrkPrsr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_BrkPrsr","Flt_EpbSys": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_EpbSys","Flt_BrkSafeSys": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_BrkSafeSys","Flt_CntctrStat": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_CntctrStat","Flt_InvalidGearRq": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_InvalidGearRq","Flt_WhdEnbl": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_WhdEnbl","Flt_DcdcEnbl": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_DcdcEnbl",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Flt_12Volt": "OK","Flt_48Volt": "OK","Flt_MstrSwitch": "OK","Flt_SafeCircuit": "OK","Flt_LocWhd": "OK","Flt_LocAdcu": 0,"Flt_LocEbcm1": "OK","Flt_LocEbcm2": "OK","Flt_LocEss": "OK","Flt_LocVsc": "OK","Flt_LocAVAS": "OK","Flt_LocSbw": "OK","Flt_LocTc": "OK","Flt_WriteEeprom": "OK","Flt_ReadEeprom": "OK","Flt_12vSys": "OK","Flt_Bay1BeltSns": "OK","Flt_Bay1MtrPos": "OK","Flt_Bay1Mtr": "OK","Flt_Bay1Pwr12v": "OK","Flt_LocBe": "OK","Flt_LocTo": "OK","Flt_Bay2BeltSns": "OK","Flt_Bay2MtrPos": "OK","Flt_Bay2Mtr": "OK","Flt_Bay2Pwr12v": "OK","Flt_LocLrr": "OK","Flt_ImuSns": "OK","Flt_ImuRst": "OK","Flt_LocFcmCan": "OK","Flt_Keypad4": "OK","Flt_KeypadC": "OK","Flt_KeypadLight": "OK","Flt_SbwEnbl": "OK","Flt_SafeExtLight": "OK","Flt_SafeProp": "OK","Flt_SafeSteer": "OK","Flt_LocEpb": "OK","Flt_BrkPrsr": "OK","Flt_EpbSys": "OK","Flt_BrkSafeSys": "OK","Flt_CntctrStat": "OK","Flt_InvalidGearRq": "OK","Flt_WhdEnbl": "OK","Flt_DcdcEnbl": "OK"}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuFaults    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"Flt_12Volt": 1,"Flt_48Volt": 1,"Flt_MstrSwitch": 1,"Flt_SafeCircuit": 1,"Flt_LocWhd": 1,"Flt_LocAdcu": 1,"Flt_LocEbcm1": 1,"Flt_LocEbcm2": 1,"Flt_LocEss": 1,"Flt_LocVsc": 1,"Flt_LocAVAS": 1,"Flt_LocSbw": 1,"Flt_LocTc": 1,"Flt_WriteEeprom": 1,"Flt_ReadEeprom": 1,"Flt_12vSys": 1,"Flt_Bay1BeltSns": 1,"Flt_Bay1MtrPos": 1,"Flt_Bay1Mtr": 1,"Flt_Bay1Pwr12v": 1,"Flt_LocBe": 1,"Flt_LocTo": 1,"Flt_Bay2BeltSns": 1,"Flt_Bay2MtrPos": 1,"Flt_Bay2Mtr": 1,"Flt_Bay2Pwr12v": 1,"Flt_LocLrr": 1,"Flt_ImuSns": 1,"Flt_ImuRst": 1,"Flt_LocFcmCan": 1,"Flt_Keypad4": 1,"Flt_KeypadC": 1,"Flt_KeypadLight": 1,"Flt_SbwEnbl": 1,"Flt_SafeExtLight": 1,"Flt_SafeProp": 1,"Flt_SafeSteer": 1,"Flt_LocEpb": 1,"Flt_BrkPrsr": 1,"Flt_EpbSys": 1,"Flt_BrkSafeSys": 1,"Flt_CntctrStat": 1,"Flt_InvalidGearRq": 1,"Flt_WhdEnbl": 1,"Flt_DcdcEnbl": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Flt_12Volt": "High","Flt_48Volt": "High","Flt_MstrSwitch": "Fault","Flt_SafeCircuit": "Fault","Flt_LocWhd": "Active","Flt_LocAdcu": 1,"Flt_LocEbcm1": "Active","Flt_LocEbcm2": "Active","Flt_LocEss": "Active","Flt_LocVsc": "Active","Flt_LocAVAS": "Active","Flt_LocSbw": "Active","Flt_LocTc": "Active","Flt_WriteEeprom": "Fault","Flt_ReadEeprom": "Fault","Flt_12vSys": "Fault","Flt_Bay1BeltSns": "Fault","Flt_Bay1MtrPos": "Fault","Flt_Bay1Mtr": "Fault","Flt_Bay1Pwr12v": "Fault","Flt_LocBe": "Active","Flt_LocTo": "Active","Flt_Bay2BeltSns": "Fault","Flt_Bay2MtrPos": "Fault","Flt_Bay2Mtr": "Fault","Flt_Bay2Pwr12v": "Fault","Flt_LocLrr": "Fault","Flt_ImuSns": "Fault","Flt_ImuRst": "Fault","Flt_LocFcmCan": "Fault","Flt_Keypad4": "Fault","Flt_KeypadC": "Fault","Flt_KeypadLight": "Fault","Flt_SbwEnbl": "Fault","Flt_SafeExtLight": "Command","Flt_SafeProp": "Command","Flt_SafeSteer": "Command","Flt_LocEpb": "Active","Flt_BrkPrsr": "Fault","Flt_EpbSys": "Fault","Flt_BrkSafeSys": "Fault","Flt_CntctrStat": "Stuck Open","Flt_InvalidGearRq": "Fault","Flt_WhdEnbl": "Fault","Flt_DcdcEnbl": "Fault"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuFaults    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"Flt_12Volt": 2,"Flt_48Volt": 2,"Flt_MstrSwitch": 1,"Flt_SafeCircuit": 1,"Flt_LocWhd": 3,"Flt_LocAdcu": 2,"Flt_LocEbcm1": 3,"Flt_LocEbcm2": 3,"Flt_LocEss": 3,"Flt_LocVsc": 3,"Flt_LocAVAS": 3,"Flt_LocSbw": 3,"Flt_LocTc": 3,"Flt_WriteEeprom": 1,"Flt_ReadEeprom": 1,"Flt_12vSys": 1,"Flt_Bay1BeltSns": 1,"Flt_Bay1MtrPos": 1,"Flt_Bay1Mtr": 1,"Flt_Bay1Pwr12v": 1,"Flt_LocBe": 3,"Flt_LocTo": 3,"Flt_Bay2BeltSns": 1,"Flt_Bay2MtrPos": 1,"Flt_Bay2Mtr": 1,"Flt_Bay2Pwr12v": 1,"Flt_LocLrr": 1,"Flt_ImuSns": 1,"Flt_ImuRst": 1,"Flt_LocFcmCan": 1,"Flt_Keypad4": 1,"Flt_KeypadC": 1,"Flt_KeypadLight": 1,"Flt_SbwEnbl": 1,"Flt_SafeExtLight": 3,"Flt_SafeProp": 3,"Flt_SafeSteer": 3,"Flt_LocEpb": 3,"Flt_BrkPrsr": 1,"Flt_EpbSys": 1,"Flt_BrkSafeSys": 1,"Flt_CntctrStat": 3,"Flt_InvalidGearRq": 1,"Flt_WhdEnbl": 1,"Flt_DcdcEnbl": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Flt_12Volt": "Low","Flt_48Volt": "Low","Flt_MstrSwitch": "Fault","Flt_SafeCircuit": "Fault","Flt_LocWhd": "Stored","Flt_LocAdcu": 2,"Flt_LocEbcm1": "Stored","Flt_LocEbcm2": "Stored","Flt_LocEss": "Stored","Flt_LocVsc": "Stored","Flt_LocAVAS": "Stored","Flt_LocSbw": "Stored","Flt_LocTc": "Stored","Flt_WriteEeprom": "Fault","Flt_ReadEeprom": "Fault","Flt_12vSys": "Fault","Flt_Bay1BeltSns": "Fault","Flt_Bay1MtrPos": "Fault","Flt_Bay1Mtr": "Fault","Flt_Bay1Pwr12v": "Fault","Flt_LocBe": "Stored","Flt_LocTo": "Stored","Flt_Bay2BeltSns": "Fault","Flt_Bay2MtrPos": "Fault","Flt_Bay2Mtr": "Fault","Flt_Bay2Pwr12v": "Fault","Flt_LocLrr": "Fault","Flt_ImuSns": "Fault","Flt_ImuRst": "Fault","Flt_LocFcmCan": "Fault","Flt_Keypad4": "Fault","Flt_KeypadC": "Fault","Flt_KeypadLight": "Fault","Flt_SbwEnbl": "Fault","Flt_SafeExtLight": "General","Flt_SafeProp": "General","Flt_SafeSteer": "General","Flt_LocEpb": "Stored","Flt_BrkPrsr": "Fault","Flt_EpbSys": "Fault","Flt_BrkSafeSys": "Fault","Flt_CntctrStat": "Unknown","Flt_InvalidGearRq": "Fault","Flt_WhdEnbl": "Fault","Flt_DcdcEnbl": "Fault"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuFaults    ${expected_can_signals}    30

VM-TX-0x206: Send Tx XCP variables and validating on CAN signals for message mVcuImuAngVel
    [Documentation]    Validate TX message 'mVcuImuAngVel' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate": -327.68,"Y_Angular_Rate": -327.68,"Z_Angular_Rate": -327.68,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"X_Angular_Rate": "Rte_C_SG_mVcuImuAngVel_adt_849E84BE22EE12C1ADA23B43C80D187B.X_Angular_Rate","Y_Angular_Rate": "Rte_C_SG_mVcuImuAngVel_adt_849E84BE22EE12C1ADA23B43C80D187B.Y_Angular_Rate","Z_Angular_Rate": "Rte_C_SG_mVcuImuAngVel_adt_849E84BE22EE12C1ADA23B43C80D187B.Z_Angular_Rate","MsgCntr": "Rte_C_SG_mVcuImuAngVel_adt_849E84BE22EE12C1ADA23B43C80D187B.MsgCntr","MsgCrc": "Rte_C_SG_mVcuImuAngVel_adt_849E84BE22EE12C1ADA23B43C80D187B.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate": -327.68,"Y_Angular_Rate": -327.68,"Z_Angular_Rate": -327.68,"MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuImuAngVel    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate": 0,"Y_Angular_Rate": 0,"Z_Angular_Rate": 0,"MsgCntr": 7,"MsgCrc": 150}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate": 0,"Y_Angular_Rate": 0,"Z_Angular_Rate": 0,"MsgCntr": 7,"MsgCrc": 150}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate": 327.67,"Y_Angular_Rate": 327.67,"Z_Angular_Rate": 327.67,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate": "Fault", "Y_Angular_Rate": "Fault", "Z_Angular_Rate": "Fault", "MsgCntr": 15, "MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel    ${expected_can_signals}    30

VM-TX-0x20C: Send Tx XCP variables and validating on CAN signals for message mVcuImuAngVel_Filt
    [Documentation]    Validate TX message 'mVcuImuAngVel_Filt' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate_Filt": -327.68,"Y_Angular_Rate_Filt": -327.68,"Z_Angular_Rate_Filt": -327.68,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"X_Angular_Rate_Filt": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.X_Angular_Rate_Filt","Y_Angular_Rate_Filt": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.Y_Angular_Rate_Filt","Z_Angular_Rate_Filt": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.Z_Angular_Rate_Filt","MsgCntr": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.MsgCntr","MsgCrc": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate_Filt": -327.68, "Y_Angular_Rate_Filt": -327.68, "Z_Angular_Rate_Filt": -327.68, "MsgCntr": 0, "MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel_Filt    ${expected_can_signals}    30

    Log    Writing mid value to the XCP variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate_Filt": 0, "Y_Angular_Rate_Filt": 0, "Z_Angular_Rate_Filt": 0, "MsgCntr": 7, "MsgCrc": 150}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate_Filt": 0, "Y_Angular_Rate_Filt": 0, "Z_Angular_Rate_Filt": 0, "MsgCntr": 7, "MsgCrc": 150}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel_Filt    ${expected_can_signals}    30

    Log    Writing max value to the XCP variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate_Filt": 327.67, "Y_Angular_Rate_Filt": 327.67, "Z_Angular_Rate_Filt": 327.67, "MsgCntr": 15, "MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}

    # If your system translates max values into "Fault", adjust expected values accordingly
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate_Filt": "Fault", "Y_Angular_Rate_Filt": "Fault", "Z_Angular_Rate_Filt": "Fault", "MsgCntr": 15, "MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel_Filt    ${expected_can_signals}    30


VM-TX-0x205: Send Tx XCP variables and validating on CAN signals for message mVcuImuLinAccel
    [Documentation]    Validate TX message 'mVcuImuLinAccel' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Accel": -32.768,"Y_Accel": -32.768,"Z_Accel": -32.768,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"X_Accel": "Rte_C_SG_mVcuImuLinAccel_adt_7E5753A28CC9859506FA473B5EFFFC44.X_Accel","Y_Accel": "Rte_C_SG_mVcuImuLinAccel_adt_7E5753A28CC9859506FA473B5EFFFC44.Y_Accel","Z_Accel": "Rte_C_SG_mVcuImuLinAccel_adt_7E5753A28CC9859506FA473B5EFFFC44.Z_Accel","MsgCntr": "Rte_C_SG_mVcuImuLinAccel_adt_7E5753A28CC9859506FA473B5EFFFC44.MsgCntr","MsgCrc": "Rte_C_SG_mVcuImuLinAccel_adt_7E5753A28CC9859506FA473B5EFFFC44.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Accel": -32.768,"Y_Accel": -32.768,"Z_Accel": -32.768,"MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuImuLinAccel    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Accel": 0,"Y_Accel": 0,"Z_Accel": 0,"MsgCntr": 7,"MsgCrc": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Accel": 0,"Y_Accel": 0,"Z_Accel": 0,"MsgCntr": 7,"MsgCrc": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuLinAccel    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Accel": 32.767,"Y_Accel": 32.767,"Z_Accel": 32.767,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Accel": 32.767,"Y_Accel": 32.767,"Z_Accel": 32.767,"MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuLinAccel    ${expected_can_signals}    30

VM-TX-0x20B: Send Tx XCP variables and validating on CAN signals for message mVcuImuLinAccel_Filt
    [Documentation]    Validate TX message 'mVcuImuLinAccel_Filt' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Accel_Filt": -32.768,"Y_Accel_Filt": -32.768,"Z_Accel_Filt": -32.768,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"X_Accel_Filt": "Rte_C_SG_mVcuImuLinAccel_Filt_adt_5935350E9CC7796784AB54DDF738B26D.X_Accel_Filt","Y_Accel_Filt": "Rte_C_SG_mVcuImuLinAccel_Filt_adt_5935350E9CC7796784AB54DDF738B26D.Y_Accel_Filt","Z_Accel_Filt": "Rte_C_SG_mVcuImuLinAccel_Filt_adt_5935350E9CC7796784AB54DDF738B26D.Z_Accel_Filt","MsgCntr": "Rte_C_SG_mVcuImuLinAccel_Filt_adt_5935350E9CC7796784AB54DDF738B26D.MsgCntr","MsgCrc": "Rte_C_SG_mVcuImuLinAccel_Filt_adt_5935350E9CC7796784AB54DDF738B26D.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Accel_Filt": -32.768,"Y_Accel_Filt": -32.768,"Z_Accel_Filt": -32.768,"MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuImuLinAccel_Filt    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Accel_Filt": 0,"Y_Accel_Filt": 0,"Z_Accel_Filt": 0,"MsgCntr": 7,"MsgCrc": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Accel_Filt": 0,"Y_Accel_Filt": 0,"Z_Accel_Filt": 0,"MsgCntr": 7,"MsgCrc": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuLinAccel_Filt    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Accel_Filt": 32.767,"Y_Accel_Filt": 32.767,"Z_Accel_Filt": 32.767,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Accel_Filt": 32.767,"Y_Accel_Filt": 32.767,"Z_Accel_Filt": 32.767,"MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuLinAccel_Filt    ${expected_can_signals}    30

VM-TX-0x302: Send Tx XCP variables and validating on CAN signals for message mVcuSys
    [Documentation]    Validate TX message 'mVcuSys' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"AdcuShtdwnRq": 0,"EbcmShtdwnRq": 0,"MtrTrqLmtAccel": 0,"MtrTrqLmtDecel": 0,"EstopTest": 0,"VcuStateShtdwn": 0,"VcuStateInit": 0,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"AdcuShtdwnRq": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.AdcuShtdwnRq","EbcmShtdwnRq": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.EbcmShtdwnRq","MtrTrqLmtAccel": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.MtrTrqLmtAccel","MtrTrqLmtDecel": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.MtrTrqLmtDecel","EstopTest": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.EstopTest","VcuStateShtdwn": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.VcuStateShtdwn","VcuStateInit": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.VcuStateInit","MsgCntr": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.MsgCntr","MsgCrc": "Rte_C_SG_mVcuSys_adt_C0EBA4D3F6709B0C7CA8B46EC9394FBE.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AdcuShtdwnRq": "False","EbcmShtdwnRq": "False","MtrTrqLmtAccel": 0,"MtrTrqLmtDecel": 0,"EstopTest": "Start Test","VcuStateShtdwn": "N/A","VcuStateInit": "N/A","MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuSys    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AdcuShtdwnRq": 0,"EbcmShtdwnRq": 0,"MtrTrqLmtAccel": 127,"MtrTrqLmtDecel": 127,"EstopTest": 3,"VcuStateShtdwn": 1,"VcuStateInit": 1,"MsgCntr": 7,"MsgCrc": 127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AdcuShtdwnRq": "False","EbcmShtdwnRq": "False","MtrTrqLmtAccel": 127,"MtrTrqLmtDecel": 127,"EstopTest": "Pass","VcuStateShtdwn": "EPB_Check","VcuStateInit": "Init_VCU","MsgCntr": 7,"MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuSys    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AdcuShtdwnRq": 1,"EbcmShtdwnRq": 1,"MtrTrqLmtAccel": 255,"MtrTrqLmtDecel": 255,"EstopTest": 7,"VcuStateShtdwn": 0,"VcuStateInit": 0,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AdcuShtdwnRq": "True","EbcmShtdwnRq": "True","MtrTrqLmtAccel": 255,"MtrTrqLmtDecel": 255,"EstopTest": "N/A","VcuStateShtdwn": "N/A","VcuStateInit": "N/A","MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuSys    ${expected_can_signals}    30

VM-TX-0x1CFFBACC: Send Tx XCP variables and validating on CAN signals for message mVcuVehID
    [Documentation]    Validate TX message 'mVcuVehID' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehId_Char1": 0,"VehId_Char2": 0,"VehId_Char3": 0,"VehId_Char4": 0,"VehId_Char5": 0,"VehId_Char6": 0,"VehId_Char7": 0,"VehId_Char8": 0}
    ${xcp_var_map}=    Evaluate    {"VehId_Char1": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char1","VehId_Char2": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char2","VehId_Char3": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char3","VehId_Char4": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char4","VehId_Char5": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char5","VehId_Char6": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char6","VehId_Char7": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char7","VehId_Char8": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char8",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehId_Char1": 0,"VehId_Char2": 0,"VehId_Char3": 0,"VehId_Char4": 0,"VehId_Char5": 0,"VehId_Char6": 0,"VehId_Char7": 0,"VehId_Char8": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuVehID    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehId_Char1": 35,"VehId_Char2": 35,"VehId_Char3": 35,"VehId_Char4": 35,"VehId_Char5": 35,"VehId_Char6": 35,"VehId_Char7": 35,"VehId_Char8": 35}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehId_Char1": 35,"VehId_Char2": 35,"VehId_Char3": 35,"VehId_Char4": 35,"VehId_Char5": 35,"VehId_Char6": 35,"VehId_Char7": 35,"VehId_Char8": 35}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuVehID    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehId_Char1": 45,"VehId_Char2": 45,"VehId_Char3": 45,"VehId_Char4": 45,"VehId_Char5": 45,"VehId_Char6": 45,"VehId_Char7": 45,"VehId_Char8": 45}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehId_Char1": 45,"VehId_Char2": 45,"VehId_Char3": 45,"VehId_Char4": 45,"VehId_Char5": 45,"VehId_Char6": 45,"VehId_Char7": 45,"VehId_Char8": 45}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuVehID    ${expected_can_signals}    30

VM-TX-0x7b: Send Tx XCP variables and validating on CAN signals for message mEbcm2L_Stat2
    [Documentation]    Validate TX message 'mEbcm2L_Stat2' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 0, "MtrCurrEst": 0, "LvVolt": 0, "EscAvail": 0, "EbdActv": 0, "ToShtdwn": 0, "HoldStat": 0, "MsgCntr": 0, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 0,}
    ${xcp_var_map}=    Evaluate    {"TcsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsAvail", "AbsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsAvail", "VehSpdEbcm": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.VehSpdEbcm", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "LvVolt": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.LvVolt", "EscAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscAvail", "EbdActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EbdActv", "ToShtdwn": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.ToShtdwn", "HoldStat": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.HoldStat", "MsgCntr": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCntr", "AebRdy": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AebRdy", "EscActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscActv", "TcsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsActv", "AbsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsActv", "MsgCrc": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 0, "MtrCurrEst": 0, "LvVolt": 0, "EscAvail": "Not_Avail", "EbdActv": 0, "ToShtdwn": "False", "HoldStat": "No_Hold_Requested", "MsgCntr": 0, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 0,}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mEbcm2L_Stat2    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 10.25, "MtrCurrEst": 128, "LvVolt": 12.25, "EscAvail": 1, "EbdActv": 0, "ToShtdwn": 1, "HoldStat": 1, "MsgCntr": 7, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 7,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 10.25, "MtrCurrEst": 128, "LvVolt": 12.25, "EscAvail": "Level_1", "EbdActv": 0, "ToShtdwn": "Pend_1s", "HoldStat": "Controlled", "MsgCntr": 7, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 7,}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mEbcm2L_Stat2    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TcsAvail": 1, "AbsAvail": 1, "VehSpdEbcm": 1, "MtrCurrEst": 255, "LvVolt": 25.5, "EscAvail": 2, "EbdActv": 1, "ToShtdwn": 1, "HoldStat": 2, "MsgCntr": 15, "AebRdy": 1, "EscActv": 1, "TcsActv": 0, "AbsActv": 1, "MsgCrc": 15,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TcsAvail": 1, "AbsAvail": 1, "VehSpdEbcm": 1, "MtrCurrEst": 255, "LvVolt": 25.5, "EscAvail": "Level_2", "EbdActv": 1, "ToShtdwn": 1, "HoldStat": "Released", "MsgCntr": 15, "AebRdy": 1, "EscActv": 1, "TcsActv": 0, "AbsActv": 1, "MsgCrc": 15,}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mEbcm2L_Stat2    ${expected_can_signals}    30

VM-TX-0x13: Send Tx XCP variables and validating on CAN signals for message mWhdCtrl2
    [Documentation]    Validate TX message 'mWhdCtrl2' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VoltLmtMax":35,"VoltLmtMin":35,"CurrLmtMtr":0,"CurrLmtRegen":0,"TrqLmtMtr":0,"TrqLmtRegen":0,"WhdShtdwnRq":0,"ClearFltRq":0,"MsgCntr":0,"MsgCrc":0 }
    ${xcp_var_map}=    Evaluate    {"VoltLmtMax": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.VoltLmtMax","VoltLmtMin": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.VoltLmtMin","CurrLmtMtr": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.CurrLmtMtr","CurrLmtRegen": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.CurrLmtRegen"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VoltLmtMax":35,"VoltLmtMin":35,"CurrLmtMtr":0,"CurrLmtRegen":0,"TrqLmtMtr":0,"TrqLmtRegen":0,"WhdShtdwnRq":"False","ClearFltRq":"False","MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mWhdCtrl2    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"VoltLmtMax":47.75,"VoltLmtMin":47.75,"CurrLmtMtr":63,"CurrLmtRegen":63,"TrqLmtMtr":0,"TrqLmtRegen":0,"WhdShtdwnRq":0,"ClearFltRq":0,"MsgCntr":0,"MsgCrc":0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VoltLmtMax":47.75,"VoltLmtMin":47.75,"CurrLmtMtr":63,"CurrLmtRegen":63,"TrqLmtMtr":0,"TrqLmtRegen":0,"WhdShtdwnRq":"False","ClearFltRq":"False","MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mWhdCtrl2    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VoltLmtMax":60.5,"VoltLmtMin":60.5,"CurrLmtMtr":127,"CurrLmtRegen":127,"TrqLmtMtr":254,"TrqLmtRegen":254,"WhdShtdwnRq":1,"ClearFltRq":1,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VoltLmtMax":60.5,"VoltLmtMin":60.5,"CurrLmtMtr":127,"CurrLmtRegen":127,"TrqLmtMtr":254,"TrqLmtRegen":254,"WhdShtdwnRq":"True","ClearFltRq":"True","MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mWhdCtrl2    ${expected_can_signals}    30

VM-TX-0x666: Send Tx XCP variables and validating on CAN signals for message VcuTask1msStat
    [Documentation]    Validate TX message 'VcuTask1msStat' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":0,"MaxUtilization":0,"MaxExecTime":0}
    ${xcp_var_map}=    Evaluate    {"MaxExecTimeValid": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxExecTimeValid","MaxUtilizationValid": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxUtilizationValid","CpuUtilizationValid": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.CpuUtilizationValid","CpuUtilization": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.CpuUtilization","MaxUtilization": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxUtilization","MaxExecTime": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxExecTime"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":0,"MaxUtilization":0,"MaxExecTime":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    VcuTask1msStat    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":0,"MaxUtilization":0,"MaxExecTime":0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":0,"MaxUtilization":0,"MaxExecTime":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    VcuTask1msStat    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"MaxExecTimeValid":1,"MaxUtilizationValid":1,"CpuUtilizationValid":1,"CpuUtilization":1000,"MaxUtilization":1000,"MaxExecTime":1000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MaxExecTimeValid":1,"MaxUtilizationValid":1,"CpuUtilizationValid":1,"CpuUtilization":1000,"MaxUtilization":1000,"MaxExecTime":1000}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    VcuTask1msStat    ${expected_can_signals}    30

VM-TX-0x208: Send Tx XCP variables and validating on CAN signals for message mVehState2
    [Documentation]    Validate TX message 'mVehState2' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ActGndWhlAng":-327.68,"maxDecelAvail":-32,"maxAccelAvail":-32,"MsgCntr":0,"maxSpeedAllowed":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"ActGndWhlAng": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.ActGndWhlAng","maxDecelAvail": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.maxDecelAvail","maxAccelAvail": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.maxAccelAvail","MsgCntr": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.MsgCntr","maxSpeedAllowed": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.maxSpeedAllowed","MsgCrc": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ActGndWhlAng":-327.68,"maxDecelAvail":-32,"maxAccelAvail":-32,"MsgCntr":0,"maxSpeedAllowed":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState2    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"ActGndWhlAng":-0.005,"maxDecelAvail":-0.0078125,"maxAccelAvail":-0.0078125,"MsgCntr":0,"maxSpeedAllowed":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ActGndWhlAng":-0.005,"maxDecelAvail":-0.0078125,"maxAccelAvail":-0.0078125,"MsgCntr":0,"maxSpeedAllowed":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState2    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ActGndWhlAng":327.67,"maxDecelAvail":31.984375,"maxAccelAvail":31.984375,"MsgCntr":15,"maxSpeedAllowed":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ActGndWhlAng":327.67,"maxDecelAvail":31.984375,"maxAccelAvail":31.984375,"MsgCntr":15,"maxSpeedAllowed":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState2    ${expected_can_signals}    30

VM-TX-0x209: Send Tx XCP variables and validating on CAN signals for message mVehState3
    [Documentation]    Validate TX message 'mVehState3' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":-20.48,"ROI":-1.28,"TargetVehSpd_mps":-20.48,"Aeb_Active":0,"AebSrc":0,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"ArbVehSpd_mps_Valid": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.ArbVehSpd_mps_Valid", "ArbVehSpd_mps": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.ArbVehSpd_mps", "ROI": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.ROI", "TargetVehSpd_mps": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.TargetVehSpd_mps", "Aeb_Active": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.Aeb_Active","AebSrc": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.AebSrc", "MsgCntr": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.MsgCntr", "MsgCrc": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ArbVehSpd_mps_Valid":"Invalid","ArbVehSpd_mps":-20.48,"ROI":-1.28,"TargetVehSpd_mps":-20.48,"Aeb_Active":"No AEB event active","AebSrc":"No AEB Event","MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState3    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":-0.005,"ROI":-0.005,"TargetVehSpd_mps":-0.005,"Aeb_Active":0,"AebSrc":0,"MsgCntr":0,"MsgCrc":0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ArbVehSpd_mps_Valid":"Invalid","ArbVehSpd_mps":-0.005,"ROI":-0.005,"TargetVehSpd_mps":-0.005,"Aeb_Active":"No AEB event active","AebSrc":"No AEB Event","MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState3    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ArbVehSpd_mps_Valid":1,"ArbVehSpd_mps":20.47,"ROI":1.27,"TargetVehSpd_mps":20.47,"Aeb_Active":0,"AebSrc":15,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ArbVehSpd_mps_Valid":"Valid","ArbVehSpd_mps":"Fault","ROI":1.27,"TargetVehSpd_mps":"Fault","Aeb_Active":"No AEB event active","AebSrc":"FCM + LIDAR + Thermal + LRR","MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState3    ${expected_can_signals}    30


VM-TX-0x202: Send Tx XCP variables and validating on CAN signals for message mVehState
    [Documentation]    Validate TX message 'mVehState' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehState":0,"VcuEstopSns":0,"CrashSns":0,"VehDte":0,"LvVolt":0,"GearRq":0,"GearAct":0,"SBW_RtEndStopReached":0,"SBW_LfEndStopReached":0,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":0,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":-40.96,"MsgCntr":0,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"VehState": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VehState","VcuEstopSns": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VcuEstopSns","CrashSns": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.CrashSns","VehDte": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VehDte","LvVolt": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.LvVolt","GearRq": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearRq","GearAct": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearAct","SBW_RtEndStopReached": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.SBW_RtEndStopReached","SBW_LfEndStopReached": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.SBW_LfEndStopReached","GearChangeParkAllow": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearChangeParkAllow","GearChangeDrvRevAllow": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearChangeDrvRevAllow","ArbVehSpdValid": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.ArbVehSpdValid","EstopDetected": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.EstopDetected","VehParkRq": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VehParkRq","Tether_Connected": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.Tether_Connected","ArbVehSpd": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.ArbVehSpd","MsgCntr": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.MsgCntr","TO_Allowed": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.TO_Allowed","AD_Allowed": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.AD_Allowed","LOS_Allowed": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.LOS_Allowed","Invld_GearRq": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.Invld_GearRq","MsgCrc": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehState":"NA","VcuEstopSns":"OK","CrashSns":"False","VehDte":0,"LvVolt":0,"GearRq":"Park","GearAct":"Park","SBW_RtEndStopReached":"False","SBW_LfEndStopReached":"False","GearChangeParkAllow":"Not Allowed","GearChangeDrvRevAllow":"Not Allowed","ArbVehSpdValid":"Invalid","EstopDetected":"OK","VehParkRq":"No Request","Tether_Connected":"Disconnected","ArbVehSpd":-40.96,"MsgCntr":0,"TO_Allowed":"Not Allowed","AD_Allowed":"Not Allowed","LOS_Allowed":"Not Allowed","Invld_GearRq":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"VehState":7,"VcuEstopSns":0,"CrashSns":0,"VehDte":51.15,"LvVolt":12.75,"GearRq":1,"GearAct":1,"SBW_RtEndStopReached":0,"SBW_LfEndStopReached":0,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":0,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":-0.01,"MsgCntr":7,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":0,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehState":"Los_Ctrl","VcuEstopSns":"OK","CrashSns":"False","VehDte":51.15,"LvVolt":12.75,"GearRq":"Rvrs","GearAct":"Rvrs","SBW_RtEndStopReached":"False","SBW_LfEndStopReached":"False","GearChangeParkAllow":"Not Allowed","GearChangeDrvRevAllow":"Not Allowed","ArbVehSpdValid":"Invalid","EstopDetected":"OK","VehParkRq":"No Request","Tether_Connected":"Disconnected","ArbVehSpd":-0.01,"MsgCntr":7,"TO_Allowed":"Not Allowed","AD_Allowed":"Not Allowed","LOS_Allowed":"Not Allowed","Invld_GearRq":0,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehState":15,"VcuEstopSns":1,"CrashSns":1,"VehDte":102.3,"LvVolt":25.5,"GearRq":3,"GearAct":3,"SBW_RtEndStopReached":1,"SBW_LfEndStopReached":1,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":1,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":40.94,"MsgCntr":15,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":1,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehState":"Sleep","VcuEstopSns":"Estop","CrashSns":"True","VehDte":102.3,"LvVolt":25.5,"GearRq":"Fwd","GearAct":"Fwd","SBW_RtEndStopReached":"True","SBW_LfEndStopReached":"True","GearChangeParkAllow":"Not Allowed","GearChangeDrvRevAllow":"Not Allowed","ArbVehSpdValid":"Invalid","EstopDetected":"ESTOP","VehParkRq":"No Request","Tether_Connected":"Disconnected","ArbVehSpd":"Fault","MsgCntr":15,"TO_Allowed":"Not Allowed","AD_Allowed":"Not Allowed","LOS_Allowed":"Not Allowed","Invld_GearRq":1,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVehState    ${expected_can_signals}    30

VM-TX-0x12: Send Tx XCP variables and validating on CAN signals for message mWhdCtrl
    [Documentation]    Validate TX message 'mWhdCtrl' by writing XCP variables and reading CAN signals
    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TrqSlewLmt":0,"SpdSlewLmt":0,"CtrlMode":0,"MtrMode":0,"EnblCmd":0,"Boot":0,"Debug":0,"TrqCmd":-1023,"SpdCmd":-1023,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"TrqSlewLmt":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.TrqSlewLmt","SpdSlewLmt":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.SpdSlewLmt","CtrlMode":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.CtrlMode","MtrMode":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.MtrMode","EnblCmd":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.EnblCmd","Boot":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.Boot","Debug":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.Debug","TrqCmd":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.TrqCmd","SpdCmd":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.SpdCmd","MsgCntr":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.MsgCntr","MsgCrc":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TrqSlewLmt":0, "SpdSlewLmt":0, "CtrlMode":"Disable" , "MtrMode":"NORMAL", "EnblCmd":"False", "Boot":"NORMAL", "Debug":"NORMAL", "TrqCmd":-1023, "SpdCmd":-1023, "MsgCntr":0, "MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mWhdCtrl    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"TrqSlewLmt":12.2, "SpdSlewLmt":1.2, "CtrlMode":0, "MtrMode":4, "EnblCmd":0, "Boot":0, "Debug":0, "TrqCmd":0, "SpdCmd":0, "MsgCntr":7, "MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TrqSlewLmt":12.2,"SpdSlewLmt":1.2,"CtrlMode":"Disable","MtrMode":4,"EnblCmd":"False","Boot":"NORMAL","Debug":"NORMAL","TrqCmd":0,"SpdCmd":0,"MsgCntr":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mWhdCtrl    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TrqSlewLmt":25.4, "SpdSlewLmt":2.54, "CtrlMode":0, "MtrMode":7, "EnblCmd":1, "Boot":1, "Debug":1, "TrqCmd":1023, "SpdCmd":1023, "MsgCntr":15, "MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TrqSlewLmt":25.4, "SpdSlewLmt":2.54, "CtrlMode":"Disable", "MtrMode":7, "EnblCmd":"True", "Boot":1, "Debug":"DEBUG", "TrqCmd":1023, "SpdCmd":1023, "MsgCntr":15, "MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mWhdCtrl    ${expected_can_signals}    30

VM-TX-0xCFDEA00: Send Tx XCP variables and validating on CAN signals for message mUserText
    [Documentation]    Validate TX message 'mUserText' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"UserTextStringKey": 0,"UserTextStringSeg": 0,"UserTextString1": 0,"UserTextString2": 0,"UserTextString3": 0,"UserTextString4": 0,"UserTextString5": 0,"UserTextString6": 0}
    ${xcp_var_map}=    Evaluate    {"UserTextStringKey": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextStringKey","UserTextStringSeg": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextStringSeg","UserTextString1": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextString1","UserTextString2": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextString2","UserTextString3": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextString3","UserTextString4": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextString4","UserTextString5": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextString5","UserTextString6": "Rte_C_SG_mUserText_adt_E5549464370C805D9FA48ED5C1429E6A.UserTextString6",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"UserTextStringKey": 0,"UserTextStringSeg": 0,"UserTextString1": 0,"UserTextString2": 0,"UserTextString3": 0,"UserTextString4": 0,"UserTextString5": 0,"UserTextString6": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mUserText    ${expected_can_signals}    30

VM-TX-0xCFDE900: Send Tx XCP variables and validating on CAN signals for message mUserValue
    [Documentation]    Validate TX message 'mUserValue' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ConfigId": 0,"ConfigValue": 0}
    ${xcp_var_map}=    Evaluate    {"ConfigId": "Rte_C_SG_mUserValue_adt_B0C227384AC4BC50713D167702A32FC5.ConfigId","ConfigValue": "Rte_C_SG_mUserValue_adt_B0C227384AC4BC50713D167702A32FC5.ConfigValue",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ConfigId": "Magna_1","ConfigValue": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mUserValue    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ConfigId": 8,"ConfigValue": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ConfigId": "Magna_8","ConfigValue": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mUserValue    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ConfigId": 63,"ConfigValue": 4294967295}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ConfigId": "DisplayMode","ConfigValue": 4294967295}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mUserValue    ${expected_can_signals}    30
