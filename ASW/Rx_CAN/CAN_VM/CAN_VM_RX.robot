*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Jenkins/workspace/CGVCU_ASW_Testing/ASW/Rx_CAN/Rx_CAN_Config    CAN_RX
    Initialize Can    D:/Jenkins/workspace/CGVCU_ASW_Testing/ASW/DBC/CAN_VM_v3.7.1.dbc    3    500000
    Sleep    3s

Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
VM-RX-0xcfed9a6: Send AUXIO1_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"AUX_01_HPR": 0, "AUX_02": 0, "AUX_03": 0, "AUX_04_LPR": 0, "AUX_05": 0, "AUX_06": 0, "AUX_07": 0, "AUX_08": 0}

    Send Can Message    AUXIO1_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_01_HPR
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_02
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_03
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_04_LPR
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_05
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_06
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_07
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_08
    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"AUX_01_HPR": 1, "AUX_02": 1, "AUX_03": 1, "AUX_04_LPR": 1, "AUX_05": 1, "AUX_06": 1, "AUX_07": 1, "AUX_08": 1}

    Send Can Message    AUXIO1_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_01_HPR
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_02
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_03
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_04_LPR
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_05
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_06
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_07
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_08
    Should Be Equal As Numbers    ${value}    1

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"AUX_01_HPR": 2, "AUX_02": 2, "AUX_03": 2, "AUX_04_LPR": 2, "AUX_05": 2, "AUX_06": 2, "AUX_07": 2, "AUX_08": 2}

    Send Can Message    AUXIO1_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_01_HPR
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_02
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_03
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_04_LPR
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_05
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_06
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_07
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_AUXIO_BMS2_VDP_SG_AUXIO_B.AUX_08
    Should Be Equal As Numbers    ${value}    2

VM-RX-0xcf036a6: Send HVESSS2_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LmtChrg_Curr": 0, "LmtChrg_Diag": 0, "LmtChrg_Soc": 0, "LmtChrg_Tbd": 0, "LmtChrg_Tmpr": 0, "LmtChrg_Volt": 0, "LmtDschrg_Curr": 0, "LmtDschrg_Diag": 0, "LmtDschrg_Soc": 0, "LmtDschrg_Tbd": 0, "LmtDschrg_Tmpr": 0, "LmtDschrg_Volt": 0,}

    Send Can Message    HVESSS2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Curr
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Diag
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Soc
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tbd
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tmpr
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Volt
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Curr
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Diag
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Soc
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tbd
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tmpr
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Volt
    Should Be Equal As Numbers    ${value}    0

    Log    Assigning mid Value to the signal

    ${signals}=    Evaluate    {"LmtChrg_Curr": 1, "LmtChrg_Diag": 1, "LmtChrg_Soc": 1, "LmtChrg_Tbd": 1, "LmtChrg_Tmpr": 1, "LmtChrg_Volt": 1, "LmtDschrg_Curr": 1, "LmtDschrg_Diag": 1, "LmtDschrg_Soc": 1, "LmtDschrg_Tbd": 1, "LmtDschrg_Tmpr": 1, "LmtDschrg_Volt": 1,}

    Send Can Message    HVESSS2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Curr
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Diag
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Soc
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tbd
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tmpr
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Volt
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Curr
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Diag
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Soc
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tbd
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tmpr
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Volt
    Should Be Equal As Numbers    ${value}    1

    Log    Assigning mid values to the signal

    ${signals}=    Evaluate    {"LmtChrg_Curr": 2, "LmtChrg_Diag": 2, "LmtChrg_Soc": 2, "LmtChrg_Tbd": 2, "LmtChrg_Tmpr": 2, "LmtChrg_Volt": 2, "LmtDschrg_Curr": 2, "LmtDschrg_Diag": 2, "LmtDschrg_Soc": 2, "LmtDschrg_Tbd": 2, "LmtDschrg_Tmpr": 2, "LmtDschrg_Volt": 2,}

    Send Can Message    HVESSS2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Curr
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Diag
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Soc
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tbd
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tmpr
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Volt
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Curr
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Diag
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Soc
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tbd
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tmpr
    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Volt
    Should Be Equal As Numbers    ${value}    2

    Log    Assigning Maximum values to the signal
    ${signals}=    Evaluate    {"LmtChrg_Curr": 3, "LmtChrg_Diag": 3, "LmtChrg_Soc": 3, "LmtChrg_Tbd": 3, "LmtChrg_Tmpr": 3, "LmtChrg_Volt": 3, "LmtDschrg_Curr": 3, "LmtDschrg_Diag": 3, "LmtDschrg_Soc": 3, "LmtDschrg_Tbd": 3, "LmtDschrg_Tmpr": 3, "LmtDschrg_Volt": 3,}

    Send Can Message    HVESSS2_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Curr
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Diag
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Soc
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tbd
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Tmpr
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtChrg_Volt
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Curr
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Diag
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Soc
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tbd
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Tmpr
    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS2_BMS2_VDP_SG_HVESS.LmtDschrg_Volt
    Should Be Equal As Numbers    ${value}    3

VM-RX-0x297: Send mSbwFaults with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    Log    Assigning Minimum values to the signal
    ${signals}=    Evaluate    {"Flt_AppCRC": 0, "Flt_BattHigh": 0, "Flt_BlockData": 0, "Flt_BootCnt": 0, "Flt_CfgCRC": 0, "Flt_DrvSPI": 0, "Flt_DrvWtch": 0, "Flt_EEPROM": 0, "Flt_ErrorCurrent": 0, "Flt_GateDrv": 0, "Flt_MfgCRC": 0, "Flt_mSbwCtrl": 0, "Flt_RotEnc": 0, "Flt_RotEncBits": 0, "Flt_RotEncVar": 0, "Flt_SASRng": 0, "FLT_Temp": 0, "Flt_TrqLinearity": 0, "Flt_TrqRange": 0, "Flt_VehicleSpd": 0, "FltBattLow": 0, "MsgCntr": 0, "MsgCrc": 0, "Warn_Temp": 0,}
    Send Can Message    mSbwFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FLT_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FltBattLow
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_AppCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BattHigh
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BlockData
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BootCnt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_CfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvSPI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvWtch
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_EEPROM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_ErrorCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_GateDrv
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_MfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEnc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncBits
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncVar
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_SASRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqLinearity
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqRange
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_VehicleSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_mSbwCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Warn_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning mid values to the signal
    ${signals}=    Evaluate    {"Flt_AppCRC": 1, "Flt_BattHigh": 1, "Flt_BlockData": 1, "Flt_BootCnt": 1, "Flt_CfgCRC": 1, "Flt_DrvSPI": 1, "Flt_DrvWtch": 1, "Flt_EEPROM": 1, "Flt_ErrorCurrent": 1, "Flt_GateDrv": 1, "Flt_MfgCRC": 1, "Flt_mSbwCtrl": 1, "Flt_RotEnc": 1, "Flt_RotEncBits": 1, "Flt_RotEncVar": 1, "Flt_SASRng": 1, "FLT_Temp": 1, "Flt_TrqLinearity": 1, "Flt_TrqRange": 1, "Flt_VehicleSpd": 1, "FltBattLow": 1, "MsgCntr": 1, "MsgCrc": 1, "Warn_Temp": 1,}
    Send Can Message    mSbwFaults    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FLT_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FltBattLow
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_AppCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BattHigh
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BlockData
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BootCnt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_CfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvSPI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvWtch
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_EEPROM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_ErrorCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_GateDrv
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_MfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEnc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncBits
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncVar
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_SASRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqLinearity
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqRange
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_VehicleSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_mSbwCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Warn_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${signals}=    Evaluate    {"Flt_AppCRC": 2, "Flt_BattHigh": 2, "Flt_BlockData": 2, "Flt_BootCnt": 2, "Flt_CfgCRC": 2, "Flt_DrvSPI": 2, "Flt_DrvWtch": 2, "Flt_EEPROM": 2, "Flt_ErrorCurrent": 2, "Flt_GateDrv": 2, "Flt_MfgCRC": 2, "Flt_mSbwCtrl": 2, "Flt_RotEnc": 2, "Flt_RotEncBits": 2, "Flt_RotEncVar": 2, "Flt_SASRng": 2, "FLT_Temp": 2, "Flt_TrqLinearity": 2, "Flt_TrqRange": 2, "Flt_VehicleSpd": 2, "FltBattLow": 2, "MsgCntr": 2, "MsgCrc": 2, "Warn_Temp": 2,}
    Send Can Message    mSbwFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FLT_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FltBattLow
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_AppCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BattHigh
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BlockData
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BootCnt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_CfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvSPI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvWtch
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_EEPROM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_ErrorCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_GateDrv
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_MfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEnc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncBits
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncVar
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_SASRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqLinearity
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqRange
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_VehicleSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_mSbwCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Warn_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    Log    Assigning Maximum values to the signal

    ${signals}=    Evaluate    {"Flt_AppCRC": 3, "Flt_BattHigh": 3, "Flt_BlockData": 3, "Flt_BootCnt": 3, "Flt_CfgCRC": 3, "Flt_DrvSPI": 3, "Flt_DrvWtch": 3, "Flt_EEPROM": 3, "Flt_ErrorCurrent": 3, "Flt_GateDrv": 3, "Flt_MfgCRC": 3, "Flt_mSbwCtrl": 3, "Flt_RotEnc": 3, "Flt_RotEncBits": 3, "Flt_RotEncVar": 3, "Flt_SASRng": 3, "FLT_Temp": 3, "Flt_TrqLinearity": 3, "Flt_TrqRange": 3, "Flt_VehicleSpd": 3, "FltBattLow": 3, "MsgCntr": 3, "MsgCrc": 3, "Warn_Temp": 3,}

    Send Can Message    mSbwFaults    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FLT_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.FltBattLow
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_AppCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BattHigh
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BlockData
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_BootCnt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_CfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvSPI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_DrvWtch
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_EEPROM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_ErrorCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_GateDrv
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_MfgCRC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEnc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncBits
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_RotEncVar
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_SASRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqLinearity
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_TrqRange
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_VehicleSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Flt_mSbwCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwFaults_VDP_SG_mSbwFau.Warn_Temp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3


