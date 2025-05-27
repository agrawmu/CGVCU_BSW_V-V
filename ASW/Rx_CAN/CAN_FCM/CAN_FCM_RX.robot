*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Validation/Vinayak/ASW/CAN_VM_Configuration/ASW_CAN_FCM_RX    CAN_VM_RX
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/RX_Testing/CAN_VM/CAN-FD_FCM_V1.0.2.dbc    3    500000
    Sleep    3s


Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
Send FCM_0x67D with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message and XCP variable read
    # Evaluate the dictionary to convert string to native dict
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"FCM_HwVers": 1, "FCM_PartVers": 0, "FCM_SwVersM": 1, "FCM_SwVersS": 1}

    Send Can Message    FCM_0x67D    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_HwVers
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_PartVers
    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersM
    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersS
    Should Be Equal As Numbers    ${value}    1

    Log    Assigning mid Value to the signal
    ${signals}=    Evaluate    {"FCM_HwVers": 100, "FCM_PartVers": 22345678, "FCM_SwVersM": 257, "FCM_SwVersS": 245}

    Send Can Message    FCM_0x67D    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_HwVers
    Should Be Equal As Numbers    ${value}    100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_PartVers
    Should Be Equal As Numbers    ${value}    22345678
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersM
    Should Be Equal As Numbers    ${value}    257
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersS
    Should Be Equal As Numbers    ${value}    245

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"FCM_HwVers": 255, "FCM_PartVers": 4294967295, "FCM_SwVersM": 255, "FCM_SwVersS": 255}

    Send Can Message    FCM_0x67D    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_HwVers
    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_PartVers
    Should Be Equal As Numbers    ${value}    4294967295
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersM
    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersS
    Should Be Equal As Numbers    ${value}    255

