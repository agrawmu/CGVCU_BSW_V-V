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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2800

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3500

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3400

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD10_BMS2_VDP_SG_HVES.HvIsoResistPassive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    6200

Send HVESSD3_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD3_BMS2 and XCP variable read
    ${signals}=    Evaluate    {"CellTmprMax": 120, "CellTmprMin": 40, "CellTmprAvg": 0.5, "CellTmprDeltaStat": 0,}
    Send Can Message    HVESSD3_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    120

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD3_BMS2_VDP_SG_HVESS.CellTmprMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40

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


Send HVESSD4_BMS2 with Signal Values and Verify by reading XCP Variable
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


    ${signals}=    Evaluate    {"CapacAvailDschrg": 100, "CapacAvailChrg": 440, "CellBalCount": 50000,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    440

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    50000


    ${signals}=    Evaluate    {"CapacAvailDschrg": 642, "CapacAvailChrg": 620.5, "CellBalCount": 20,}
    Send Can Message    HVESSD4_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    642

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CapacAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    620.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD4_BMS2_VDP_SG_HVESS.CellBalCount
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    20


Send HVESSD5_BMS2 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message HVESSD5_BMS2 and XCP variable read

    # --- First Message ---
    Log  Assigning Minimum value to the signals

    ${signals}=    Evaluate    {"CurrAvailDschrg": -1600, "CurrAvailChrg": 109, "CellSocMin": 0.5, "CellSocMax": 99}
    Send Can Message    HVESSD5_BMS2    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -1600

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CurrAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    109

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0.5    precision=0.001

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_1.PP_SG_HVESSD5_BMS2_VDP_SG_HVESS.CellSocMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    99

# --- Midpoint Message ---
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


    # --- Max Message (at upper bound of CurrAvailDschrg) ---
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

Send CAN signal values and validate them by reading HVESSD6_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

     Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 0, "ElecTmpr": 100, "BattTmpr": 0, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   140
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    40

     Log    Assigning Middle Value to the signal

    ${signals}=    Evaluate    {"MvVoltBus": 0, "ElecTmpr": 180, "BattTmpr": 40, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    220
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    80

     Log    Assigning Maximum Value to the signal

     ${signals}=    Evaluate    {"MvVoltBus": 3212.75, "ElecTmpr": 210, "BattTmpr": 200, }
    Send Can Message    HVESSD6_BMS2    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.MvVoltBus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    64255  
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.ElecTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    250
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD6_BMS2_VDP_SG_HVESS.BattTmpr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   240

Send CAN signal values and validate them by reading HVESSD7_BMS2 through XCP value
    [Documentation]    Validate RX message handling and XCP variable read

     Log    Assigning Minimum Value to the signal

    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 10, "EnrgyAvailChrg": 1200, "ChrgVoltMax": 100.1, }
    Send Can Message    HVESSD7_BMS2    ${signals}
    Sleep    10s
     ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10000  
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1200000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2002  

     Log    Assigning Middle Value to the signal


    ${signals}=    Evaluate    {"EnrgyAvailDschrg": 10000.1, "EnrgyAvailChrg": 14000, "ChrgVoltMax": 2300, }
    Send Can Message    HVESSD7_BMS2    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailDschrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10000100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.EnrgyAvailChrg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1400000
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD7_BMS2_VDP_SG_HVESS.ChrgVoltMax
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    46000

     Log    Assigning Maximum Value to the signal

     ${signals}=    Evaluate    {"EnrgyAvailDschrg": 16000, "EnrgyAvailChrg": 98.8, "ChrgVoltMax": 3212.1, }
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
    Sleep    1s
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
    Sleep    1s
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
    Sleep    1s
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

    ${signals}=    Evaluate    {"PrsrMstCyl": -2, "PrsrFrontWCP": -327.68, "PrsrRearWCP": -2 "MsgCntr": 0, "PrsrMstrCylValid": 0, "MsgCrc": 0,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    1s
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

      ${signals}=    Evaluate    {"PrsrMstCyl": 8, "PrsrFrontWCP": 2, "PrsrRearWCP": 8 "MsgCntr": 5, "PrsrMstrCylValid": 0, "MsgCrc": 55,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    1s
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

        ${signals}=    Evaluate    {"PrsrMstCyl": 32.767, "PrsrFrontWCP": 327.67, "PrsrRearWCP": 32.767 "MsgCntr": 15, "PrsrMstrCylValid": 1, "MsgCrc": 255,}
    Send Can Message    mEbcm2L_BrkPress    ${signals}
    Sleep    1s
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
    Send Can Message    mEbcm2L_WhlCnt    ${signals}
    Sleep    1s
     ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4094
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntFR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4094
    ${value}=    Read Xcp Variable   rtARID_DEF_CpApEbcm2LRx10_2.PP_SG_mEbcm2L_WhlCnt_VDP_SG_mEb.WhlCntR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4094

      Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"WhlCntFL": 4096, "WhlCntFR": 4096, "WhlCntR": 4096,}
    Send Can Message    mEbcm2L_WhlCnt    ${signals}
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMaxIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdCell
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.CellTmprMinIdMod
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    109
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApEssRx100_2.PP_SG_HVESSD9_BMS2_VDP_SG_HVESS.ThrmlEventDetect
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