VM-RX-0xcf090a6: Send HVESSD1_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD1_BMS2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"PwrAvailDischrg": 380.6, "PwrAvailChrg": 0, "MvVoltBatt": 100, "MvCurrBatt": 210.5,}
    Send Can Message    HVESSD1_BMS2    ${signals}
    Sleep    0.5s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailDischrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    380.6    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvVoltBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvCurrBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    210.5    precision=0.001

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"PwrAvailDischrg": 999, "PwrAvailChrg": 770.9, "MvVoltBatt": 550.8, "MvCurrBatt": 1000,}
    Send Can Message    HVESSD1_BMS2    ${signals}
    Sleep    0.5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailDischrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    999

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    770.9    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvVoltBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    550.8    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvCurrBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1000

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"PwrAvailDischrg": 3000.1, "PwrAvailChrg": 2200, "MvVoltBatt": 990, "MvCurrBatt": 1500.75,}
    Send Can Message    HVESSD1_BMS2    ${signals}
    Sleep    0.5s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailDischrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3000.1    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvVoltBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    990

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvCurrBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1500.75    precision=0.001

VM-RX-0xcf10ca6: Send HVESSD10_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD10_BMS2 and XCP variable read

    Log    Assigning Minimum Values to the signals
    ${signals}=    Evaluate    {"CellSocMaxIdMod": 100, "CellSocMaxIdCell": 0, "CellSocMinIdMod": 0, "CellSocMinIdCell": 75, "HvIsoResistActive": 0, "HvIsoResistPassive": 2800}
    Send Can Message    HVESSD10_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    75

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2800

    Log    Assigning mid Values to the signals

    ${signals}=    Evaluate    {"CellSocMaxIdMod": 80, "CellSocMaxIdCell": 212, "CellSocMinIdMod": 32, "CellSocMinIdCell": 90, "HvIsoResistActive": 1200, "HvIsoResistPassive": 3500}
    Send Can Message    HVESSD10_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    80

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    212

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    90

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3500

    Log    Assigning maximum Values to the signals

    ${signals}=    Evaluate    {"CellSocMaxIdMod": 250, "CellSocMaxIdCell": 100, "CellSocMinIdMod": 45, "CellSocMinIdCell": 112, "HvIsoResistActive": 3400, "HvIsoResistPassive": 6200}
    Send Can Message    HVESSD10_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    45

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.CellSocMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    112

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3400

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    6200