Send FCM_NM_0x42E with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message FCM_NM_0x42E and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"FCM_SrcNodeID": 0, "FCM_CtrlBitVector_Bit0_RMR": 0, "FCM_CtrlBitVector_Bit1_Res": 0, "FCM_CtrlBitVector_Bit2_Res": 0, "FCM_CtrlBitVector_Bit3_NMCoord": 0, "FCM_CtrlBitVector_Bit4_ActWake": 0, "FCM_CtrlBitVector_Bit5_Res": 0, "FCM_CtrlBitVector_Bit6_PNI": 0, "FCM_CtrlBitVector_Bit7_Res": 0, "FCM_UsrData0": 0, "FCM_UsrData1_Bit0_IGN_WAKEUP": 0, "FCM_UsrData1_Bit1_RESET_WAKEUP": 0, "FCM_UsrData1_Bit2_NETWORK_WAKEUP": 0, "FCM_UsrData1_Bit3_ECUSPEC_WAKEUP": 0, "FCM_UsrData1_Bit4_NETWORK_AWAKE": 0, "FCM_UsrData1_Bit5_IGNITION_AWAKE": 0, "FCM_UsrData1_Bit6_DIAGN_AWAKE": 0, "FCM_UsrData1_Bit7_ECUSPEC_AWAKE": 0, "FCM_UsrData2": 1, "FCM_UsrData3": 1, "FCM_UsrData4_PN_Info1": 1, "FCM_UsrData5_PN_Info2": 1,}

    Run Keyword And Continue On Failure    Send Can Message    FCM_NM_0x42E    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_SrcNodeID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit0_RMR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit1_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit2_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit3_NMCoord
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit4_ActWake
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit5_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit6_PNI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit7_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData0
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit0_IGN_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit1_RESET_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit2_NETWORK_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit3_ECUSPEC_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit4_NETWORK_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit5_IGNITION_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit6_DIAGN_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit6_PNI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit7_ECUSPEC_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData4_PN_Info1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData5_PN_Info2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    Log    Assigning  Mid  Value to the signal
    ${signals}=    Evaluate    {"FCM_SrcNodeID": 67, "FCM_CtrlBitVector_Bit0_RMR": 0, "FCM_CtrlBitVector_Bit1_Res": 0, "FCM_CtrlBitVector_Bit2_Res": 0, "FCM_CtrlBitVector_Bit3_NMCoord": 0, "FCM_CtrlBitVector_Bit4_ActWake": 0, "FCM_CtrlBitVector_Bit5_Res": 0, "FCM_CtrlBitVector_Bit6_PNI": 0, "FCM_CtrlBitVector_Bit7_Res": 0, "FCM_UsrData0": 1, "FCM_UsrData1_Bit0_IGN_WAKEUP": 0, "FCM_UsrData1_Bit1_RESET_WAKEUP": 0, "FCM_UsrData1_Bit2_NETWORK_WAKEUP": 0, "FCM_UsrData1_Bit3_ECUSPEC_WAKEUP": 0, "FCM_UsrData1_Bit4_NETWORK_AWAKE": 0, "FCM_UsrData1_Bit5_IGNITION_AWAKE": 0, "FCM_UsrData1_Bit6_DIAGN_AWAKE": 0, "FCM_UsrData1_Bit7_ECUSPEC_AWAKE": 0, "FCM_UsrData2": 237, "FCM_UsrData3": 245, "FCM_UsrData4_PN_Info1": 200, "FCM_UsrData5_PN_Info2": 200,}

    Run Keyword And Continue On Failure    Send Can Message    FCM_NM_0x42E    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_SrcNodeID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    67

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit0_RMR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit1_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit2_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit3_NMCoord
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit4_ActWake
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit5_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit6_PNI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit7_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData0
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit0_IGN_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit1_RESET_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit2_NETWORK_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit3_ECUSPEC_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit4_NETWORK_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit5_IGNITION_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit6_DIAGN_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit6_PNI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit7_ECUSPEC_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    237

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    245

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData4_PN_Info1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData5_PN_Info2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    200

    Log    Assigning  Maximum  Value to the signal
    ${signals}=    Evaluate    {"FCM_SrcNodeID": 127, "FCM_CtrlBitVector_Bit0_RMR": 1, "FCM_CtrlBitVector_Bit1_Res": 1, "FCM_CtrlBitVector_Bit2_Res": 1, "FCM_CtrlBitVector_Bit3_NMCoord": 1, "FCM_CtrlBitVector_Bit4_ActWake": 1, "FCM_CtrlBitVector_Bit5_Res": 1, "FCM_CtrlBitVector_Bit6_PNI": 1, "FCM_CtrlBitVector_Bit7_Res": 1, "FCM_UsrData0": 2, "FCM_UsrData1_Bit0_IGN_WAKEUP": 1, "FCM_UsrData1_Bit1_RESET_WAKEUP": 1, "FCM_UsrData1_Bit2_NETWORK_WAKEUP": 1, "FCM_UsrData1_Bit3_ECUSPEC_WAKEUP": 1, "FCM_UsrData1_Bit4_NETWORK_AWAKE": 1, "FCM_UsrData1_Bit5_IGNITION_AWAKE": 1, "FCM_UsrData1_Bit6_DIAGN_AWAKE": 1, "FCM_UsrData1_Bit7_ECUSPEC_AWAKE": 1, "FCM_UsrData2": 255, "FCM_UsrData3": 255, "FCM_UsrData4_PN_Info1": 255, "FCM_UsrData5_PN_Info2": 255,}
    Run Keyword And Continue On Failure    Send Can Message    FCM_NM_0x42E    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_SrcNodeID
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    127

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit0_RMR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit1_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit2_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit3_NMCoord
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit4_ActWake
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit5_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit6_PNI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit7_Res
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData0
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit0_IGN_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit1_RESET_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit2_NETWORK_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit3_ECUSPEC_WAKEUP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit4_NETWORK_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit5_IGNITION_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit6_DIAGN_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_CtrlBitVector_Bit6_PNI
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData1_Bit7_ECUSPEC_AWAKE
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData3
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData4_PN_Info1
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx60.PP_SG_FCM_NM_0x42E_VDT_SG_FCM_N.FCM_UsrData5_PN_Info2
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255