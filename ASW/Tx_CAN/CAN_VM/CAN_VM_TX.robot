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

Send Tx XCP variables and validating on CAN signals for message mAVASCmd
    [Documentation]    Validate TX message 'mAVASCmd' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode": 0,"GearRq_AVAS": 0,"MsgCntr": 0,"VehSpdAVAS": -64,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"AVAS_TestMode": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.AVAS_TestMode","GearRq_AVAS": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.GearRq_AVAS","MsgCntr": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.MsgCntr","VehSpdAVAS": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.VehSpdAVAS","MsgCrc": "Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode": 0,"GearRq_AVAS": "Park","MsgCntr": 0,"VehSpdAVAS": -64,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mAVASCmd    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": 1,"MsgCntr": 7,"VehSpdAVAS": -0.015625,"MsgCrc": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": "Rvrs","MsgCntr": 7,"VehSpdAVAS": -0.015625,"MsgCrc": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mAVASCmd    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": 3,"MsgCntr": 15,"VehSpdAVAS": 63,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode": 1,"GearRq_AVAS": "Fwd","MsgCntr": 15,"VehSpdAVAS": 63,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mAVASCmd    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mBrkCtrl
    [Documentation]    Validate TX message 'mBrkCtrl' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq": 0,"BrkEnbl_EBCM1U": 0,"BrkEnbl_EBCM2L": 0,"DsblTCS": 0,"EbcmShtdwnRq": 0,"RegBrkAvail": 0,"ClearFltRq": 0,"EbcmMaintModeRq": 0,"HoldRq": 0,"EPBCmd": 0,"EpbCalCmd": 0,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"BrkTrqRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkTrqRq","BrkEnbl_EBCM1U": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkEnbl_EBCM1U","BrkEnbl_EBCM2L": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkEnbl_EBCM2L","DsblTCS": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.DsblTCS","EbcmShtdwnRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EbcmShtdwnRq","RegBrkAvail": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.RegBrkAvail","ClearFltRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.ClearFltRq","EbcmMaintModeRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EbcmMaintModeRq","HoldRq": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.HoldRq","EPBCmd": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EPBCmd","EpbCalCmd": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EpbCalCmd","MsgCntr": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.MsgCntr","MsgCrc": "Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": 0,"BrkEnbl_EBCM1U": 0,"BrkEnbl_EBCM2L": 0,"DsblTCS": 0,"EbcmShtdwnRq": 0,"RegBrkAvail": 0,"ClearFltRq": 0,"EbcmMaintModeRq": 0,"HoldRq": 0,"EPBCmd": "Idle","EpbCalCmd": 0,"MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq": 3276.75,"BrkEnbl_EBCM1U": 0,"BrkEnbl_EBCM2L": 0,"DsblTCS": 0,"EbcmShtdwnRq": 0,"RegBrkAvail": 102.375,"ClearFltRq": 0,"EbcmMaintModeRq": 0,"HoldRq": 0,"EPBCmd": 1,"EpbCalCmd": 0,"MsgCntr": 7,"MsgCrc": 127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": 3276.75,"BrkEnbl_EBCM1U": 0,"BrkEnbl_EBCM2L": 0,"DsblTCS": 0,"EbcmShtdwnRq": 0,"RegBrkAvail": 102.375,"ClearFltRq": 0,"EbcmMaintModeRq": 0,"HoldRq": 0,"EPBCmd": "Engage","EpbCalCmd": 0,"MsgCntr": 7,"MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq": 6553.5,"BrkEnbl_EBCM1U": 1,"BrkEnbl_EBCM2L": 1,"DsblTCS": 1,"EbcmShtdwnRq": 1,"RegBrkAvail": 204.75,"ClearFltRq": 0,"EbcmMaintModeRq": 0,"HoldRq": 1,"EPBCmd": 3,"EpbCalCmd": 1,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq": 6553.5,"BrkEnbl_EBCM1U": 1,"BrkEnbl_EBCM2L": 1,"DsblTCS": 1,"EbcmShtdwnRq": 1,"RegBrkAvail": 204.75,"ClearFltRq": 0,"EbcmMaintModeRq": 0,"HoldRq": 1,"EPBCmd": "Fully Release","EpbCalCmd": 1,"MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mEbcm2L_WhlSpd
    [Documentation]    Validate TX message 'mEbcm2L_WhlSpd' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL": -20.48,"WhlSpdFR": -20.48,"WhlSpdR": -20.48,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"WhlSpdFL": "rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.WhlSpdFL","WhlSpdFR": "rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.WhlSpdFR","WhlSpdR": "rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.WhlSpdR","MsgCntr": "rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.MsgCntr","MsgCrc": "rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.MsgCrc",}
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