VM-RX-0xcf092a6: Send HVESSD3_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD3_BMS2 and XCP variable read
    ${signals}=    Evaluate    {"CellTmprMax": 120, "CellTmprMin": 40, "CellTmprAvg": 0.5, "CellTmprDeltaStat": 0,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    120

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${signals}=    Evaluate    {"CellTmprMax": 550, "CellTmprMin": 390.9, "CellTmprAvg": 1003, "CellTmprDeltaStat": 1,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    550

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    390.9    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1003

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${signals}=    Evaluate    {"CellTmprMax": 1700, "CellTmprMin": 280, "CellTmprAvg": 1600, "CellTmprDeltaStat": 2,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1700

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    280

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1600

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2


VM-RX-0xcf093a6: Send HVESSD4_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD4_BMS2 and XCP variable read
    ${signals}=    Evaluate    {"CapacAvailDschrg": 0.1, "CapacAvailChrg": 9.9, "CellBalCount": 1000,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.1    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    9.9    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1000

    ${signals}=    Evaluate    {"CapacAvailDschrg": 100, "CapacAvailChrg": 440, "CellBalCount": 20,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    440

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    20

    ${signals}=    Evaluate    {"CapacAvailDschrg": 642, "CapacAvailChrg": 620.5, "CellBalCount": 50000,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    642

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    620.5   precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    50000


VM-RX-0xcf094a6: Send HVESSD5_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD5_BMS2 and XCP variable read

    Log  Assigning Minimum value to the signals

    ${signals}=    Evaluate    {"CurrAvailDschrg": -1600, "CurrAvailChrg": 109, "CellSocMin": 0.5, "CellSocMax": 99}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1600    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    109

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99    precision=0.001

    Log    Assigning mid values to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrg": -800, "CurrAvailChrg": 800, "CellSocMin": 25.0, "CellSocMax": 75.0}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -800    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    800

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.0    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    75.0    precision=0.001

    Log    Assigning maximum value to the signals
    ${signals}=    Evaluate    {"CurrAvailDschrg": 0, "CurrAvailChrg": 1000, "CellSocMin": 0.5, "CellSocMax": 99.9}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99.9    precision=0.001

VM-RX-0xcf091a6: Send HVESSD2_BMS2 with Signal Values and Verify by reading XCP Variable

    [Documentation]    Validate RX message HVESSD2_BMS2 and XCP variable read
    Log    Assiging minimum values
    ${signals}=    Evaluate    {"BattSocFast": 0.1, "CellVoltMax": 5.5, "CellVoltMin": 3.7, "CellVoltDeltaStat": 0}
    Send Can Message    HVESSD2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.BattSocFast
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.1    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3.7    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assiging Mid values
    ${signals}=    Evaluate    {"BattSocFast": 55, "CellVoltMax": 37, "CellVoltMin": 40, "CellVoltDeltaStat": 1}
    Send Can Message    HVESSD2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.BattSocFast
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    55

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    37

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    Log    Assiging Maximum values
    ${signals}=    Evaluate    {"BattSocFast": 90.9, "CellVoltMax": 58.8, "CellVoltMin": 62, "CellVoltDeltaStat": 4}
    Send Can Message    HVESSD2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.BattSocFast
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    90.9    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    58.8    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    62    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD2_BMS2_VDP_SG_HVESS.CellVoltDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4

VM-RX-0x68: Send mWhdWarn with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mWhdWarn and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"W_MOTOR_STALLED": 0,"W_TEMP_SENSOR": 0,"W_POSSENSOR": 0,"W_INV01_TEMP": 0,"W_INV02_TEMP": 0,"W_INV03_TEMP": 0,"W_INV04_TEMP": 0,"W_INV05_TEMP": 0,"W_INV06_TEMP": 0,"W_CPU_TEMP": 0,"W_WINDING_TEMP": 0,"W_DCLINK_TEMP": 0,"W_DCLINK_COMM": 0,"W_INV01_OVERCURRENT": 0,"W_INV02_OVERCURRENT": 0,"W_INV03_OVERCURRENT": 0,"W_INV04_OVERCURRENT": 0,"W_INV05_OVERCURRENT": 0,"W_INV06_OVERCURRENT": 0,"W_OVERVOLTAGE": 0,"W_UNDERVOLTAGE": 0,"W_INV01_FAULT": 0,"W_INV02_FAULT": 0,"W_INV03_FAULT": 0,"W_INV04_FAULT": 0,"W_INV05_FAULT": 0,"W_INV06_FAULT": 0,"W_CAN_SEND_ERROR": 0,"W_CAN_OVERFLOW": 0,"W_MOTOR_OVERSPEED": 0,"W_CPU_FAULT": 0,"W_TORQUE_LIMIT": 0,"W_FLYING_START": 0, "MsgCntr": 0,}
    Send Can Message    mWhdWarn    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_MOTOR_STALLED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_TEMP_SENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_POSSENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV01_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV02_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV03_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV04_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV05_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV06_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CPU_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_WINDING_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_DCLINK_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_DCLINK_COMM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV01_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV02_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV03_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV04_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV05_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV06_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_OVERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_UNDERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV01_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV02_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV03_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV04_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV05_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV06_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CAN_SEND_ERROR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CAN_OVERFLOW
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_MOTOR_OVERSPEED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CPU_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_TORQUE_LIMIT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_FLYING_START
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"W_MOTOR_STALLED": 1,"W_TEMP_SENSOR": 1,"W_POSSENSOR": 1,"W_INV01_TEMP": 1,"W_INV02_TEMP": 1,"W_INV03_TEMP": 1,"W_INV04_TEMP": 1,"W_INV05_TEMP": 1,"W_INV06_TEMP": 1,"W_CPU_TEMP": 1,"W_WINDING_TEMP": 1,"W_DCLINK_TEMP": 1,"W_DCLINK_COMM": 1,"W_INV01_OVERCURRENT": 1,"W_INV02_OVERCURRENT": 1,"W_INV03_OVERCURRENT": 1,"W_INV04_OVERCURRENT": 1,"W_INV05_OVERCURRENT": 1,"W_INV06_OVERCURRENT": 1,"W_OVERVOLTAGE": 1,"W_UNDERVOLTAGE": 1,"W_INV01_FAULT": 1,"W_INV02_FAULT": 1,"W_INV03_FAULT": 1,"W_INV04_FAULT": 1,"W_INV05_FAULT": 1,"W_INV06_FAULT": 1,"W_CAN_SEND_ERROR": 1,"W_CAN_OVERFLOW": 1,"W_MOTOR_OVERSPEED": 1,"W_CPU_FAULT": 1,"W_TORQUE_LIMIT": 1,"W_FLYING_START": 1, "MsgCntr": 1, }
    Send Can Message    mWhdWarn    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_MOTOR_STALLED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_TEMP_SENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_POSSENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV01_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV02_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV03_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV04_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV05_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV06_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CPU_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_WINDING_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_DCLINK_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_DCLINK_COMM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV01_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV02_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV03_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV04_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV05_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV06_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_OVERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_UNDERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV01_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV02_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV03_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV04_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV05_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_INV06_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CAN_SEND_ERROR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CAN_OVERFLOW
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_MOTOR_OVERSPEED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_CPU_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_TORQUE_LIMIT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.W_FLYING_START
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_3.PP_SG_mWhdWarn_VDP_SG_mWhdWarn.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

VM-RX-0x66: Send mWhdStat3 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mWhdStat3 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"WhdAngle": 0,"WhdCurr_Ph1A": -127,"WhdCurr_Ph2A": -127,"WhdCurr_Ph1B": -127,"WhdCurr_Ph2B": -127,"WhdCurr_Ph1C": -127,"WhdCurr_Ph2C": -127,}
    Send Can Message    mWhdStat3    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -127

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhdAngle":180,"WhdCurr_Ph1A":1,"WhdCurr_Ph2A":1,"WhdCurr_Ph1B":1,"WhdCurr_Ph2B":1,"WhdCurr_Ph1C":1,"WhdCurr_Ph2C":1,}
    Send Can Message    mWhdStat3    ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   180

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhdAngle": 360,"WhdCurr_Ph1A":128,"WhdCurr_Ph2A":128,"WhdCurr_Ph1B":128,"WhdCurr_Ph2B":128,"WhdCurr_Ph1C":128,"WhdCurr_Ph2C":128,}
    Send Can Message    mWhdStat3    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	360

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   128

VM-RX-0xcfdd733: Send mLeftJoyStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mLeftJoyStat and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl": 0,"LeftX_Neg": 0,"LeftX_Pos": 0,"LeftX_Value": 0,"LeftY_Ntrl": 0,"LeftY_Neg": 0,"LeftY_Pos": 0,"LeftY_Value": 0,"Btn_Dwn": 0,"Btn_Right": 0,"Btn_Up": 0,"Btn_Left": 0,}

    Send Can Message    mLeftJoyStat    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning second Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl": 1,"LeftX_Neg": 1,"LeftX_Pos": 1,"LeftX_Value": 700,"LeftY_Ntrl": 1,"LeftY_Neg": 1,"LeftY_Pos": 1,"LeftY_Value": 700,"Btn_Dwn": 1,"Btn_Right": 1,"Btn_Up": 1,"Btn_Left": 1,}

    Send Can Message    mLeftJoyStat    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   700

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   700

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    Log    Assigning third Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl": 2,"LeftX_Neg": 2,"LeftX_Pos": 2,"LeftX_Value": 1023,"LeftY_Ntrl": 2,"LeftY_Neg": 2,"LeftY_Pos": 2,"LeftY_Value": 1023,"Btn_Dwn": 2,"Btn_Right": 2,"Btn_Up": 2,"Btn_Left": 2,}

    Send Can Message    mLeftJoyStat    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    Log    Assigning fourth Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl": 3,"LeftX_Neg": 3,"LeftX_Pos": 3,"LeftX_Value": 1023,"LeftY_Ntrl": 3,"LeftY_Neg": 3,"LeftY_Pos": 3,"LeftY_Value": 1023,"Btn_Dwn": 3,"Btn_Right": 3,"Btn_Up": 3,"Btn_Left": 3,}

    Send Can Message    mLeftJoyStat    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat_VDP_SG_mLeft.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

VM-RX-0x7: Send mEbcm2L_BrkTrqEst with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_BrkTrqEst and XCP variable read

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BrkTrqEstFL": 0,"BrkTrqEstFR": 0,"BrkTrqEstR": 0,"MsgCntr": 0,"MsgCrc": 7,}

    Send Can Message    mEbcm2L_BrkTrqEst   ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    Log    Assigning middle Value to the signal
    ${signals}=    Evaluate    {"BrkTrqEstFL": 100,"BrkTrqEstFR": 100,"BrkTrqEstR": 100,"MsgCntr": 7,"MsgCrc": 56,}

    Send Can Message    mEbcm2L_BrkTrqEst   ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   56

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"BrkTrqEstFL": 2047,"BrkTrqEstFR": 2047,"BrkTrqEstR": 2047,"MsgCntr": 15,"MsgCrc": 100,}

    Send Can Message    mEbcm2L_BrkTrqEst   ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	2047

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2047

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2047

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

VM-RX-0x7e: Send mEbcm2L_BrkPress2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_BrkPress2 XCP variable read

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"PrsrEstFR": 0,"PrsrEstFL": 0,"PrsrEstRR": 0,"PrsrEstRL": 0,"MsgCntr": 0,"MsgCrc": 7,}

    Send Can Message    mEbcm2L_BrkPress2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    Log    Assigning middle Value to the signal
    ${signals}=    Evaluate    {"PrsrEstFR": 20,"PrsrEstFL": 20,"PrsrEstRR": 20,"PrsrEstRL": 20,"MsgCntr": 7,"MsgCrc": 56,}

    Send Can Message    mEbcm2L_BrkPress2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   56

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"PrsrEstFR": 40,"PrsrEstFL": 40,"PrsrEstRR": 40,"PrsrEstRL": 40,"MsgCntr": 15,"MsgCrc": 100,}

    Send Can Message    mEbcm2L_BrkPress2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

VM-RX-0x10c: Send mAVAS_Stat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mAVAS_Stat XCP variable read

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"AVAS_E2E_Fault": 0,"AVAS_LoC": 0,"SwMaj": 0,"SwMin": 0,"HwMaj": 0,"HwMin": 0,"MsgCntr": 0,"MsgCrc": 7,}

    Send Can Message    mAVAS_Stat  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.AVAS_E2E_Fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.AVAS_LoC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.HwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.HwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    Log    Assigning middle Value to the signal
    ${signals}=    Evaluate    {"AVAS_E2E_Fault": 0,"AVAS_LoC": 0,"SwMaj": 50,"SwMin": 50,"HwMaj": 50,"HwMin": 50,"MsgCntr": 7,"MsgCrc": 50,}

    Send Can Message    mAVAS_Stat  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.AVAS_E2E_Fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.AVAS_LoC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.HwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.HwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"AVAS_E2E_Fault": 0,"AVAS_LoC": 0,"SwMaj": 255,"SwMin": 255,"HwMaj": 255,"HwMin": 255,"MsgCntr": 15,"MsgCrc": 100,}

    Send Can Message    mAVAS_Stat  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.AVAS_E2E_Fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.AVAS_LoC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.HwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.HwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAvasRx500.PP_SG_mAVAS_Stat_VDP_SG_mAVAS_S.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

