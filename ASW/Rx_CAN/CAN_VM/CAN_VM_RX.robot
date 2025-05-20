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


Send mWhdStat2 with Signal Values and Verify by reading XCP Variable
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

    Log    Assigning  Mid  Value to the signal
    ${signals}=    Evaluate    {"LvVolt": 12.5, "MtrTmpr": 128, "InvTmpr": 128, "TrqAvailMtr": 128, "TrqAvailRegen": 128, "WhdState": 1, "MsgCntr": 7,}
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


    Log    Assigning  Maximum  Value to the signal
    ${signals}=    Evaluate    {"LvVolt": 25.4, "MtrTmpr": 255, "InvTmpr": 255, "TrqAvailMtr": 255, "TrqAvailRegen": 255, "WhdRdy": 1, "WhdShtdwnRdy": 1, "HwWakeStat": 1, "WhdState": 2, "MsgCntr": 15, "TrqLmt_Design": 1, "TrqLmt_InvTmpr": 1, "TrqLmt_MtrSpd": 1, "TrqLmt_MtrTmpr": 1, "TrqLmt_Pwr": 1, "TrqLmt_SpdSlew": 1, "TrqLmt_TrqSlew": 1, "TrqLmt_Volt": 1,}
    Run Keyword And Continue On Failure    Send Can Message    mWhdStat2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.LvVolt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    25.4    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.MtrTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_2.PP_SG_mWhdStat2_VDP_SG_mWhdStat.InvTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

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

Send mWhdFaults with Signal Values and Verify by reading XCP Variable
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



    Log    Assigning  Mid  Value to the signal
    ${signals}=    Evaluate    {"E_CAN_mWhdCtrl": 1, "E_CAN_mWhdCtrl2": 2, "MsgCntr": 10, "SwVerMaj": 10, "SwVerMin": 10,}
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10


    Log    Assigning  Maximum  Value to the signal
    ${signals}=    Evaluate    {"E_INIT_ERROR": 1, "E_INVALID_SETTINGS": 1, "E_MOTOR_STALLED": 1, "E_READING_TIMEOUT": 1, "E_HALL_SEQUENCE": 1, "E_HALL_SECTOR": 1, "E_TEMP_SENSOR": 1, "E_POSSENSOR": 1, "E_ENCODER": 1, "E_ZERO_POSITION": 1, "E_HW_ENABLE": 1, "E_INV11_TEMP": 1, "E_INV12_TEMP": 1, "E_INV13_TEMP": 1, "E_INV14_TEMP": 1, "E_INV15_TEMP": 1, "E_INV16_TEMP": 1, "E_CPU_TEMP": 1, "E_WINDING_TEMP": 1, "E_DCLINK_TEMP": 1, "E_DCLINK_COMM": 1, "E_INV11_OVERCURRENT": 1, "E_INV12_OVERCURRENT": 1, "E_INV13_OVERCURRENT": 1, "E_INV14_OVERCURRENT": 1, "E_INV15_OVERCURRENT": 1, "E_INV16_OVERCURRENT": 1, "E_OVERVOLTAGE": 1, "E_UNDERVOLTAGE": 1, "E_CAN_SAME_ID": 1, "E_CAN_TIMEOUT": 1, "E_INV11_FAULT": 1, "E_INV12_FAULT": 1, "E_INV13_FAULT": 1, "E_INV14_FAULT": 1, "E_INV15_FAULT": 1, "E_INV16_FAULT": 1, "E_CAN_SEND_ERR": 1, "E_CAN_OVERFLOW": 1, "E_MOTOR_OVERSPEED": 1, "E_CPU_FAULT": 1, "E_INV17_TEMP": 1, "E_INV18_TEMP": 1, "E_INV17_OVERCURRENT": 1, "E_INV18_OVERCURRENT": 1, "E_INV17_FAULT": 1, "E_INV18_FAULT": 1, "E_CAN_mWhdCtrl": 3, "E_CAN_mWhdCtrl2": 3, "MsgCntr": 15, "SwVerMaj": 15, "SwVerMin": 15,}
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApWhdRx20_1.PP_SG_mWhdFaults_VDP_SG_mWhdFau.SwVerMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15


