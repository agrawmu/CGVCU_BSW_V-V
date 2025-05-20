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

