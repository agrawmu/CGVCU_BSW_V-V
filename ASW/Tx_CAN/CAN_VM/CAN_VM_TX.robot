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

Send Tx XCP variables and validating on CAN signals for message mEbcm2L_Stat2
    [Documentation]    Validate TX message 'mEbcm2L_Stat2' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 0, "MtrCurrEst": 0, "LvVolt": 0, "EscAvail": Not_Avail, "EbdActv": 0, "ToShtdwn": False, "HoldStat": No_Hold_Requested, "MsgCntr": 0, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 0,}
    ${xcp_var_map}=    Evaluate    {"TcsAvail": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.TcsAvail", "AbsAvail": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.AbsAvail", "VehSpdEbcm": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.VehSpdEbcm", "MtrCurrEst": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MtrCurrEst", "LvVolt": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.LvVolt", "EscAvail": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.EscAvail", "EbdActv": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.EbdActv", "ToShtdwn": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.ToShtdwn", "HoldStat": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.HoldStat", "MsgCntr": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr", "AebRdy": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.AebRdy", "EscActv": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.EscActv", "TcsActv": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.TcsActv", "AbsActv": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MtrCurrEst", "MtrCurrEst": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MtrCurrEst", "MtrCurrEst": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MtrCurrEst", "MtrCurrEst": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.AbsActv", "MsgCrc": "rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCrc",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 0, "MtrCurrEst": 0, "LvVolt": 0, "EscAvail": Not_Avail, "EbdActv": 0, "ToShtdwn": False, "HoldStat": No_Hold_Requested, "MsgCntr": 0, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 0,}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 10.25, "MtrCurrEst": 128, "LvVolt": 12.25, "EscAvail": Level_1, "EbdActv": 0, "ToShtdwn": Pend_1s, "HoldStat": Controlled, "MsgCntr": 7, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 7,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TcsAvail": 0, "AbsAvail": 0, "VehSpdEbcm": 10.25, "MtrCurrEst": 128, "LvVolt": 12.25, "EscAvail": Level_1, "EbdActv": 0, "ToShtdwn": Pend_1s, "HoldStat": Controlled, "MsgCntr": 7, "AebRdy": 0, "EscActv": 0, "TcsActv": 0, "AbsActv": 0, "MsgCrc": 7,}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TcsAvail": 1, "AbsAvail": 1, "VehSpdEbcm": 1, "MtrCurrEst": 255, "LvVolt": 25.5, "EscAvail": Level_2, "EbdActv": 1, "ToShtdwn": 1, "HoldStat": Released, "MsgCntr": 15, "AebRdy": 1, "EscActv": 1, "TcsActv": 0, "AbsActv": 1, "MsgCrc": 15,}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TcsAvail": 1, "AbsAvail": 1, "VehSpdEbcm": 1, "MtrCurrEst": 255, "LvVolt": 25.5, "EscAvail": Level_2, "EbdActv": 1, "ToShtdwn": 1, "HoldStat": Released, "MsgCntr": 15, "AebRdy": 1, "EscActv": 1, "TcsActv": 0, "AbsActv": 1, "MsgCrc": 15,}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mWhdCtrl2
    [Documentation]    Validate TX message 'mWhdCtrl2' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VoltLmtMax":0,"VoltLmtMin":0,"CurrLmtMtr":0,"CurrLmtRegen":0,"TrqLmtMtr":0,"TrqLmtRegen":0,"WhdShtdwnRq":0,"ClearFltRq":0,"MsgCntr":0,"MsgCrc":0 }
    ${xcp_var_map}=    Evaluate    {"VoltLmtMax": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.VoltLmtMax","VoltLmtMin": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.VoltLmtMin","CurrLmtMtr": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.CurrLmtMtr","CurrLmtRegen": "Rte_C_SG_mWhdCtrl2_adt_31012CCD9371645AE072343A3A0B82AE.CurrLmtRegen"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VoltLmtMax":0,"VoltLmtMin":0,"CurrLmtMtr":0,"CurrLmtRegen":0,"TrqLmtMtr":0,"TrqLmtRegen":0,"WhdShtdwnRq":0,"ClearFltRq":0,"MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"VoltLmtMax":47.75,"VoltLmtMin":47.75,"CurrLmtMtr":63,"CurrLmtRegen":63,"TrqLmtMtr":127,"TrqLmtRegen":127,"WhdShtdwnRq":0,"ClearFltRq":0,"MsgCntr":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VoltLmtMax":47.75,"VoltLmtMin":47.75,"CurrLmtMtr":63,"CurrLmtRegen":63,"TrqLmtMtr":127,"TrqLmtRegen":127,"WhdShtdwnRq":0,"ClearFltRq":0,"MsgCntr":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VoltLmtMax":60.5,"VoltLmtMin":60.5,"CurrLmtMtr":127,"CurrLmtRegen":127,"TrqLmtMtr":254,"TrqLmtRegen":254,"WhdShtdwnRq":1,"ClearFltRq":1,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VoltLmtMax":60.5,"VoltLmtMin":60.5,"CurrLmtMtr":127,"CurrLmtRegen":127,"TrqLmtMtr":254,"TrqLmtRegen":254,"WhdShtdwnRq":1,"ClearFltRq":1,"MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VcuTask1msStat
    [Documentation]    Validate TX message 'VcuTask1msStat' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":0,"MaxUtilization":0,"MaxExecTime":0}
    ${xcp_var_map}=    Evaluate    {"MaxExecTimeValid": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxExecTimeValid","MaxUtilizationValid": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxUtilizationValid","CpuUtilizationValid": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.CpuUtilizationValid","CpuUtilization": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.CpuUtilization","MaxUtilization": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxUtilization","MaxExecTime": "Rte_C_SG_VcuTask1msStat_adt_7EDD78A649AB44AD0A46DEB4C9ED652E.MaxExecTime"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":0,"MaxUtilization":0,"MaxExecTime":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":500,"MaxUtilization":500,"MaxExecTime":500}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MaxExecTimeValid":0,"MaxUtilizationValid":0,"CpuUtilizationValid":0,"CpuUtilization":500,"MaxUtilization":500,"MaxExecTime":500}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"MaxExecTimeValid":1,"MaxUtilizationValid":1,"CpuUtilizationValid":1,"CpuUtilization":1000,"MaxUtilization":1000,"MaxExecTime":1000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MaxExecTimeValid":1,"MaxUtilizationValid":1,"CpuUtilizationValid":1,"CpuUtilization":1000,"MaxUtilization":1000,"MaxExecTime":1000}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVehState2
    [Documentation]    Validate TX message 'mVehState2' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ActGndWhlAng":-327.68,"maxDecelAvail":-32,"maxAccelAvail":-32,"MsgCntr":0,"maxSpeedAllowed":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"ActGndWhlAng": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.ActGndWhlAng","maxDecelAvail": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.maxDecelAvail","maxAccelAvail": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.maxAccelAvail","MsgCntr": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.MsgCntr","maxSpeedAllowed": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.maxSpeedAllowed","MsgCrc": "Rte_C_SG_mVehState2_adt_D413C47A2F6399A50170EE6E9F969C4F.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ActGndWhlAng":-327.68,"maxDecelAvail":-32,"maxAccelAvail":-32,"MsgCntr":0,"maxSpeedAllowed":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"ActGndWhlAng":-0.005,"maxDecelAvail":-0.0078125,"maxAccelAvail":-0.0078125,"MsgCntr":31.9921875,"maxSpeedAllowed":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ActGndWhlAng":-0.005,"maxDecelAvail":-0.0078125,"maxAccelAvail":-0.0078125,"MsgCntr":31.9921875,"maxSpeedAllowed":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ActGndWhlAng":327.67,"maxDecelAvail":31.984375,"maxAccelAvail":31.984375,"MsgCntr":63.984375,"maxSpeedAllowed":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ActGndWhlAng":327.67,"maxDecelAvail":31.984375,"maxAccelAvail":31.984375,"MsgCntr":63.984375,"maxSpeedAllowed":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVehState3
    [Documentation]    Validate TX message 'mVehState3' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":-20.48,"ROI":-1.28,"TargetVehSpd_mps":-20.48,"Aeb_Active":0,"AebSrc":0,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"ArbVehSpd_mps_Valid": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.ArbVehSpd_mps_Valid","ArbVehSpd_mps": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.ArbVehSpd_mps","ROI": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.ROI","TargetVehSpd_mps": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.TargetVehSpd_mps","Aeb_Active": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.Aeb_Active","AebSrc": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.AebSrc","MsgCntr": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.MsgCntr","MsgCrc": "Rte_C_SG_mVehState3_adt_2DA58CF22E4150CD88BE38B884663F9E.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":-20.48,"ROI":-1.28,"TargetVehSpd_mps":-20.48,"Aeb_Active":0,"AebSrc":0,"MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":-0.005,"ROI":-0.005,"TargetVehSpd_mps":-0.005,"Aeb_Active":0,"AebSrc":0,"MsgCntr":0,"MsgCrc":0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":-0.005,"ROI":-0.005,"TargetVehSpd_mps":-0.005,"Aeb_Active":0,"AebSrc":0,"MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":20.47,"ROI":1.27,"TargetVehSpd_mps":20.47,"Aeb_Active":0,"AebSrc":15,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ArbVehSpd_mps_Valid":0,"ArbVehSpd_mps":20.47,"ROI":1.27,"TargetVehSpd_mps":20.47,"Aeb_Active":0,"AebSrc":15,"MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVehState
    [Documentation]    Validate TX message 'mVehState' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehState":0,"VcuEstopSns":0,"CrashSns":0,"VehDte":0,"LvVolt":0,"GearRq":0,"GearAct":0,"SBW_RtEndStopReached":0,"SBW_LfEndStopReached":0,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":0,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":-40.96,"MsgCntr":0,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"VehState": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VehState","VcuEstopSns": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VcuEstopSns","CrashSns": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.CrashSns","VehDte": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VehDte","LvVolt": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.LvVolt","GearRq": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearRq","GearAct": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearAct","SBW_RtEndStopReached": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.SBW_RtEndStopReached","SBW_LfEndStopReached": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.SBW_LfEndStopReached","GearChangeParkAllow": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearChangeParkAllow","GearChangeDrvRevAllow": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.GearChangeDrvRevAllow","ArbVehSpdValid": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.ArbVehSpdValid","EstopDetected": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.EstopDetected","VehParkRq": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.VehParkRq","Tether_Connected": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.Tether_Connected","ArbVehSpd": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.ArbVehSpd","MsgCntr": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.MsgCntr","TO_Allowed": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.TO_Allowed","AD_Allowed": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.AD_Allowed","LOS_Allowed": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.LOS_Allowed","Invld_GearRq": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.Invld_GearRq","MsgCrc": "Rte_C_SG_mVehState_adt_5483EAF20EE94D2E8E0498304A05B6CD.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehState":0,"VcuEstopSns":0,"CrashSns":0,"VehDte":0,"LvVolt":0,"GearRq":0,"GearAct":0,"SBW_RtEndStopReached":0,"SBW_LfEndStopReached":0,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":0,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":-40.96,"MsgCntr":0,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"VehState":7,"VcuEstopSns":0,"CrashSns":0,"VehDte":51.15,"LvVolt":12.75,"GearRq":1,"GearAct":1,"SBW_RtEndStopReached":0,"SBW_LfEndStopReached":0,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":0,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":-0.01,"MsgCntr":7,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":0,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehState":7,"VcuEstopSns":0,"CrashSns":0,"VehDte":51.15,"LvVolt":12.75,"GearRq":1,"GearAct":1,"SBW_RtEndStopReached":0,"SBW_LfEndStopReached":0,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":0,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":-0.01,"MsgCntr":7,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":0,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VehState":15,"VcuEstopSns":1,"CrashSns":1,"VehDte":102.3,"LvVolt":25.5,"GearRq":3,"GearAct":3,"SBW_RtEndStopReached":1,"SBW_LfEndStopReached":1,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":1,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":40.94,"MsgCntr":15,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":1,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehState":15,"VcuEstopSns":1,"CrashSns":1,"VehDte":102.3,"LvVolt":25.5,"GearRq":3,"GearAct":3,"SBW_RtEndStopReached":1,"SBW_LfEndStopReached":1,"GearChangeParkAllow":0,"GearChangeDrvRevAllow":0,"ArbVehSpdValid":0,"EstopDetected":1,"VehParkRq":0,"Tether_Connected":0,"ArbVehSpd":40.94,"MsgCntr":15,"TO_Allowed":0,"AD_Allowed":0,"LOS_Allowed":0,"Invld_GearRq":1,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mWhdCtrl
    [Documentation]    Validate TX message 'mWhdCtrl' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TrqSlewLmt":0,"SpdSlewLmt":0,"CtrlMode":0,"MtrMode":0,"EnblCmd":0,"Boot":0,"Debug":0,"TrqCmd":-1023,"SpdCmd":-1023,"MsgCntr":0,"MsgCrc":0}
    ${xcp_var_map}=    Evaluate    {"TrqSlewLmt":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.TrqSlewLmt","SpdSlewLmt":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.SpdSlewLmt","CtrlMode":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.CtrlMode","MtrMode":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.MtrMode","EnblCmd":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.EnblCmd","Boot":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.Boot","Debug":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.Debug","TrqCmd":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.TrqCmd","SpdCmd":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.SpdCmd","MsgCntr":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.MsgCntr","MsgCrc":"Rte_C_SG_mWhdCtrl_adt_D7E9463E0A9381573AC424FECCA7FD38.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TrqSlewLmt":0,"SpdSlewLmt":0,"CtrlMode":0,"MtrMode":0,"EnblCmd":0,"Boot":0,"Debug":0,"TrqCmd":-1023,"SpdCmd":-1023,"MsgCntr":0,"MsgCrc":0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate     {"TrqSlewLmt":12.2,"SpdSlewLmt":1.2,"CtrlMode":0,"MtrMode":4,"EnblCmd":0.5,"Boot":0.5,"Debug":0.5,"TrqCmd":0,"SpdCmd":0,"MsgCntr":7,"MsgCrc":127}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TrqSlewLmt":12.2,"SpdSlewLmt":1.2,"CtrlMode":0,"MtrMode":4,"EnblCmd":0.5,"Boot":0.5,"Debug":0.5,"TrqCmd":0,"SpdCmd":0,"MsgCntr":7,"MsgCrc":127}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"rqSlewLmt":25.4,"SpdSlewLmt":2.54,"CtrlMode":0,"MtrMode":7,"EnblCmd":1,"Boot":1,"Debug":1,"TrqCmd":1024,"SpdCmd":1024,"MsgCntr":15,"MsgCrc":255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TrqSlewLmt":25.4,"SpdSlewLmt":2.54,"CtrlMode":0,"MtrMode":7,"EnblCmd":1,"Boot":1,"Debug":1,"TrqCmd":1024,"SpdCmd":1024,"MsgCntr":15,"MsgCrc":255}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30