VM-RX-0xcf096a6: Send HVESSS1_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSS1_BMS2 XCP variable read

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 0,"BattCntctrNeg": 0,"BattDiscWarn": 0,"BattCntctrPcStat": 0,"BattCntctrStat": 0,"HvIsoStatActive": 0,"HvIsoStatPassive": 0,"HvilStat": 0,"InertSwStat": 0,"BattSocStat": 0,"CellBalStat": 0,"CellBalActive": 0,"IntChrgrStat": 0,"MsgCntr": 0,"BattEnblStat": 0,"OpStat": 0,"BattRdyCount": 0,"MsgCrc": 7,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    Log    Assigning mid Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 1,"BattCntctrNeg": 1,"BattDiscWarn": 1,"BattCntctrPcStat": 1,"BattCntctrStat": 1,"HvIsoStatActive": 1,"HvIsoStatPassive": 1,"HvilStat": 1,"InertSwStat": 1,"BattSocStat": 1,"CellBalStat": 1,"CellBalActive": 1,"IntChrgrStat": 1,"MsgCntr": 7,"BattEnblStat": 1,"OpStat": 1,"BattRdyCount": 80,"MsgCrc": 8,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   80

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   8

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 2,"BattCntctrNeg": 2,"BattDiscWarn": 2,"BattCntctrPcStat": 2,"BattCntctrStat": 2,"HvIsoStatActive": 2,"HvIsoStatPassive": 2,"HvilStat": 2,"InertSwStat": 2,"BattSocStat": 2,"CellBalStat": 2,"CellBalActive": 2,"IntChrgrStat": 2,"MsgCntr": 15,"BattEnblStat": 2,"OpStat": 2,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 3,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 3,"HvIsoStatPassive": 3,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 3,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 3,"OpStat": 3,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 4,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 4,"HvIsoStatPassive": 4,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 4,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 4,"OpStat": 4,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 5,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 5,"HvIsoStatPassive": 5,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 5,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 4,"OpStat": 5,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 6,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 6,"HvIsoStatPassive": 6,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 6,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 4,"OpStat": 6,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 7,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 6,"HvIsoStatPassive": 6,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 6,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 4,"OpStat": 5,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 13,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 6,"HvIsoStatPassive": 6,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 6,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 4,"OpStat": 5,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   13

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 15,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 15,"HvIsoStatPassive": 15,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 15,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 15,"OpStat": 15,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15


    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"BattCntctrPos": 3,"BattCntctrNeg": 3,"BattDiscWarn": 14,"BattCntctrPcStat": 3,"BattCntctrStat": 3,"HvIsoStatActive": 14,"HvIsoStatPassive": 14,"HvilStat": 3,"InertSwStat": 3,"BattSocStat": 14,"CellBalStat": 3,"CellBalActive": 3,"IntChrgrStat": 3,"MsgCntr": 15,"BattEnblStat": 14,"OpStat": 14,"BattRdyCount": 250,"MsgCrc": 15,}

    Send Can Message    HVESSS1_BMS2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrNeg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattDiscWarn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrPcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattCntctrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvIsoStatPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.HvilStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.InertSwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattSocStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.CellBalActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.IntChrgrStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.OpStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.BattRdyCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_3.PP_SG_HVESSS1_BMS2_VDP_SG_HVESS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

VM-RX-0x305: Send mEpb_EpbStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEpb_EpbStat XCP variable read

    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"EpbStat": 0,"EPB_Current": 0,"SwMin": 0,"SwMaj": 0,"Flt_mBrkCtrl": 0,"Flt_EpbIC": 0,"Flt_EpbMtrCurrent": 0,"Flt_EpbOpenCircuit": 0,"Flt_EpbGndShort": 0,"Flt_EpbBattShort": 0,"Flt_Epb": 0,"SwStat": 0,"Flt_StallDisengaged": 0,"Flt_StallEngaged": 0,"SwRev": 0,"MsgCntr": 0,"MsgCrc": 0,}

    Send Can Message    mEpb_EpbStat  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EpbStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbIC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbMtrCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbOpenCircuit
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbGndShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbBattShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_Epb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_StallDisengaged
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_StallEngaged
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning middle Value to the signal
    ${signals}=    Evaluate    {"EpbStat": 1,"EPB_Current": 20,"SwMin": 7,"SwMaj": 7,"Flt_mBrkCtrl": 2,"Flt_EpbIC": 1,"Flt_EpbMtrCurrent": 1,"Flt_EpbOpenCircuit": 1,"Flt_EpbGndShort": 1,"Flt_EpbBattShort": 1,"Flt_Epb": 1,"SwStat": 1,"Flt_StallDisengaged": 1,"Flt_StallEngaged": 1,"SwRev": 7,"MsgCntr": 7,"MsgCrc": 50,}

    Send Can Message    mEpb_EpbStat  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EpbStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    #Failing with offset calcuation

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   20

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbIC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbMtrCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbOpenCircuit
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbGndShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbBattShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_Epb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_StallDisengaged
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_StallEngaged
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50


    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"EpbStat": 1,"EPB_Current": 40,"SwMin": 15,"SwMaj": 15,"Flt_mBrkCtrl": 3,"Flt_EpbIC": 1,"Flt_EpbMtrCurrent": 1,"Flt_EpbOpenCircuit": 1,"Flt_EpbGndShort": 1,"Flt_EpbBattShort": 1,"Flt_Epb": 1,"SwStat": 1,"Flt_StallDisengaged": 1,"Flt_StallEngaged": 1,"SwRev": 15,"MsgCntr": 15,"MsgCrc": 255,}

    Send Can Message    mEpb_EpbStat  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EpbStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    #Failing with offset calcuation

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   40

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbIC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbMtrCurrent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbOpenCircuit
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbGndShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_EpbBattShort
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_Epb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_StallDisengaged
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.Flt_StallEngaged
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

VM-RX-0xcf095a6: Send CAN signal values and validate them by reading HVESSD6_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 0, "ElecTmpr": 100, "BattTmpr": 0,}
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 1500, "ElecTmpr": 180, "BattTmpr": 40, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1500
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    180
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 3212.75, "ElecTmpr": 210, "BattTmpr": 200, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3212.75    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    210
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   200

VM-RX-0xcf0a0a6: Send CAN signal values and validate them by reading HVESSD7_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 10, "EnrgyAvailChrg": 1200, "ChrgVoltMax": 100.1,}
    Send Can Message    HVESSD7_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100.1    precision=0.001

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 10000.1, "EnrgyAvailChrg": 14000, "ChrgVoltMax": 2300, }
    Send Can Message    HVESSD7_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10000.1    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    14000    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2300

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 16000, "EnrgyAvailChrg": 98.8, "ChrgVoltMax": 3212.1,}
    Send Can Message    HVESSD7_BMS2   ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    16000    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    98.8    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3212.1    precision=0.001

VM-RX-0x690: Send CAN signal values and validate them by reading mEbcm1U_SwVer through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"SwVerMin": 1, "SwVerMaj": 0, "SwVerStat": 0, "SwVerRev": 2,}
    Send Can Message    mEbcm1U_SwVer    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"SwVerMin": 3, "SwVerMaj": 7, "SwVerStat": 0, "SwVerRev": 6,}
    Send Can Message    mEbcm1U_SwVer    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    6

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"SwVerMin": 15, "SwVerMaj": 15, "SwVerStat": 1, "SwVerRev": 15,}
    Send Can Message    mEbcm1U_SwVer    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10000.PP_SG_mEbcm1U_SwVer_VDP_SG_mEbc.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

VM-RX-0x80: Send CAN signal values and validate them by reading mEbcm2L_BrkPress through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"PrsrMstCyl": -2, "PrsrFrontWCP": -327.68, "PrsrRearWCP": -2, "MsgCntr": 0, "PrsrMstrCylValid": 0, "MsgCrc": 0,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -327.68    precision=0.001
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"PrsrMstCyl": 8, "PrsrFrontWCP": 2, "PrsrRearWCP": 8, "MsgCntr": 5, "PrsrMstrCylValid": 0, "MsgCrc": 55,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    8
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    8
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    55

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"PrsrMstCyl": 32.767, "PrsrFrontWCP": 327.67, "PrsrRearWCP": 32.767, "MsgCntr": 15, "PrsrMstrCylValid": 1, "MsgCrc": 255,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   32.767   precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001

    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32.767   precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


VM-RX-0x7c: Send CAN signal values and validate them by reading mEbcm2L_WhlCnt through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"WhlCntFL": 0, "WhlCntFR": 0, "WhlCntR": 0,}
    Send Can Message    mEbcm2L_WhlCnt    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"WhlCntFL": 2045, "WhlCntFR": 2045, "WhlCntR": 2045,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_WhlCnt    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2045
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2045
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2045

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhlCntFL": 4093, "WhlCntFR": 4093, "WhlCntR": 4093,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_WhlCnt    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4093
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4093
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4093