Send mEbcm1U_BrkPress2 with Signal Values and Verify by reading XCP Variable
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
    ${signals}=    Evaluate    {"PrsrEstMstCyl": 32.767, "PrsrFrontWCP": 99, "PrsrRearWCP": 32.767, "MsgCntr": 99, "PrsrEstMstrCylValid": 1, "MsgCrc": 44,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_BrkPress2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32.767    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    32.767    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    44

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"PrsrEstMstCyl": 35, "PrsrFrontWCP": 327.67, "PrsrRearWCP": 35, "MsgCntr": 109, "PrsrEstMstrCylValid": 1, "MsgCrc": 199,}
    Run Keyword And Continue On Failure    Send Can Message    mEbcm1U_BrkPress2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstCyl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    35

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrFrontWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrRearWCP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    35

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    109

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.PrsrEstMstrCylValid
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm1URx10.PP_SG_mEbcm1U_BrkPress2_VDP_SG_.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    199

Send mRightJoyStat with Signal Values and Verify by reading XCP Variable
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

    [Documentation]    Validate RX message mRightJoyStat and XCP variable read

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

    [Documentation]    Validate RX message mRightJoyStat and XCP variable read

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

    [Documentation]    Validate RX message mRightJoyStat and XCP variable read

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

Send mEbcm2L_Stat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mEbcm2L_Stat and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"Flt_Critical": 0, "Flt_12vCtrl": 0, "Flt_12vMtr": 0, "Flt_Hold": 0, "Flt_MtrTmpr": 0, "Warn_MtrTmpr": 0, "Flt_mVculmuLinAccel": 0, "Flt_mBrkCtrl": 0, "Flt_mWhdCtrl": 0, "Flt_mVehState": 0, "Flt_mVculmuAngVel": 0, "BrkFluidLevSns_EBCM2": 0, "Flt_mWhdStat": 0, "Flt_ELWhlSpdR": 0, "AutoBrkEngd": 0, "Flt_ELWhlSpdFR": 0, "Flt_ELWhlSpdFL": 0, "EbcmControllerID": 0, "WakeStat": 0, "EbcmRdy": 0, "EbcmShdwnRdy": 0, "MtrTmprEst": 0, "MsgCntr": 0, "VehMvmt": 1, "Flt_mVehState2": 0, "MsgCrc": 0,}
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

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.VehMvmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    [Documentation]    Validate RX message mEbcm2L_Stat and XCP variable read

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"Flt_Critical": 0, "Flt_12vCtrl": 0, "Flt_12vMtr": 0, "Flt_Hold": 0, "Flt_MtrTmpr": 0, "Warn_MtrTmpr": 0, "Flt_mVculmuLinAccel": 1, "Flt_mBrkCtrl": 1, "Flt_mWhdCtrl": 1, "Flt_mVehState": 1, "Flt_mVculmuAngVel": 1, "BrkFluidLevSns_EBCM2": 1, "Flt_mWhdStat": 1, "Flt_ELWhlSpdR": 0, "AutoBrkEngd": 0, "Flt_ELWhlSpdFR": 0, "Flt_ELWhlSpdFL": 0, "EbcmControllerID": 0, "WakeStat": 0, "EbcmRdy": 0, "EbcmShdwnRdy": 0, "MtrTmprEst": 100, "MsgCntr": 128, "VehMvmt": 2, "Flt_mVehState2": 1, "MsgCrc": 128,}
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

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.VehMvmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    [Documentation]    Validate RX message mEbcm2L_Stat and XCP variable read

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"Flt_Critical": 1, "Flt_12vCtrl": 1, "Flt_12vMtr": 1, "Flt_Hold": 1, "Flt_MtrTmpr": 1, "Warn_MtrTmpr": 1, "Flt_mVculmuLinAccel": 2, "Flt_mBrkCtrl": 2, "Flt_mWhdCtrl": 2, "Flt_mVehState": 2, "Flt_mVculmuAngVel": 2, "BrkFluidLevSns_EBCM2": 2, "Flt_mWhdStat": 2, "Flt_ELWhlSpdR": 1, "AutoBrkEngd": 1, "Flt_ELWhlSpdFR": 1, "Flt_ELWhlSpdFL": 1, "EbcmControllerID": 1, "WakeStat": 1, "EbcmRdy": 1, "EbcmShdwnRdy": 1, "MtrTmprEst": 200, "MsgCntr": 255, "VehMvmt": 3, "Flt_mVehState2": 2, "MsgCrc": 255,}
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

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.VehMvmt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx20_2.PP_SG_mEbcm2L_Stat_VDP_SG_mEbcm.Flt_mVehState2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_1.PP_SG_mEbcm2L_Stat2_VDP_SG_mEbc.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255


