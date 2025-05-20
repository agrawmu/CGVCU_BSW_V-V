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
Send mCurrAvailPeak_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mCurrAvailPeak_BMS2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrgPeak": -1600, "CurrAvailChrgPeak": -1600,}
    Run Keyword And Continue On Failure    Send Can Message    mCurrAvailPeak_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailDschrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailChrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrgPeak": -1555, "CurrAvailChrgPeak": -1555,}
    Send Can Message    mCurrAvailPeak_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailDschrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    900

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailChrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    900

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrgPeak": -1540, "CurrAvailChrgPeak": -1540,}
    Run Keyword And Continue On Failure    Send Can Message    mCurrAvailPeak_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailDschrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailChrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200


Send mEbcm2L_EpbStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_EpbStat and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"EpbStat": 0, "EPB_Current": 0, "Flt_EpbIC": 0, "Flt_EpbMtrCurrent": 0, "Flt_EpbOpenCircuit": 0, "Flt_EpbGndShort": 0, "Flt_EpbBattShort": 0, "Flt_Epb": 0, "MsgCntr": 0, "MsgCrc": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_EpbStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.EpbStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbIC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbMtrCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbOpenCircuit
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbGndShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbBattShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_Epb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"EpbStat": 1, "EPB_Current": 0.1, "Flt_EpbIC": 0, "Flt_EpbMtrCurrent": 0, "Flt_EpbOpenCircuit": 0, "Flt_EpbGndShort": 0, "Flt_EpbBattShort": 0, "Flt_Epb": 0, "MsgCntr": 7, "MsgCrc": 128,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_EpbStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.EpbStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128


    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"EpbStat": 2, "EPB_Current": 0.4, "Flt_EpbIC": 1, "Flt_EpbMtrCurrent": 1, "Flt_EpbOpenCircuit": 1, "Flt_EpbGndShort": 1, "Flt_EpbBattShort": 1, "Flt_Epb": 1, "MsgCntr": 15, "MsgCrc": 255,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_EpbStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.EpbStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbIC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbMtrCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbOpenCircuit
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbGndShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_EpbBattShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.Flt_Epb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_1.PP_SG_mEbcm2L_EpbStat_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


Send mLeftJoyStat2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mLeftJoyStat2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LeftZ_Ntrl": 0, "LeftZ_Neg": 0, "LeftZ_Pos": 0, "LeftZ_Value": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mLeftJoyStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"LeftZ_Ntrl": 1, "LeftZ_Neg": 1, "LeftZ_Pos": 1, "LeftZ_Value": 700,}
    Run Keyword And Continue On Failure    Send Can Message    mLeftJoyStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    700

    ${signals}=    Evaluate    {"LeftZ_Ntrl": 2, "LeftZ_Neg": 2, "LeftZ_Pos": 2, "LeftZ_Value": 700,}
    Run Keyword And Continue On Failure    Send Can Message    mLeftJoyStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    700

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"LeftZ_Ntrl": 3, "LeftZ_Neg": 3, "LeftZ_Pos": 3, "LeftZ_Value": 1023,}
    Run Keyword And Continue On Failure    Send Can Message    mLeftJoyStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023



Send mSbwPosition with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mSbwPosition and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"Position": 0, "RawPosition": 0, "MsgCntr": 0, "RightStopLmt": 0, "LeftStopLmt": 0, "MsgCrc": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwPosition    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.Position
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"Position": 0.01, "RawPosition": 0.01, "MsgCntr": 12, "RightStopLmt": 0, "LeftStopLmt": 0, "MsgCrc": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwPosition    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.Position
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30


    ${signals}=    Evaluate    {"Position": 0.02, "RawPosition": 0.02, "MsgCntr": 12, "RightStopLmt": 0, "LeftStopLmt": 0, "MsgCrc": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwPosition    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.Position
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"Position": 0.06, "RawPosition": 0.06, "MsgCntr": 15, "RightStopLmt": 1, "LeftStopLmt": 1, "MsgCrc": 255,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwPosition    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.Position
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    600

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    600

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


Send mSbwStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mSbwStat and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"MtrTrqEst": -128, "MtrDcStat": -100, "MtrCurr": 0, "LvVolt": 0, "SwitchStat": 0, "InvTmpr": 0, "TrqSnsIn": -128, "TrqSnsIn_1C": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure  Should Be Equal As Numbers    ${value}    -128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat

    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"MtrTrqEst": -105, "MtrDcStat": -40, "MtrCurr": 1, "LvVolt": 1, "SwitchStat": 3, "InvTmpr": 100, "TrqSnsIn": -105, "TrqSnsIn_1C": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure  Should Be Equal As Numbers    ${value}    -105

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -105

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30


    ${signals}=    Evaluate    {"MtrTrqEst": 120, "MtrDcStat": 60, "MtrCurr": 1, "LvVolt": 1, "SwitchStat": 3, "InvTmpr": 100, "TrqSnsIn": 120, "TrqSnsIn_1C": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure  Should Be Equal As Numbers    ${value}    120

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    60

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    120

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"MtrTrqEst": 125, "MtrDcStat": 90, "MtrCurr": 2, "LvVolt": 2, "SwitchStat": 6, "InvTmpr": 245, "TrqSnsIn": 125, "TrqSnsIn_1C": 250,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    125

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    90

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    245

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    125

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    250