VM-RX-0x81: Send CAN signal values and validate them by reading mEbcm2L_WhlSlip through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"WhlSlipFL": -100, "WhlSlipFR": -100, "WhlSlipR": -100, "MsgCntr": 0, "MsgCrc": 0, }
    Send Can Message    mEbcm2L_WhlSlip    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -100
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"WhlSlipFL": 0, "WhlSlipFR": 0, "WhlSlipR": 0, "MsgCntr": 7, "MsgCrc": 128, }
    Send Can Message    mEbcm2L_WhlSlip    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhlSlipFL": 327.67, "WhlSlipFR": 327.67, "WhlSlipR": 327.67, "MsgCntr": 15, "MsgCrc": 255, }
    Send Can Message    mEbcm2L_WhlSlip    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


VM-RX-0x18ff08a6: Send CAN signal values and validate them by reading STATUS_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"STATUS_Runmode_F3": 0,}
    Send Can Message    STATUS_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx10.PP_SG_STATUS_BMS2_VDP_SG_STATUS.STATUS_Runmode_F3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"STATUS_Runmode_F3": 2,}
    Send Can Message    STATUS_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx10.PP_SG_STATUS_BMS2_VDP_SG_STATUS.STATUS_Runmode_F3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"STATUS_Runmode_F3": 4,}
    Send Can Message    STATUS_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx10.PP_SG_STATUS_BMS2_VDP_SG_STATUS.STATUS_Runmode_F3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4

VM-RX-0x18fe8da6: Send CAN signal values and validate them by reading VEP2_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"MvVoltAux": 0,}
    Send Can Message    VEP2_BMS2   ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx1000.PP_SG_VEP2_BMS2_VDP_SG_VEP2_BMS.MvVoltAux
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
#fail with raw value
    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"MvVoltAux": 1510.5,}
    Send Can Message    VEP2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx1000.PP_SG_VEP2_BMS2_VDP_SG_VEP2_BMS.MvVoltAux
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1510.5    precision=0.001

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"MvVoltAux": 3212.75,}
    Send Can Message    VEP2_BMS2    ${signals}
    Sleep    1.5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx1000.PP_SG_VEP2_BMS2_VDP_SG_VEP2_BMS.MvVoltAux
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3212.75    precision=0.001

VM-RX-0xcf10aa6: Send CAN signal values and validate them by reading HVESSD8_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read


    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"CellVoltMaxIdMod": 5, "CellVoltMaxIdCell": 10, "CellVoltMinIdMod": 3, "CellVoltMinIdCell": 1, "CellVoltAvg": 0}
    Send Can Message    HVESSD8_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    5
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"CellVoltMaxIdMod": 50, "CellVoltMaxIdCell": 100, "CellVoltMinIdMod": 207, "CellVoltMinIdCell": 30, "CellVoltAvg": 13.5}
    Send Can Message    HVESSD8_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    50
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    207
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30
    #failing with offset value
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    13.5    precision=0.001


    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"CellVoltMaxIdMod": 210, "CellVoltMaxIdCell": 200, "CellVoltMinIdMod": 90, "CellVoltMinIdCell": 80, "CellVoltAvg": 64}
    Send Can Message    HVESSD8_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    210
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    90
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    80
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64

VM-RX-0xcf10ba6: Send CAN signal values and validate them by reading HVESSD9_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read
    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"CellTmprMaxIdCell": 4, "CellTmprMaxIdMod": 2, "CellTmprMinIdCell": 7, "CellTmprMinIdMod": 9, "ThrmlEventDetect": 0}
    Send Can Message    HVESSD9_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    9
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.ThrmlEventDetect
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"CellTmprMaxIdCell": 44, "CellTmprMaxIdMod": 22, "CellTmprMinIdCell": 56, "CellTmprMinIdMod": 99, "ThrmlEventDetect": 1}
    Send Can Message    HVESSD9_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    44
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    22
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    56
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.ThrmlEventDetect
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"CellTmprMaxIdCell": 199, "CellTmprMaxIdMod": 200, "CellTmprMinIdCell": 100, "CellTmprMinIdMod": 109, "ThrmlEventDetect": 2}
    Send Can Message    HVESSD9_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    199
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    109
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.ThrmlEventDetect
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

VM-RX-0xcff94a6: Send mCurrAvailPeak_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mCurrAvailPeak_BMS2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrgPeak": -1600, "CurrAvailChrgPeak": -1600,}
    Run Keyword And Continue On Failure    Send Can Message    mCurrAvailPeak_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailDschrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1600
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailChrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1600

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrgPeak": -1555, "CurrAvailChrgPeak": -1555,}
    Send Can Message    mCurrAvailPeak_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailDschrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1555

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailChrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1555

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrgPeak": -1540, "CurrAvailChrgPeak": -1540,}
    Run Keyword And Continue On Failure    Send Can Message    mCurrAvailPeak_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailDschrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1540

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx500.PP_SG_mCurrAvailPeak_BMS2_VDP_S.CurrAvailChrgPeak
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1540


VM-RX-0x300: Send mEbcm2L_EpbStat with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.1

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.4

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


VM-RX-0xcfdd733: Send mLeftJoyStat2 with Signal Values and Verify by reading XCP Variable
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

    ${signals}=    Evaluate    {"LeftZ_Ntrl": 2, "LeftZ_Neg": 2, "LeftZ_Pos": 2, "LeftZ_Value": 900,}
    Run Keyword And Continue On Failure    Send Can Message    mLeftJoyStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mLeftJoyStat2_VDP_SG_mLef.LeftZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    900

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



