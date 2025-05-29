*** Settings ***
Library    ../can_rx_validation_interface.py
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
Send AUXIO1_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    # Evaluate the dictionary to convert string to native dict
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
    # Evaluate the dictionary to convert string to native dict
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
    # Evaluate the dictionary to convert string to native dict
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

Send HVESSS2_BMS2 with Signal Values and Verify by reading XCP Variable
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

Send mSbwFaults with Signal Values and Verify by reading XCP Variable
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

Send HVESSD1_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD1_BMS2 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"PwrAvailDischrg": 380.6, "PwrAvailChrg": 0, "MvVoltBatt": 100, "MvCurrBatt": 210.5,}
    Send Can Message    HVESSD1_BMS2    ${signals}
    Sleep    0.5s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailDischrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7612    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvVoltBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvCurrBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    36210    precision=0.001

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"PwrAvailDischrg": 999, "PwrAvailChrg": 770.9, "MvVoltBatt": 550.8, "MvCurrBatt": 1000,}
    Send Can Message    HVESSD1_BMS2    ${signals}
    Sleep    0.5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailDischrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    19980

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15418    precision=0.001


    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvVoltBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    11016    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvCurrBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    52000

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"PwrAvailDischrg": 3000.1, "PwrAvailChrg": 2200, "MvVoltBatt": 990, "MvCurrBatt": 1500.75,}
    Send Can Message    HVESSD1_BMS2    ${signals}
    Sleep    0.5s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailDischrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    60002    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.PwrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    44000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvVoltBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    19800

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx20.PP_SG_HVESSD1_BMS2_VDP_SG_HVESS.MvCurrBatt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    62015    precision=0.001

Send HVESSD10_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD10_BMS2 and XCP variable read

    Log    Assigning Minimum Values to the signals
    # --- First Message ---
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    28000

    Log    Assigning mid Values to the signals

    # --- Second Message ---
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    35000

    Log    Assigning maximum Values to the signals

    # --- Third Message ---
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    34000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    62000


Send HVESSD3_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD3_BMS2 and XCP variable read
    ${signals}=    Evaluate    {"CellTmprMax": 120, "CellTmprMin": 40, "CellTmprAvg": 0.5, "CellTmprDeltaStat": 0,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    12576

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1001.6    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    875.2    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${signals}=    Evaluate    {"CellTmprMax": 550, "CellTmprMin": 390.9, "CellTmprAvg": 1003, "CellTmprDeltaStat": 1,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    26336

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    21244.8    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40832

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${signals}=    Evaluate    {"CellTmprMax": 1700, "CellTmprMin": 280, "CellTmprAvg": 1600, "CellTmprDeltaStat": 2,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    63136

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    17696

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    59936

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprDeltaStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2


Send HVESSD4_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD4_BMS2 and XCP variable read
    ${signals}=    Evaluate    {"CapacAvailDschrg": 0.1, "CapacAvailChrg": 9.9, "CellBalCount": 1000,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    990    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1000

    ${signals}=    Evaluate    {"CapacAvailDschrg": 100, "CapacAvailChrg": 440, "CellBalCount": 50000,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    44000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    50000

    ${signals}=    Evaluate    {"CapacAvailDschrg": 642, "CapacAvailChrg": 620.5, "CellBalCount": 20,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    62050    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    20


Send HVESSD5_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD5_BMS2 and XCP variable read

    Log  Assigning Minimum value to the signals

    ${signals}=    Evaluate    {"CurrAvailDschrg": -1600, "CurrAvailChrg": 109, "CellSocMin": 0.5, "CellSocMax": 99}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    34180

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    320    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    63360

    Log    Assigning mid values to the signal
    ${signals}=    Evaluate    {"CurrAvailDschrg": -800, "CurrAvailChrg": 800, "CellSocMin": 25.0, "CellSocMax": 75.0}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    16000    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    48000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.0390625    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    48000    precision=0.001


    # --- Max Message (at upper bound of CurrAvailDschrg) ---
    Log    Assigning maximum value to the signals
    ${signals}=    Evaluate    {"CurrAvailDschrg": 0, "CurrAvailChrg": 1000, "CellSocMin": 0.5, "CellSocMax": 99.9}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    52000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    320    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    63936    precision=0.001

Send HVESSD2_BMS2 with Signal Values and Verify by reading XCP Variable

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
	
Send mWhdWarn with Signal Values and Verify by reading XCP Variable
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

Send mWhdStat3 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mWhdStat3 and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"WhdAngle": 0,"WhdCurr_Ph1A": 0,"WhdCurr_Ph2A": 0,"WhdCurr_Ph1B": 0,"WhdCurr_Ph2B": 0,"WhdCurr_Ph1C": 0,"WhdCurr_Ph2C": 0,}
    Send Can Message    mWhdStat3    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhdAngle":180,"WhdCurr_Ph1A":128,"WhdCurr_Ph2A":128,"WhdCurr_Ph1B":128,"WhdCurr_Ph2B":128,"WhdCurr_Ph1C":128,"WhdCurr_Ph2C":128,}
    Send Can Message    mWhdStat3    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   360

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   255

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhdAngle": 360,"WhdCurr_Ph1A":50,"WhdCurr_Ph2A":50,"WhdCurr_Ph1B":50,"WhdCurr_Ph2B":50,"WhdCurr_Ph1C":50,"WhdCurr_Ph2C":50,}
    Send Can Message    mWhdStat3    ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdAngle
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	720

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   177

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2A
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   177

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   177

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2B
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   177

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph1C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   177

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat3_VDP_SG_mWhdStat.WhdCurr_Ph2C
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   177

Send mLeftJoyStat with Signal Values and Verify by reading XCP Variable
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

Send mEbcm2L_BrkTrqEst with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   56

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"BrkTrqEstFL": 2047,"BrkTrqEstFR": 2047,"BrkTrqEstR": 2047,"MsgCntr": 15,"MsgCrc": 100,}

    Send Can Message    mEbcm2L_BrkTrqEst   ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	4094

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4094

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.BrkTrqEstR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4094

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkTrqEst_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

Send mEbcm2L_BrkPress2 with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	2000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   56


    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"PrsrEstFR": 40,"PrsrEstFL": 40,"PrsrEstRR": 40,"PrsrEstRL": 40,"MsgCntr": 15,"MsgCrc": 100,}

    Send Can Message    mEbcm2L_BrkPress2  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}	4000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.PrsrEstRL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   100

Send mAVAS_Stat with Signal Values and Verify by reading XCP Variable
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

Send HVESSS1_BMS2 with Signal Values and Verify by reading XCP Variable
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

    Log    Assigning minimum Value to the signal
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


    Log    Assigning minimum Value to the signal
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

Send mEpb_EpbStat with Signal Values and Verify by reading XCP Variable
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

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2000

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

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEpbRx20.PP_SG_mEpbStat_EpbStat_VDP_SG_m.EPB_Current
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4000

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

Send CAN signal values and validate them by reading HVESSD6_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 0, "ElecTmpr": 100, "BattTmpr": 0,}
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   140
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40

    Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 1500, "ElecTmpr": 180, "BattTmpr": 40, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    220
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    80

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 3212.75, "ElecTmpr": 210, "BattTmpr": 200, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64255    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    250
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   240

Send CAN signal values and validate them by reading HVESSD7_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 10, "EnrgyAvailChrg": 1200, "ChrgVoltMax": 100.1,}
    Send Can Message    HVESSD7_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2002

    Log    Assigning Middle Value to the signal


    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 10000.1, "EnrgyAvailChrg": 14000, "ChrgVoltMax": 2300, }
    Send Can Message    HVESSD7_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10000100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1400000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    46000


    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 16000, "EnrgyAvailChrg": 98.8, "ChrgVoltMax": 3212.1,}
    Send Can Message    HVESSD7_BMS2   ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    16000000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    98800
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64241.99999999999  precision=0.001

