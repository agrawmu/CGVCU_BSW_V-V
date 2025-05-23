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
    ${xcp_values}=    Evaluate    {"AVAS_TestMode":  0,"GearRq_AVAS":  0,"MsgCntr":  0,"VehSpdAVAS":  -64,"MsgCrc":  0}
    ${xcp_var_map}=    Evaluate    {"AVAS_TestMode":  Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.AVAS_TestMode,"GearRq_AVAS":  Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.GearRq_AVAS,"MsgCntr":  Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.MsgCntr,"VehSpdAVAS":  Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.VehSpdAVAS,"MsgCrc":  Rte_C_SG_mAVASCmd_adt_E5F40E6C8C4BDDBDCE2F1F8FFE8A7873.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode":  0,"GearRq_AVAS":  "Park","MsgCntr":  0,"VehSpdAVAS":  -64,"MsgCrc":  0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mAVASCmd    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode":  1,"GearRq_AVAS":  1,"MsgCntr":  7,"VehSpdAVAS":  -0.015625,"MsgCrc":  100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode":  1,"GearRq_AVAS":  "Rvrs","MsgCntr":  7,"VehSpdAVAS":  -0.015625,"MsgCrc":  100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mAVASCmd    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AVAS_TestMode":  1,"GearRq_AVAS":  3,"MsgCntr":  15,"VehSpdAVAS":  63,"MsgCrc":  255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AVAS_TestMode":  1,"GearRq_AVAS":  "Fwd","MsgCntr":  15,"VehSpdAVAS":  63,"MsgCrc":  255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mAVASCmd    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mBrkCtrl
    [Documentation]    Validate TX message 'mBrkCtrl' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq":0,"BrkEnbl_EBCM1U":0,"BrkEnbl_EBCM2L":0,"DsblTCS":0,"EbcmShtdwnRq":0,"RegBrkAvail":0,"ClearFltRq":0,"EbcmMaintModeRq":0,"HoldRq":0,"EPBCmd":0,"EpbCalCmd":0,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"BrkTrqRq":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkTrqRq,"BrkEnbl_EBCM1U":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkEnbl_EBCM1U,"BrkEnbl_EBCM2L":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.BrkEnbl_EBCM2L,"DsblTCS":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.DsblTCS,"EbcmShtdwnRq":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EbcmShtdwnRq,"RegBrkAvail":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.RegBrkAvail,"ClearFltRq":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.ClearFltRq,"EbcmMaintModeRq":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EbcmMaintModeRq,"HoldRq":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.HoldRq,"EPBCmd":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EPBCmd,"EpbCalCmd":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.EpbCalCmd,"MsgCntr":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.MsgCntr,"MsgCrc":  Rte_C_SG_mBrkCtrl_adt_8129E7B079FF19A005064519BA92634D.MsgCrc,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq":0,"BrkEnbl_EBCM1U":0,"BrkEnbl_EBCM2L":0,"DsblTCS":0,"EbcmShtdwnRq":0,"RegBrkAvail":0,"ClearFltRq":0,"EbcmMaintModeRq":0,"HoldRq":0,"EPBCmd":"Idle","EpbCalCmd":0,"MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq":3276.75,"BrkEnbl_EBCM1U":0,"BrkEnbl_EBCM2L":0,"DsblTCS":0,"EbcmShtdwnRq":0,"RegBrkAvail":102.375,"ClearFltRq":0,"EbcmMaintModeRq":0,"HoldRq":0,"EPBCmd":1,"EpbCalCmd":0,"MsgCntr":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq":3276.75,"BrkEnbl_EBCM1U":0,"BrkEnbl_EBCM2L":0,"DsblTCS":0,"EbcmShtdwnRq":0,"RegBrkAvail":102.375,"ClearFltRq":0,"EbcmMaintModeRq":0,"HoldRq":0,"EPBCmd":"Engage","EpbCalCmd":0,"MsgCntr":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"BrkTrqRq":6553.5,"BrkEnbl_EBCM1U":1,"BrkEnbl_EBCM2L":1,"DsblTCS":1,"EbcmShtdwnRq":1,"RegBrkAvail":204.75,"ClearFltRq":0,"EbcmMaintModeRq":0,"HoldRq":1,"EPBCmd":3,"EpbCalCmd":1,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BrkTrqRq":6553.5,"BrkEnbl_EBCM1U":1,"BrkEnbl_EBCM2L":1,"DsblTCS":1,"EbcmShtdwnRq":1,"RegBrkAvail":204.75,"ClearFltRq":0,"EbcmMaintModeRq":0,"HoldRq":1,"EPBCmd":"Fully Release","EpbCalCmd":1,"MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mBrkCtrl    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mEbcm2L_WhlSpd
    [Documentation]    Validate TX message 'mEbcm2L_WhlSpd' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL":-20.48,"WhlSpdFR":-20.48,"WhlSpdR":-20.48,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"WhlSpdFL":  rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.WhlSpdFL,"WhlSpdFR":  rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.WhlSpdFR,"WhlSpdR":  rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.WhlSpdR,"MsgCntr":  rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.MsgCntr,"MsgCrc":  rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlSpd_VDP_SG_mEb.MsgCrc,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlSpdFL":-20.48,"WhlSpdFR":-20.48,"WhlSpdR":-20.48,"MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL":-0.015,"WhlSpdFR":-0.015,"WhlSpdR":-0.015,"MsgCntr":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlSpdFL":-0.015,"WhlSpdFR":-0.015,"WhlSpdR":-0.015,"MsgCntr":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlSpdFL":20.45,"WhlSpdFR":20.45,"WhlSpdR":20.45,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlSpdFL":20.45,"WhlSpdFR":20.45,"WhlSpdR":20.45,"MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mHmiPadStat
    [Documentation]    Validate TX message 'mHmiPadStat' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO":0,"Keypad1":0,"Keypad2":0,"Keypad3":0,"Keypad4":0,"KeypadC":0,"PadCodeState":0,"PadActive":0,"PadLight":0,"AudioVoice":0,"AudioMp3":0,"VolVoice":0,"VolMp3":0}
    ${xcp_var_map}=    Evaluate    {"KeypadO":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.KeypadO,"Keypad1":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad1,"Keypad2":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad2,"Keypad3":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad3,"Keypad4":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.Keypad4,"KeypadC":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.KeypadC,"PadCodeState":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadCodeState,"PadActive":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadActive,"PadLight":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.PadLight,"AudioVoice":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.AudioVoice,"AudioMp3":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.AudioMp3,"VolVoice":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.VolVoice,"VolMp3":  Rte_C_SG_mHmiPadStat_adt_1CA8AEBBEE7A9B7A136ECB43A1454FFF.VolMp3,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO":0,"Keypad1":0,"Keypad2":0,"Keypad3":0,"Keypad4":0,"KeypadC":0,"PadCodeState":"N/A","PadActive":0,"PadLight":0,"AudioVoice":0,"AudioMp3":0,"VolVoice":0,"VolMp3":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO":0,"Keypad1":0,"Keypad2":0,"Keypad3":0,"Keypad4":0,"KeypadC":0,"PadCodeState":3,"PadActive":0,"PadLight":0,"AudioVoice":127,"AudioMp3":127,"VolVoice":50,"VolMp3":50}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO":0,"Keypad1":0,"Keypad2":0,"Keypad3":0,"Keypad4":0,"KeypadC":0,"PadCodeState":"Invalid","PadActive":0,"PadLight":0,"AudioVoice":127,"AudioMp3":127,"VolVoice":50,"VolMp3":50}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"KeypadO":1,"Keypad1":1,"Keypad2":1,"Keypad3":1,"Keypad4":1,"KeypadC":1,"PadCodeState":4,"PadActive":1,"PadLight":1,"AudioVoice":255,"AudioMp3":255,"VolVoice":100,"VolMp3":100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"KeypadO":1,"Keypad1":1,"Keypad2":1,"Keypad3":1,"Keypad4":1,"KeypadC":1,"PadCodeState":"Lockout","PadActive":1,"PadLight":1,"AudioVoice":255,"AudioMp3":255,"VolVoice":100,"VolMp3":100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHmiPadStat    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mHVESSC1_BMS2
    [Documentation]    Validate TX message 'mHVESSC1_BMS2' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"EnblRq":0,"PwrDownCmd":0,"HvIsoActiveRq":0,"HvIsoPassiveRq":0,"CellBalRq":0,"EnblIntChrgrRq":0,"EnblConsent":0,"HvResistHighRq":0,"HvResistLowRq":0,"ThrmlMgmtRq":0,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"EnblRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.EnblRq,"PwrDownCmd":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.PwrDownCmd,"HvIsoActiveRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvIsoActiveRq,"HvIsoPassiveRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvIsoPassiveRq,"CellBalRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.CellBalRq,"EnblIntChrgrRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.EnblIntChrgrRq,"EnblConsent":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.EnblConsent,"HvResistHighRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvResistHighRq,"HvResistLowRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.HvResistLowRq,"ThrmlMgmtRq":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.ThrmlMgmtRq,"MsgCntr":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.MsgCntr,"MsgCrc":  Rte_C_SG_mHVESSC1_BMS2_adt_6F2AB6CB322F7E05EBA989958B72D8BB.MsgCrc,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EnblRq":"FALSE","PwrDownCmd":"FALSE","HvIsoActiveRq":"FALSE","HvIsoPassiveRq":"FALSE","CellBalRq":"FALSE","EnblIntChrgrRq":"FALSE","EnblConsent":"FALSE","HvResistHighRq":"FALSE","HvResistLowRq":"FALSE","ThrmlMgmtRq":"FALSE","MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mHVESSC1_BMS2    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"EnblRq":1,"PwrDownCmd":1,"HvIsoActiveRq":1,"HvIsoPassiveRq":1,"CellBalRq":1,"EnblIntChrgrRq":1,"EnblConsent":1,"HvResistHighRq":1,"HvResistLowRq":1,"ThrmlMgmtRq":1,"MsgCntr":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EnblRq":"TRUE","PwrDownCmd":"TRUE","HvIsoActiveRq":"TRUE","HvIsoPassiveRq":"TRUE","CellBalRq":"TRUE","EnblIntChrgrRq":"TRUE","EnblConsent":"TRUE","HvResistHighRq":"TRUE","HvResistLowRq":"TRUE","ThrmlMgmtRq":"TRUE","MsgCntr":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHVESSC1_BMS2    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"EnblRq":3,"PwrDownCmd":3,"HvIsoActiveRq":3,"HvIsoPassiveRq":3,"CellBalRq":3,"EnblIntChrgrRq":3,"EnblConsent":3,"HvResistHighRq":3,"HvResistLowRq":3,"ThrmlMgmtRq":3,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EnblRq":"N/A","PwrDownCmd":"N/A","HvIsoActiveRq":"N/A","HvIsoPassiveRq":"N/A","CellBalRq":"N/A","EnblIntChrgrRq":"N/A","EnblConsent":"N/A","HvResistHighRq":"N/A","HvResistLowRq":"N/A","ThrmlMgmtRq":"N/A","MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mHVESSC1_BMS2    ${expected_can_signals}    30