VM-RX-0x298: Send mSbwPosition with Signal Values and Verify by reading XCP Variable
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

    ${signals}=    Evaluate    {"Position": 0.01, "RawPosition": 0.01, "MsgCntr": 12, "RightStopLmt": 0, "LeftStopLmt": 0, "MsgCrc": 15,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwPosition    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.Position
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.01    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.01    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${signals}=    Evaluate    {"Position": 0.02, "RawPosition": 0.02, "MsgCntr": 12, "RightStopLmt": 0, "LeftStopLmt": 0, "MsgCrc": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwPosition    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.Position
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.02    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.02    precision=0.001

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.06        precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RawPosition
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.06        precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwPosition_VDP_SG_mSbwP.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


VM-RX-0x290: Send mSbwStat with Signal Values and Verify by reading XCP Variable
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

    ${signals}=    Evaluate    {"MtrTrqEst": -105, "MtrDcStat": -40, "MtrCurr": 13.79, "LvVolt": 14.79, "SwitchStat": 3, "InvTmpr": 100, "TrqSnsIn": -105, "TrqSnsIn_1C": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure  Should Be Equal As Numbers    ${value}    -105

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -40
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    13.79        precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    14.79        precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -105

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30


    ${signals}=    Evaluate    {"MtrTrqEst": 120, "MtrDcStat": 60, "MtrCurr": 1, "LvVolt": 1, "SwitchStat": 3, "InvTmpr": 125, "TrqSnsIn": 120, "TrqSnsIn_1C": 30,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure  Should Be Equal As Numbers    ${value}    120

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    60

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    125

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    120

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"MtrTrqEst": 127, "MtrDcStat": 100, "MtrCurr": 25.5, "LvVolt": 25.5, "SwitchStat": 6, "InvTmpr": 255, "TrqSnsIn": 125, "TrqSnsIn_1C": 255,}
    Run Keyword And Continue On Failure    Send Can Message    mSbwStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrDcStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.5        precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.5        precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.SwitchStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    6

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    125

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat_VDP_SG_mSbwStat.TrqSnsIn_1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

VM-RX-0x65: Send mWhdStat2 with Signal Values and Verify by reading XCP Variable

    [Documentation]    Validate RX message mWhdStat2 and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LvVolt": 0, "MtrTmpr": 0, "InvTmpr": 0, "TrqAvailMtr": 0, "TrqAvailRegen": 0, "WhdRdy": 0, "WhdShtdwnRdy": 0, "HwWakeStat": 0, "WhdState": 0, "MsgCntr": 0, "TrqLmt_Design": 0, "TrqLmt_InvTmpr": 0, "TrqLmt_MtrSpd": 0, "TrqLmt_MtrTmpr": 0, "TrqLmt_Pwr": 0, "TrqLmt_SpdSlew": 0, "TrqLmt_TrqSlew": 0, "TrqLmt_Volt": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mWhdStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqAvailMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqAvailRegen
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.HwWakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_Design
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_MtrSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_Pwr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_SpdSlew
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_TrqSlew
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_Volt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"LvVolt": 12.5, "MtrTmpr": 128, "InvTmpr": 128, "TrqAvailMtr": 128, "TrqAvailRegen": 128, "WhdRdy": 0, "WhdShtdwnRdy": 0, "HwWakeStat": 0, "WhdState": 1, "MsgCntr": 7, "TrqLmt_Design": 0, "TrqLmt_InvTmpr": 0, "TrqLmt_MtrSpd": 0, "TrqLmt_MtrTmpr": 0, "TrqLmt_Pwr": 0, "TrqLmt_SpdSlew": 0, "TrqLmt_TrqSlew": 0, "TrqLmt_Volt": 0,}

    Run Keyword And Continue On Failure    Send Can Message    mWhdStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqAvailMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqAvailRegen
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7


    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"LvVolt": 25.4, "MtrTmpr": 214, "InvTmpr": 214, "TrqAvailMtr": 255, "TrqAvailRegen": 255, "WhdRdy": 1, "WhdShtdwnRdy": 1, "HwWakeStat": 1, "WhdState": 2, "MsgCntr": 15, "TrqLmt_Design": 1, "TrqLmt_InvTmpr": 1, "TrqLmt_MtrSpd": 1, "TrqLmt_MtrTmpr": 1, "TrqLmt_Pwr": 1, "TrqLmt_SpdSlew": 1, "TrqLmt_TrqSlew": 1, "TrqLmt_Volt": 1,}
    Run Keyword And Continue On Failure    Send Can Message    mWhdStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.4    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    214

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    214

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqAvailMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqAvailRegen
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.HwWakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.WhdState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_Design
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_MtrSpd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_Pwr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_SpdSlew
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_TrqSlew
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.TrqLmt_Volt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

VM-RX-0x67: Send mWhdFaults with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mWhdFaults and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"E_INIT_ERROR": 0, "E_INVALID_SETTINGS": 0, "E_MOTOR_STALLED": 0, "E_READING_TIMEOUT": 0, "E_HALL_SEQUENCE": 0, "E_HALL_SECTOR": 0, "E_TEMP_SENSOR": 0, "E_POSSENSOR": 0, "E_ENCODER": 0, "E_ZERO_POSITION": 0, "E_HW_ENABLE": 0, "E_INV01_TEMP": 0, "E_INV02_TEMP": 0, "E_INV03_TEMP": 0, "E_INV04_TEMP": 0, "E_INV05_TEMP": 0, "E_INV06_TEMP": 0, "E_CPU_TEMP": 0, "E_WINDING_TEMP": 0, "E_DCLINK_TEMP": 0, "E_DCLINK_COMM": 0, "E_INV01_OVERCURRENT": 0, "E_INV02_OVERCURRENT": 0, "E_INV03_OVERCURRENT": 0, "E_INV04_OVERCURRENT": 0, "E_INV05_OVERCURRENT": 0, "E_INV06_OVERCURRENT": 0, "E_OVERVOLTAGE": 0, "E_UNDERVOLTAGE": 0, "E_CAN_SAME_ID": 0, "E_CAN_TIMEOUT": 0, "E_INV01_FAULT": 0, "E_INV02_FAULT": 0, "E_INV03_FAULT": 0, "E_INV04_FAULT": 0, "E_INV05_FAULT": 0, "E_INV06_FAULT": 0, "E_CAN_SEND_ERR": 0, "E_CAN_OVERFLOW": 0, "E_MOTOR_OVERSPEED": 0, "E_CPU_FAULT": 0, "E_INV07_TEMP": 0, "E_INV08_TEMP": 0, "E_INV07_OVERCURRENT": 0, "E_INV08_OVERCURRENT": 0, "E_INV07_FAULT": 0, "E_INV08_FAULT": 0, "E_CAN_mWhdCtrl": 0, "E_CAN_mWhdCtrl2": 0, "MsgCntr": 0, "SwVerMaj": 1, "SwVerMin": 2,}
    Run Keyword And Continue On Failure    Send Can Message    mWhdFaults    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INIT_ERROR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INVALID_SETTINGS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_MOTOR_STALLED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_READING_TIMEOUT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_HALL_SEQUENCE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_HALL_SECTOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_TEMP_SENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_POSSENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_ENCODER
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_ZERO_POSITION
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_HW_ENABLE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV01_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV02_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV03_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV04_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV05_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV06_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CPU_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_WINDING_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_DCLINK_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_DCLINK_COMM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV01_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV02_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV03_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV04_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV05_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV06_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_OVERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_UNDERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_SAME_ID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_TIMEOUT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV01_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV02_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV03_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV04_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV05_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV06_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_SEND_ERR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_OVERFLOW
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_MOTOR_OVERSPEED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CPU_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV07_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV08_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV07_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV08_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV07_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV08_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_mWhdCtrl2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"E_INIT_ERROR": 0, "E_INVALID_SETTINGS": 0, "E_MOTOR_STALLED": 0, "E_READING_TIMEOUT": 0, "E_HALL_SEQUENCE": 0, "E_HALL_SECTOR": 0, "E_TEMP_SENSOR": 0, "E_POSSENSOR": 0, "E_ENCODER": 0, "E_ZERO_POSITION": 0, "E_HW_ENABLE": 0, "E_INV01_TEMP": 0, "E_INV02_TEMP": 0, "E_INV03_TEMP": 0, "E_INV04_TEMP": 0, "E_INV05_TEMP": 0, "E_INV06_TEMP": 0, "E_CPU_TEMP": 0, "E_WINDING_TEMP": 0, "E_DCLINK_TEMP": 0, "E_DCLINK_COMM": 0, "E_INV01_OVERCURRENT": 0, "E_INV02_OVERCURRENT": 0, "E_INV03_OVERCURRENT": 0, "E_INV04_OVERCURRENT": 0, "E_INV05_OVERCURRENT": 0, "E_INV06_OVERCURRENT": 0, "E_OVERVOLTAGE": 0, "E_UNDERVOLTAGE": 0, "E_CAN_SAME_ID": 0, "E_CAN_TIMEOUT": 0, "E_INV01_FAULT": 0, "E_INV02_FAULT": 0, "E_INV03_FAULT": 0, "E_INV04_FAULT": 0, "E_INV05_FAULT": 0, "E_INV06_FAULT": 0, "E_CAN_SEND_ERR": 0, "E_CAN_OVERFLOW": 0, "E_MOTOR_OVERSPEED": 0, "E_CPU_FAULT": 0, "E_INV07_TEMP": 0, "E_INV08_TEMP": 0, "E_INV07_OVERCURRENT": 0, "E_INV08_OVERCURRENT": 0, "E_INV07_FAULT": 0, "E_INV08_FAULT": 0, "E_CAN_mWhdCtrl": 1, "E_CAN_mWhdCtrl2": 2, "MsgCntr": 10, "SwVerMaj": 10, "SwVerMin": 12,}
    Run Keyword And Continue On Failure    Send Can Message    mWhdFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_mWhdCtrl2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"E_INIT_ERROR": 1, "E_INVALID_SETTINGS": 1, "E_MOTOR_STALLED": 1, "E_READING_TIMEOUT": 1, "E_HALL_SEQUENCE": 1, "E_HALL_SECTOR": 1, "E_TEMP_SENSOR": 1, "E_POSSENSOR": 1, "E_ENCODER": 1, "E_ZERO_POSITION": 1, "E_HW_ENABLE": 1, "E_INV01_TEMP": 1, "E_INV02_TEMP": 1, "E_INV03_TEMP": 1, "E_INV04_TEMP": 1, "E_INV05_TEMP": 1, "E_INV06_TEMP": 1, "E_CPU_TEMP": 1, "E_WINDING_TEMP": 1, "E_DCLINK_TEMP": 1, "E_DCLINK_COMM": 1, "E_INV01_OVERCURRENT": 1, "E_INV02_OVERCURRENT": 1, "E_INV03_OVERCURRENT": 1, "E_INV04_OVERCURRENT": 1, "E_INV05_OVERCURRENT": 1, "E_INV06_OVERCURRENT": 1, "E_OVERVOLTAGE": 1, "E_UNDERVOLTAGE": 1, "E_CAN_SAME_ID": 1, "E_CAN_TIMEOUT": 1, "E_INV01_FAULT": 1, "E_INV02_FAULT": 1, "E_INV03_FAULT": 1, "E_INV04_FAULT": 1, "E_INV05_FAULT": 1, "E_INV06_FAULT": 1, "E_CAN_SEND_ERR": 1, "E_CAN_OVERFLOW": 1, "E_MOTOR_OVERSPEED": 1, "E_CPU_FAULT": 1, "E_INV07_TEMP": 1, "E_INV08_TEMP": 1, "E_INV07_OVERCURRENT": 1, "E_INV08_OVERCURRENT": 1, "E_INV07_FAULT": 1, "E_INV08_FAULT": 1, "E_CAN_mWhdCtrl": 3, "E_CAN_mWhdCtrl2": 3, "MsgCntr": 14, "SwVerMaj": 15, "SwVerMin": 14,}

    Run Keyword And Continue On Failure    Send Can Message    mWhdFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INIT_ERROR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INVALID_SETTINGS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_MOTOR_STALLED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_READING_TIMEOUT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_HALL_SEQUENCE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_HALL_SECTOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_TEMP_SENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_POSSENSOR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_ENCODER
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_ZERO_POSITION
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_HW_ENABLE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV01_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV02_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV03_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV04_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV05_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV06_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CPU_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_WINDING_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_DCLINK_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_DCLINK_COMM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV01_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV02_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV03_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV04_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV05_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV06_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_OVERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_UNDERVOLTAGE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_SAME_ID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_TIMEOUT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV01_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV02_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV03_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV04_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV05_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV06_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_SEND_ERR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_OVERFLOW
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_MOTOR_OVERSPEED
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CPU_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV07_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV08_TEMP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV07_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV08_OVERCURRENT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV07_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_INV08_FAULT
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.E_CAN_mWhdCtrl2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    14


