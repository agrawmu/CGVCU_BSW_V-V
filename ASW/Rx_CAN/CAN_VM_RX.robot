*** Settings ***
Library    can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Validation/Vinayak/ASW/CAN_VM_Configuration/ASW_CAN_VM_RX    CAN_VM_RX
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/RX_Testing/CAN_VM/CAN_VM_v3.7.1.dbc    3    500000
    Sleep    3s



Shutdown
    Shutdown Can
    Close Canape


*** Test Cases ***
Send mWhdStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mWhdStat and XCP variable read

	Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"HwEnblStat": 0, "MsgCntr": 0, "MsgCrc": 0, "MtrSpd": -1024, "MtrTrqEst": -1024, "MvCurrEst": -204.8, "MvVolt": 0, "TrqEnblStat": 0}
    Send Can Message    mWhdStat    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.HwEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2048

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2048

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2048

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.TrqEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"HwEnblStat": 1, "MsgCntr": 7, "MsgCrc": 128, "MtrSpd": 0, "MtrTrqEst": 0, "MvCurrEst": 0, "MvVolt": 55, "TrqEnblStat": 1}
    Send Can Message    mWhdStat    ${signals}
    Sleep    10s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1100

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"HwEnblStat": 1, "MsgCntr": 15, "MsgCrc": 255, "MtrSpd": 1023, "MtrTrqEst": 1023, "MvCurrEst": 204.7, "MvVolt": 100, "TrqEnblStat": 1}
    Send Can Message    mWhdStat    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.HwEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2046

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2046

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2047

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2000

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.TrqEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

Send mSbwSys_Allied with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mSbwSys_Allied and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LeftEndStopValue": 0, "MsgCntr": 0, "MsgCrc": 0, "ProgOffset": -327.68, "RightEndStopValue": 0, "SwVerMaj": 0, "SwVerMin": 0, "SwVerRev": 0}
    Send Can Message    mSbwSys_Allied    ${signals}
    Sleep    10s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.LeftEndStopValue
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.ProgOffset
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -32768

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"LeftEndStopValue": 50, "MsgCntr": 0, "MsgCrc": 150, "ProgOffset": 150.5, "RightEndStopValue": 0, "SwVerMaj": 5, "SwVerMin": 5, "SwVerRev": 5}
    Send Can Message    mSbwSys_Allied    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.LeftEndStopValue
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    50

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    150

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.ProgOffset
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15050

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"LeftEndStopValue": 1023, "MsgCntr": 15, "MsgCrc": 255, "ProgOffset": 327.67, "RightEndStopValue": 0, "SwVerMaj": 15, "SwVerMin": 15, "SwVerRev": 15}
    Send Can Message    mSbwSys_Allied    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.LeftEndStopValue
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.ProgOffset
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32767

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15



Send mVscStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mVscStat and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"CtrlMode": 0, "VscEstop": 0, "VscMode": 0}
    Send Can Message    mVscStat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.CtrlMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.VscEstop
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.VscMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"CtrlMode": 1, "VscEstop": 0, "VscMode": 9}
    Send Can Message    mVscStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.CtrlMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.VscEstop
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.VscMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    9

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"CtrlMode": 2, "VscEstop": 1, "VscMode": 11}
    Send Can Message    mVscStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.CtrlMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.VscEstop
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx100_5.PP_SG_mVscStat_VDP_SG_mVscStat.VscMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    11

Send mEbcm2L_TrqLmts with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_TrqLmts and XCP variable read

	Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 0, "RegBrkTrqRq": 0, "StopLightRq": 0, "TrqLmtMtrRq": 0, "TrqSlewRq": 0, "VehAccelEbcm": -327.68}
    Send Can Message    mEbcm2L_TrqLmts    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.RegBrkTrqRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.StopLightRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqLmtMtrRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqSlewRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.VehAccelEbcm
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -327.68

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"MsgCntr": 7, "MsgCrc": 7, "RegBrkTrqRq": 63.75, "StopLightRq": 1, "TrqLmtMtrRq": 63.75, "TrqSlewRq": 1, "VehAccelEbcm": 0}
    Send Can Message    mEbcm2L_TrqLmts    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.RegBrkTrqRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127.5

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqLmtMtrRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127.5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqSlewRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.VehAccelEbcm
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"MsgCntr": 15, "MsgCrc": 15, "RegBrkTrqRq": 127.5, "StopLightRq": 1, "TrqLmtMtrRq": 127.5, "TrqSlewRq": 2, "VehAccelEbcm": 327.67}
    Send Can Message    mEbcm2L_TrqLmts    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.RegBrkTrqRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.StopLightRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqLmtMtrRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqSlewRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.VehAccelEbcm
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32767

Send mEbcm1U_Stat2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm1U_Stat2 and XCP variable read

	Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"HoldStat": 0, "LvVolt": 0, "MsgCntr": 0, "MsgCrc": 0, "MtrCurrEst": 0, "ToShtdwn": 0}
    Send Can Message    mEbcm1U_Stat2    ${signals}
    Sleep    10s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.HoldStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MtrCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.ToShtdwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"HoldStat": 1, "LvVolt": 25.5, "MsgCntr": 5, "MsgCrc": 5, "MtrCurrEst": 17, "ToShtdwn": 7}
    Send Can Message    mEbcm1U_Stat2    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.HoldStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MtrCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    17

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.ToShtdwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"HoldStat": 2, "LvVolt": 15, "MsgCntr": 15, "MsgCrc": 255, "MtrCurrEst": 255, "ToShtdwn": 3}
    Send Can Message    mEbcm1U_Stat2    ${signals}
    Sleep    10s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.HoldStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    150

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MtrCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.ToShtdwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3