Send Tx XCP variables and validating on CAN signals for message mHmiPadStat
    [Documentation]    Validate TX message 'mHmiPadStat' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO": 0,"Keypad1": 0,"Keypad2": 0,"Keypad3": 0,"Keypad4": 0,"KeypadC": 0,"PadCodeState": 0,"PadActive": 0,"PadLight": 0,"AudioVoice": 0,"AudioMp3": 0,"VolVoice": 0,"VolMp3": 0}
    ${xcp_var_map}=    Evaluate    {"KeypadO": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.KeypadO","Keypad1": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad1","Keypad2": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad2","Keypad3": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad3","Keypad4": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad4","KeypadC": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.KeypadC","PadCodeState": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadCodeState","PadActive": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadActive","PadLight": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadLight","AudioVoice": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.AudioVoice","AudioMp3": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.AudioMp3","VolVoice": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.VolVoice","VolMp3": "Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.VolMp3",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO": 0,"Keypad1": 0,"Keypad2": 0,"Keypad3": 0,"Keypad4": 0,"KeypadC": 0,"PadCodeState": "N/A","PadActive": 0,"PadLight": 0,"AudioVoice": 0,"AudioMp3": 0,"VolVoice": 0,"VolMp3": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO": 0,"Keypad1": 0,"Keypad2": 0,"Keypad3": 0,"Keypad4": 0,"KeypadC": 0,"PadCodeState": 3,"PadActive": 0,"PadLight": 0,"AudioVoice": 127,"AudioMp3": 127,"VolVoice": 50,"VolMp3": 50}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO": 0,"Keypad1": 0,"Keypad2": 0,"Keypad3": 0,"Keypad4": 0,"KeypadC": 0,"PadCodeState": "Invalid","PadActive": 0,"PadLight": 0,"AudioVoice": 127,"AudioMp3": 127,"VolVoice": 50,"VolMp3": 50}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO": 1,"Keypad1": 1,"Keypad2": 1,"Keypad3": 1,"Keypad4": 1,"KeypadC": 1,"PadCodeState": 4,"PadActive": 1,"PadLight": 1,"AudioVoice": 255,"AudioMp3": 255,"VolVoice": 100,"VolMp3": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO": 1,"Keypad1": 1,"Keypad2": 1,"Keypad3": 1,"Keypad4": 1,"KeypadC": 1,"PadCodeState": "Lockout","PadActive": 1,"PadLight": 1,"AudioVoice": 255,"AudioMp3": 255,"VolVoice": 100,"VolMp3": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mHVESSC1_BMS2
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