VM-RX-0x82: Send mEbcm1U_BrkPress2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm1U_BrkPress2 and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"PrsrEstMstCyl": -2, "PrsrFrontWCP": -327.68, "PrsrRearWCP": -2, "MsgCntr": 9, "PrsrEstMstrCylValid": 0, "MsgCrc": 4,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_BrkPress2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -327.68    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    9

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4


    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"PrsrEstMstCyl": 16.767, "PrsrFrontWCP": 99, "PrsrRearWCP": 15.767, "MsgCntr": 7, "PrsrEstMstrCylValid": 1, "MsgCrc": 44,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_BrkPress2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    16.767    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15.767    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    44

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"PrsrEstMstCyl": 32.767, "PrsrFrontWCP": 327.67, "PrsrRearWCP": 32.767, "MsgCntr": 15, "PrsrEstMstrCylValid": 1, "MsgCrc": 199,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_BrkPress2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32.767    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32.767    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    199

VM-RX-0xcfdd934: Send mRightJoyStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mRightJoyStat and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 0, "RightX_Neg": 0, "RightX_Pos": 0, "RightX_Value": 0, "RightY_Ntrl": 0, "RightY_Neg": 0, "RightY_Pos": 0, "RightY_Value": 0, "Btn_1": 0, "Btn_2": 0, "Btn_3": 0, "Btn_4": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_4
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 1, "RightX_Neg": 1, "RightX_Pos": 1, "RightX_Value": 700, "RightY_Ntrl": 1, "RightY_Neg": 1, "RightY_Pos": 1, "RightY_Value": 700, "Btn_1": 1, "Btn_2": 1, "Btn_3": 1, "Btn_4": 1,}
    Run Keyword And Continue On Failure    Send Can Message    mRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    700

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    700

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_4
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 2, "RightX_Neg": 2, "RightX_Pos": 2, "RightX_Value": 700, "RightY_Ntrl": 2, "RightY_Neg": 2, "RightY_Pos": 2, "RightY_Value": 700, "Btn_1": 2, "Btn_2": 2, "Btn_3": 2, "Btn_4": 2,}
    Run Keyword And Continue On Failure    Send Can Message    mRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_4
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 3, "RightX_Neg": 3, "RightX_Pos": 3, "RightX_Value": 1023, "RightY_Ntrl": 3, "RightY_Neg": 3, "RightY_Pos": 3, "RightY_Value": 1023, "Btn_1": 3, "Btn_2": 3, "Btn_3": 3, "Btn_4": 3,}
    Run Keyword And Continue On Failure    Send Can Message    mRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.RightY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat_VDP_SG_mRig.Btn_4
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

VM-RX-0x7b: Send mEbcm2L_Stat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_Stat and XCP variable read
    Log    Assigning Minimum Value to the signal

    ${signals}=     Evaluate    {"Flt_Critical": 0, "Flt_12vCtrl": 0, "Flt_12vMtr": 0, "Flt_Hold": 0, "Flt_MtrTmpr": 0, "Warn_MtrTmpr": 0, "Flt_mVcuImuLinAccel": 0, "Flt_mBrkCtrl": 0, "Flt_mWhdCtrl": 0, "Flt_mVehState": 0, "Flt_mVcuImuAngVel": 0, "BrkFluidLevSns_EBCM2": 0, "Flt_mWhdStat": 0, "Flt_ElWhlSpdR": 0, "AutoBrkEngd": 0, "Flt_ElWhlSpdFR": 0, "Flt_ElWhlSpdFL": 0, "EbcmControllerID": 0, "WakeStat": 0, "EbcmRdy": 0, "EbcmShtdwnRdy": 0, "MtrTmprEst": 0, "MsgCntr": 0, "VehMvmt": 0, "Flt_mVehState2": 0, "MsgCrc": 0 }

    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_Stat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_Critical
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_12vCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_12vMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_Hold
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Warn_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVcuImuLinAccel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVcuImuAngVel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.BrkFluidLevSns_EBCM2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mWhdStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_ElWhlSpdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.AutoBrkEngd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_ElWhlSpdFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_ElWhlSpdFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.EbcmControllerID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.WakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.EbcmRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.EbcmShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MtrTmprEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.VehMvmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"Flt_Critical": 0, "Flt_12vCtrl": 0, "Flt_12vMtr": 0, "Flt_Hold": 0, "Flt_MtrTmpr": 0, "Warn_MtrTmpr": 0, "Flt_mVcuImuLinAccel": 1, "Flt_mBrkCtrl": 1, "Flt_mWhdCtrl": 1, "Flt_mVehState": 1, "Flt_mVcuImuAngVel": 1, "BrkFluidLevSns_EBCM2": 1, "Flt_mWhdStat": 1, "Flt_ElWhlSpdR": 0, "AutoBrkEngd": 0, "Flt_ElWhlSpdFR": 0, "Flt_ElWhlSpdFL": 0, "EbcmControllerID": 0, "WakeStat": 0, "EbcmRdy": 0, "EbcmShtdwnRdy": 0, "MtrTmprEst": 100, "MsgCntr": 7, "VehMvmt": 2, "Flt_mVehState2": 1, "MsgCrc": 128,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_Stat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVcuImuLinAccel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVcuImuAngVel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.BrkFluidLevSns_EBCM2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mWhdStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MtrTmprEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.VehMvmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"Flt_Critical": 1, "Flt_12vCtrl": 1, "Flt_12vMtr": 1, "Flt_Hold": 1, "Flt_MtrTmpr": 1, "Warn_MtrTmpr": 1, "Flt_mVcuImuLinAccel": 2, "Flt_mBrkCtrl": 2, "Flt_mWhdCtrl": 2, "Flt_mVehState": 2, "Flt_mVcuImuAngVel": 2, "BrkFluidLevSns_EBCM2": 2, "Flt_mWhdStat": 2, "Flt_ElWhlSpdR": 1, "AutoBrkEngd": 1, "Flt_ElWhlSpdFR": 1, "Flt_ElWhlSpdFL": 1, "EbcmControllerID": 1, "WakeStat": 1, "EbcmRdy": 1, "EbcmShtdwnRdy": 1, "MtrTmprEst": 200, "MsgCntr": 15, "VehMvmt": 3, "Flt_mVehState2": 2, "MsgCrc": 255,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_Stat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_Critical
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_12vCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_12vMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_Hold
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Warn_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVcuImuLinAccel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVcuImuAngVel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.BrkFluidLevSns_EBCM2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mWhdStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_ElWhlSpdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.AutoBrkEngd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_ElWhlSpdFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_ElWhlSpdFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.EbcmControllerID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.WakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.EbcmRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.EbcmShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MtrTmprEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.VehMvmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

VM-RX-0x73: Send mEbcm1U_Stat2 with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.5

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MtrCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.ToShtdwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

VM-RX-0x2: Send mEbcm2L_TrqLmts with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    63.75

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqLmtMtrRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    63.75

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127.5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.StopLightRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqLmtMtrRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127.5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.TrqSlewRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_TrqLmts_VDP_SG_mE.VehAccelEbcm
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67

VM-RX-0x294: Send mSbwSys_Allied with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -327.68    precision=0.001

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    150.5    precision=0.001

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10000.PP_SG_mSbwSys_Allied_VDP_SG_mSb.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

VM-RX-0xcfde801: Send mVscStat with Signal Values and Verify by reading XCP Variable
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