Send CAN signal values and validate them by reading mEbcm1U_SwVer through XCP value
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

Send CAN signal values and validate them by reading mEbcm2L_BrkPress through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"PrsrMstCyl": -2, "PrsrFrontWCP": -327.68, "PrsrRearWCP": -2, "MsgCntr": 0, "PrsrMstrCylValid": 0, "MsgCrc": 0,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -2000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -32768
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -200
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    8000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   200
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    800
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   32767.000000000004   precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32767
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3276.7000000000003   precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress_VDP_SG_m.PrsrMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


Send CAN signal values and validate them by reading mEbcm2L_WhlCnt through XCP value
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
    ${signals}=    Evaluate    {"WhlCntFL": 4094, "WhlCntFR": 4094, "WhlCntR": 4094,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_WhlCnt    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4094
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4094
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4094

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhlCntFL": 4096, "WhlCntFR": 4096, "WhlCntR": 4096,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm2L_WhlCnt    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4096
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4096
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4096

Send CAN signal values and validate them by reading mEbcm2L_WhlSlip through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"WhlSlipFL": -100, "WhlSlipFR": -100, "WhlSlipR": -100, "MsgCntr": 0, "MsgCrc": 0, }
    Send Can Message    mEbcm2L_WhlSlip    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -10000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -10000
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -10000
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32767
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32767
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.WhlSlipR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32767
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_WhlSlip_VDP_SG_mE.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


Send CAN signal values and validate them by reading STATUS_BMS2 through XCP value
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

Send CAN signal values and validate them by reading VEP2_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"MvVoltAux": 0,}
    Send Can Message    VEP2_BMS2   ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx1000.PP_SG_VEP2_BMS2_VDP_SG_VEP2_BMS.MvVoltAux
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"MvVoltAux": 1510.5,}
    Send Can Message    VEP2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx1000.PP_SG_VEP2_BMS2_VDP_SG_VEP2_BMS.MvVoltAux
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    30210

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"MvVoltAux": 3212.75,}
    Send Can Message    VEP2_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx1000.PP_SG_VEP2_BMS2_VDP_SG_VEP2_BMS.MvVoltAux
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64255

Send CAN signal values and validate them by reading HVESSD8_BMS2 through XCP value
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
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD8_BMS2_VDP_SG_HVESS.CellVoltAvg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    13500


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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64000

Send CAN signal values and validate them by reading HVESSD9_BMS2 through XCP value
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