Send Tx XCP variables and validating on CAN signals for message mSbwCtrl
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
    ${expected_can_signals}=    Evaluate    {"CtrlMode": "Angle-Gain 2","AngleCmd": 511,"MtrDcCmd": 0,"MsgCrc": 127,"MsgCntr": 7}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"CtrlMode": 5,"AngleCmd": 1023,"MtrDcCmd": 100,"MsgCrc": 255,"MsgCntr": 15}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CtrlMode": "Angle-Gain 5","AngleCmd": 1023,"MtrDcCmd": 100,"MsgCrc": 255,"MsgCntr": 15}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mSbwCtrl_Allied
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
    ${expected_can_signals}=    Evaluate    {"CommandMode": "Off","CommandVariable1": 0,"CommandVariable2": 0,"MsgCntr": 7,"EstopReq": "No Estop","ClearFaults": "FALSE","MsgCrc": 127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl_Allied    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"CommandMode": 0,"CommandVariable1": 8192,"CommandVariable2": 127.99609375,"MsgCntr": 15,"EstopReq": 1,"ClearFaults": 1,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CommandMode": "Off","CommandVariable1": 8192,"CommandVariable2": 127.99609375,"MsgCntr": 15,"EstopReq": "ESTOP Requested","ClearFaults": "True","MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mSbwCtrl_Allied    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVcuEcuStat
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
    ${expected_can_signals}=    Evaluate    {"WakeHoldStat": "WakeHold","EcuModingStat": "EcuInit","EcuWakeSource": "CGM_CAN","VcuLvOk": 0,"DrvpOk": 0,"SnsrPwrOk": 0,"NvmOk": 0,"Hso16WakeHoldOutCmd": 0,"Hso16Status": "SHORTED","RaptorWakeSource": "ETH","MomSwPress": 0,"MprdEnCmd": 0,"MomSwInRaw": 0,"CanChk": 0,"EthChk": 0,"LinChk": 0,"FlashChk": 0,"IdleTmr": 5000}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuEcuStat    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"WakeHoldStat": 3,"EcuModingStat": 7,"EcuWakeSource": 7,"VcuLvOk": 1,"DrvpOk": 1,"SnsrPwrOk": 1,"NvmOk": 1,"Hso16WakeHoldOutCmd": 1,"Hso16Status": 4,"RaptorWakeSource": 60,"MomSwPress": 1,"MprdEnCmd": 1,"MomSwInRaw": 1,"CanChk": 1,"EthChk": 1,"LinChk": 1,"FlashChk": 1,"IdleTmr": 10000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WakeHoldStat": "N/A","EcuModingStat": "EcuSleep","EcuWakeSource": "Vbatt","VcuLvOk": 1,"DrvpOk": 1,"SnsrPwrOk": 1,"NvmOk": 1,"Hso16WakeHoldOutCmd": 1,"Hso16Status": "OPEN LOAD","RaptorWakeSource": "ETH+LIN2","MomSwPress": 1,"MprdEnCmd": 1,"MomSwInRaw": 1,"CanChk": 1,"EthChk": 1,"LinChk": 1,"FlashChk": 1,"IdleTmr": 10000}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuEcuStat    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVcuFaults
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

Send Tx XCP variables and validating on CAN signals for message mVcuImuAngVel
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
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate": 327.67,"Y_Angular_Rate": 327.67,"Z_Angular_Rate": 327.67,"MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVcuImuAngVel_Filt
    [Documentation]    Validate TX message 'mVcuImuAngVel_Filt' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate_Filt": -327.68,"Y_Angular_Rate_Filt": -327.68,"Z_Angular_Rate_Filt": -327.68,"MsgCntr": 0,"MsgCrc": 0}
    ${xcp_var_map}=    Evaluate    {"X_Angular_Rate_Filt": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.X_Angular_Rate_Filt","Y_Angular_Rate_Filt": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.Y_Angular_Rate_Filt","Z_Angular_Rate_Filt": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.Z_Angular_Rate_Filt","MsgCntr": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.MsgCntr","MsgCrc": "Rte_C_SG_mVcuImuAngVel_Filt_adt_6D4B7ADA01D6AD04F5A47B25D9E1E49A.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate_Filt": -327.68,"Y_Angular_Rate_Filt": -327.68,"Z_Angular_Rate_Filt": -327.68,"MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuImuAngVel_Filt    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate_Filt": 0,"Y_Angular_Rate_Filt": 0,"Z_Angular_Rate_Filt": 0,"MsgCntr": 7,"MsgCrc": 150}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate_Filt": 0,"Y_Angular_Rate_Filt": 0,"Z_Angular_Rate_Filt": 0,"MsgCntr": 7,"MsgCrc": 150}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel_Filt    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"X_Angular_Rate_Filt": 327.67,"Y_Angular_Rate_Filt": 327.67,"Z_Angular_Rate_Filt": 327.67,"MsgCntr": 15,"MsgCrc": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"X_Angular_Rate_Filt": 327.67,"Y_Angular_Rate_Filt": 327.67,"Z_Angular_Rate_Filt": 327.67,"MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuImuAngVel_Filt    ${expected_can_signals}    30