VM-RX-0x66: Send mWhdStat with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1024

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1024

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -204.8    precision=0.001

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    55

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MtrTrqEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvCurrEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    204.7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.MvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

	${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat_VDP_SG_mWhdStat.TrqEnblStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

VM-RX-0x292: Send mSbwStat2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mSbwStat2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"FaultLight": 0, "FltCode": 0, "HostMode": 0, "LeftStopLmt":0, "MtrAdjust":0, "OverTemp":0, "ProtectActive":0,"RemModeActive":0, "RightStopLmt":0, "RS232Mode":0, "SelectedMap":0, "SteerAngle":0, "SteerAngle8b":0 }
    Send Can Message    mSbwStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.FaultLight
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.FltCode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.HostMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.MtrAdjust
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.OverTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.ProtectActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RemModeActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RS232Mode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SelectedMap
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SteerAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SteerAngle8b
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"FaultLight": 0, "FltCode": 100, "HostMode": 0, "LeftStopLmt":0, "MtrAdjust":2, "OverTemp":0, "ProtectActive":0,"RemModeActive":0, "RightStopLmt":0, "RS232Mode":0, "SelectedMap":6, "SteerAngle":50, "SteerAngle8b":150 }
    Send Can Message    mSbwStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.FaultLight
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.FltCode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.HostMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.MtrAdjust
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.OverTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.ProtectActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RemModeActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RS232Mode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SelectedMap
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   6

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SteerAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SteerAngle8b
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   150

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"FaultLight": 1, "FltCode": 102, "HostMode": 1, "LeftStopLmt":1, "MtrAdjust":3, "OverTemp":1, "ProtectActive":1,"RemModeActive":1, "RightStopLmt":1, "RS232Mode":1, "SelectedMap":7, "SteerAngle":1023, "SteerAngle8b":255 }
    Send Can Message    mSbwStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.FaultLight
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.FltCode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   102

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.HostMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.LeftStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.MtrAdjust
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.OverTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.ProtectActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RemModeActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RightStopLmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.RS232Mode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SelectedMap
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SteerAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1023

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx10.PP_SG_mSbwStat2_VDP_SG_mSbwStat.SteerAngle8b
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255


VM-RX-0x293: Send mSbwStat_Allied with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mSbwStat_Allied and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"BoardTemp": 0, "LvVolt": 0, "MotorTemp": 0, "MsgCntr":0, "MsgCrc":0, "MtrCurr":0}
    Send Can Message    mSbwStat_Allied    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.BoardTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MotorTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	Log    Assigning MID Value to the signal
    ${signals}=    Evaluate    {"BoardTemp": 133, "LvVolt": 13.5, "MotorTemp": 133, "MsgCntr":10, "MsgCrc":30, "MtrCurr":13.5}
    Send Can Message    mSbwStat_Allied    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.BoardTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   133

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   13.5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MotorTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   133

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   10

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   30

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   13.5

	Log    Assigning MAX Value to the signal
    ${signals}=    Evaluate    {"BoardTemp": 215, "LvVolt": 25.5, "MotorTemp": 215, "MsgCntr":15, "MsgCrc":255, "MtrCurr":25.5}
    Send Can Message    mSbwStat_Allied    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.BoardTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    215

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.5

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MotorTemp
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    215


    ${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

	${value}=    Read Xcp Variable    rtARID_DEF_CpApSbwRx100.PP_SG_mSbwStat_Allied_VDP_SG_mS.MtrCurr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   25.5

VM-RX-0x691: Send mEbcm2L_SwVer with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_SwVer and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"SwVerMaj": 0, "SwVerMin": 0, "SwVerRev": 0, "SwVerStat":0}
    Send Can Message    mEbcm2L_SwVer    ${signals}
    Sleep    12s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

	Log    Assigning MiD Value to the signal
    ${signals}=    Evaluate    {"SwVerMaj": 7, "SwVerMin": 7, "SwVerRev": 7, "SwVerStat":0}
    Send Can Message    mEbcm2L_SwVer    ${signals}
    Sleep    12s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning MAX Value to the signal
    ${signals}=    Evaluate    {"SwVerMaj": 15, "SwVerMin": 15, "SwVerRev": 15, "SwVerStat":1}
    Send Can Message    mEbcm2L_SwVer    ${signals}
    Sleep    12s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10000.PP_SG_mEbcm2L_SwVer_VDP_SG_mEbc.SwVerStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

VM-RX-0x73: Send mEbcm1U_Stat with Signal Values and Verify by reading XCP Variable

    [Documentation]    Validate RX message mEbcm1U_Stat and XCP variable read
    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {'Flt_Critical': 0, 'Flt_12vCtrl': 0, 'Flt_12vMtr': 0, 'Flt_Hold': 0, 'Flt_MtrTmpr': 0, 'Warn_MtrTmpr': 0, 'Flt_mVcuImuLinAccel': 0, 'Flt_mBrkCtrl': 0, 'Flt_mWhdCtrl': 0, 'Flt_mVehState': 0, 'Flt_mVcuImuAngVel': 0, 'BrkFluidLevSns_EBCM1': 0, 'Flt_mWhdStat': 0, 'Flt_CanWhlSpdR': 0, 'AutoBrkEngd': 0, 'Flt_CanWhlSpdFR': 0, 'Flt_CanWhlSpdFL': 0, 'EbcmControllerID': 0, 'WakeStat': 0, 'EbcmRdy': 0, 'EbcmShtdwnRdy': 0, 'MtrTmprEst': 0, 'Flt_mVehState2': 0, 'MsgCntr': 0, 'MsgCrc': 0}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_Stat    ${signals}
    Sleep    2s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_Critical
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_12vCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_12vMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_Hold
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Warn_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVcuImuLinAccel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVehState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVcuImuAngVel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.BrkFluidLevSns_EBCM1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mWhdStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.AutoBrkEngd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmControllerID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.WakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.MtrTmprEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning MID Value to the signal
    ${signals}=    Evaluate    {'Flt_Critical': 1, 'Flt_12vCtrl': 1, 'Flt_12vMtr': 1, 'Flt_Hold': 1, 'Flt_MtrTmpr': 1, 'Warn_MtrTmpr': 1, 'Flt_mVcuImuLinAccel': 1, 'Flt_mBrkCtrl': 1, 'Flt_mWhdCtrl': 1, 'Flt_mVehState': 1, 'Flt_mVcuImuAngVel': 1, 'BrkFluidLevSns_EBCM1': 0, 'Flt_mWhdStat': 0, 'Flt_CanWhlSpdR': 0, 'AutoBrkEngd': 0, 'Flt_CanWhlSpdFR': 0, 'Flt_CanWhlSpdFL': 0, 'EbcmControllerID': 0, 'WakeStat': 1, 'EbcmRdy': 1, 'EbcmShtdwnRdy': 1, 'MtrTmprEst': 100, 'Flt_mVehState2': 1, 'MsgCntr': 7, 'MsgCrc': 127}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_Stat    ${signals}
    Sleep    2s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_Critical
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_12vCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_12vMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_Hold
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Warn_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVcuImuLinAccel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVehState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVcuImuAngVel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.BrkFluidLevSns_EBCM1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mWhdStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.AutoBrkEngd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmControllerID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.WakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.MtrTmprEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    Log    Assigning MAXIMUM Value to the signal
    ${signals}=    Evaluate    {'Flt_Critical': 1, 'Flt_12vCtrl': 1, 'Flt_12vMtr': 1, 'Flt_Hold': 1, 'Flt_MtrTmpr': 1, 'Warn_MtrTmpr': 1, 'Flt_mVcuImuLinAccel': 3, 'Flt_mBrkCtrl': 3, 'Flt_mWhdCtrl': 3, 'Flt_mVehState': 3, 'Flt_mVcuImuAngVel': 3, 'BrkFluidLevSns_EBCM1': 1, 'Flt_mWhdStat': 1, 'Flt_CanWhlSpdR': 1, 'AutoBrkEngd': 1, 'Flt_CanWhlSpdFR': 1, 'Flt_CanWhlSpdFL': 1, 'EbcmControllerID': 1, 'WakeStat': 1, 'EbcmRdy': 1, 'EbcmShtdwnRdy': 1, 'MtrTmprEst': 200, 'Flt_mVehState2': 3, 'MsgCntr': 15, 'MsgCrc': 255}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_Stat    ${signals}
    Sleep    2s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_Critical
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_12vCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_12vMtr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_Hold
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Warn_MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVcuImuLinAccel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mBrkCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mWhdCtrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVehState
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVcuImuAngVel
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.BrkFluidLevSns_EBCM1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mWhdStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.AutoBrkEngd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_CanWhlSpdFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmControllerID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.WakeStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.EbcmShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.MtrTmprEst
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx20.PP_SG_mEbcm1U_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

VM-RX-0xcfdd934: Send mRightJoyStat2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mRightJoyStat2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"RightZ_Neg":0, "RightZ_Ntrl":0, "RightZ_Pos":0, "RightZ_Value":0}
	Send Can Message    mRightJoyStat2    ${signals}
    Sleep    1s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


	Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"RightZ_Neg":2, "RightZ_Ntrl":2, "RightZ_Pos":2, "RightZ_Value":700}
	Send Can Message    mRightJoyStat2    ${signals}
    Sleep    1s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    700

	Log    Assigning Max Value to the signal
    ${signals}=    Evaluate    {"RightZ_Neg":3, "RightZ_Ntrl":3, "RightZ_Pos":3, "RightZ_Value":1023}
	Send Can Message    mRightJoyStat2    ${signals}
    Sleep    1s

	${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx60_1.PP_SG_mRightJoyStat2_VDP_SG_mRi.RightZ_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1023
