*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***

Setup
    Open Canape And Load Imu Configuration    D:/Jenkins/workspace/CGVCU_BSW_V-V/ASW/Rx_CAN/Rx_CAN_Config    CAN_RX
    Initialize Canfd        D:/Jenkins/workspace/CGVCU_BSW_V-V/ASW/DBC/CAN-FD_FCM_V1.0.2.dbc    3    500000    2000000
    Sleep    3s

Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
FCM-RX-0x67d: Send FCM_0x67D with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"FCM_HwVers": 1, "FCM_PartVers": 0, "FCM_SwVersM": 1, "FCM_SwVersS": 1}
    Run Keyword And Continue On Failure    Send Can Message    FCM_0x67D    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_HwVers
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_PartVers
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    Log    Assigning mid Value to the signal
    ${signals}=    Evaluate    {"FCM_HwVers": 100, "FCM_PartVers": 22345678, "FCM_SwVersM": 157, "FCM_SwVersS": 245}
    Send Can Message    FCM_0x67D    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_HwVers
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_PartVers
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    22345678
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    157
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    245

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"FCM_HwVers": 255, "FCM_PartVers": 4294967295, "FCM_SwVersM": 255, "FCM_SwVersS": 255}
    Run Keyword And Continue On Failure    Send Can Message    FCM_0x67D    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_HwVers
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_PartVers
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4294967295
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx1000.PP_SG_FCM_0x67D_VDT_SG_FCM_0x67.FCM_SwVersS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

FCM-RX-0x42e: Send FCM_NM_0x42E with Signal Values and Verify by reading XCP Variable
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

    Log    Assigning Mid Value to the signal
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

    Log    Assigning Maximum Value to the signal
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

FCM-RX-0x487: Send FCM_0x487 with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message FCM_0x487 and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"FCM_ComLostFlt_ESP": 0, "FCM_ComLostFlt_iBooster": 0, "FCM_ComLostFlt_EPS": 0, "FCM_ComLostFlt_YRS": 0, "FCM_ComLostFlt_BCM": 0, "FCM_ComLostFlt_ECC": 0, "FCM_ComLostFlt_TBOX": 0, "FCM_ComLostFlt_CIM": 0, "FCM_ComLostFlt_ICC": 0, "FCM_ComLostFlt_MRR": 0, "FCM_ComLostFlt_PEPS": 0, "FCM_ComLostFlt_ADAS": 0, "FCM_ComE2EFlt": 0, "FCM_ChkInvldSig_ESP": 0, "FCM_ChkInvldSig_iBooster": 0, "FCM_ChkInvldSig_EPS": 0, "FCM_ChkInvldSig_YRS": 0, "FCM_ChkInvldSig_CIM": 0, "FCM_ChkInvldSig_ECC": 0, "FCM_ChkInvldSig_PEPS": 0, "FCM_ChkInvldSig_ICC": 0, "FCM_ChkPrivateCANBusOff": 0, "FCM_ChkPublicCANBusOff": 0, "FCM_BattVoltBelowThd": 0, "FCM_BattVoltOverThd": 0, "FCM_CamBli": 0, "FCM_ECUTmpHiTProtn": 0, "FCM_IntCircOutpVoltBelowThd": 0, "FCM_IntCircOutpVoltOverThd": 0, "FCM_IntCircPrmntFlt": 0, "FCM_MatchParaErr": 0, "FCM_VehCfgInfoErr": 0, "FCM_IntCircFlt": 0, "FCM_DLCFlt_ESP": 0, "FCM_DLCFlt_iBooster": 0, "FCM_DLCFlt_EPS": 0, "FCM_DLCFlt_YRS": 0, "FCM_DLCFlt_BCM": 0, "FCM_DLCFlt_ECC": 0, "FCM_DLCFlt_TBOX": 0, "FCM_DLCFlt_CIM": 0, "FCM_DLCFlt_ICC": 0, "FCM_DLCFlt_MRR": 0, "FCM_DLCFlt_PEPS": 0, "FCM_DLCFlt_ADAS": 0, "FCM_OnlineCalOutOfRng": 0, "FCM_IniCalOutOfRng": 0, "FCM_IniCalTimeout": 0, "FCM_NotCal": 0, "FCM_OTARdy_Fb": 0}
    Run Keyword And Continue On Failure    Send Can Message    FCM_0x487    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ESP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_iBooster
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_EPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_YRS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_BCM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ECC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_TBOX
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_CIM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ICC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_MRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_PEPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ADAS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComE2EFlt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_ESP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_iBooster
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_EPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_YRS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_CIM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_ECC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_PEPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_ICC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkPrivateCANBusOff
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkPublicCANBusOff
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_BattVoltBelowThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_BattVoltOverThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_CamBli
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ECUTmpHiTProtn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircOutpVoltBelowThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircOutpVoltOverThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircPrmntFlt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_MatchParaErr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_VehCfgInfoErr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircFlt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ESP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_iBooster
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_EPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_YRS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_BCM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ECC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_TBOX
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_CIM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ICC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_MRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_PEPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ADAS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_OnlineCalOutOfRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IniCalOutOfRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IniCalTimeout
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_NotCal
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_OTARdy_Fb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"FCM_ComLostFlt_ESP": 0, "FCM_ComLostFlt_iBooster": 0, "FCM_ComLostFlt_EPS": 0, "FCM_ComLostFlt_YRS": 0, "FCM_ComLostFlt_BCM": 0, "FCM_ComLostFlt_ECC": 0, "FCM_ComLostFlt_TBOX": 0, "FCM_ComLostFlt_CIM": 0, "FCM_ComLostFlt_ICC": 0, "FCM_ComLostFlt_MRR": 0, "FCM_ComLostFlt_PEPS": 0, "FCM_ComLostFlt_ADAS": 0, "FCM_ComE2EFlt": 0, "FCM_ChkInvldSig_ESP": 0, "FCM_ChkInvldSig_iBooster": 0, "FCM_ChkInvldSig_EPS": 0, "FCM_ChkInvldSig_YRS": 0, "FCM_ChkInvldSig_CIM": 0, "FCM_ChkInvldSig_ECC": 0, "FCM_ChkInvldSig_PEPS": 0, "FCM_ChkInvldSig_ICC": 0, "FCM_ChkPrivateCANBusOff": 0, "FCM_ChkPublicCANBusOff": 0, "FCM_BattVoltBelowThd": 0, "FCM_BattVoltOverThd": 0, "FCM_CamBli": 0, "FCM_ECUTmpHiTProtn": 0, "FCM_IntCircOutpVoltBelowThd": 0, "FCM_IntCircOutpVoltOverThd": 0, "FCM_IntCircPrmntFlt": 0, "FCM_MatchParaErr": 0, "FCM_VehCfgInfoErr": 0, "FCM_IntCircFlt": 0, "FCM_DLCFlt_ESP": 0, "FCM_DLCFlt_iBooster": 0, "FCM_DLCFlt_EPS": 0, "FCM_DLCFlt_YRS": 0, "FCM_DLCFlt_BCM": 0, "FCM_DLCFlt_ECC": 0, "FCM_DLCFlt_TBOX": 0, "FCM_DLCFlt_CIM": 0, "FCM_DLCFlt_ICC": 0, "FCM_DLCFlt_MRR": 0, "FCM_DLCFlt_PEPS": 0, "FCM_DLCFlt_ADAS": 0, "FCM_OnlineCalOutOfRng": 0, "FCM_IniCalOutOfRng": 0, "FCM_IniCalTimeout": 0, "FCM_NotCal": 0, "FCM_OTARdy_Fb": 2}
    Run Keyword And Continue On Failure    Send Can Message    FCM_0x487    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_OTARdy_Fb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"FCM_ComLostFlt_ESP": 1, "FCM_ComLostFlt_iBooster": 1, "FCM_ComLostFlt_EPS": 1, "FCM_ComLostFlt_YRS": 1, "FCM_ComLostFlt_BCM": 1, "FCM_ComLostFlt_ECC": 1, "FCM_ComLostFlt_TBOX": 1, "FCM_ComLostFlt_CIM": 1, "FCM_ComLostFlt_ICC": 1, "FCM_ComLostFlt_MRR": 1, "FCM_ComLostFlt_PEPS": 1, "FCM_ComLostFlt_ADAS": 1, "FCM_ComE2EFlt": 1, "FCM_ChkInvldSig_ESP": 1, "FCM_ChkInvldSig_iBooster": 1, "FCM_ChkInvldSig_EPS": 1, "FCM_ChkInvldSig_YRS": 1, "FCM_ChkInvldSig_CIM": 1, "FCM_ChkInvldSig_ECC": 1, "FCM_ChkInvldSig_PEPS": 1, "FCM_ChkInvldSig_ICC": 1, "FCM_ChkPrivateCANBusOff": 1, "FCM_ChkPublicCANBusOff": 1, "FCM_BattVoltBelowThd": 1, "FCM_BattVoltOverThd": 1, "FCM_CamBli": 1, "FCM_ECUTmpHiTProtn": 1, "FCM_IntCircOutpVoltBelowThd": 1, "FCM_IntCircOutpVoltOverThd": 1, "FCM_IntCircPrmntFlt": 1, "FCM_MatchParaErr": 1, "FCM_VehCfgInfoErr": 1, "FCM_IntCircFlt": 1, "FCM_DLCFlt_ESP": 1, "FCM_DLCFlt_iBooster": 1, "FCM_DLCFlt_EPS": 1, "FCM_DLCFlt_YRS": 1, "FCM_DLCFlt_BCM": 1, "FCM_DLCFlt_ECC": 1, "FCM_DLCFlt_TBOX": 1, "FCM_DLCFlt_CIM": 1, "FCM_DLCFlt_ICC": 1, "FCM_DLCFlt_MRR": 1, "FCM_DLCFlt_PEPS": 1, "FCM_DLCFlt_ADAS": 1, "FCM_OnlineCalOutOfRng": 1, "FCM_IniCalOutOfRng": 1, "FCM_IniCalTimeout": 1, "FCM_NotCal": 1, "FCM_OTARdy_Fb": 3}
    Run Keyword And Continue On Failure    Send Can Message    FCM_0x487    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ESP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_iBooster
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_EPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_YRS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_BCM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ECC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_TBOX
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_CIM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ICC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_MRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_PEPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComLostFlt_ADAS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ComE2EFlt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_ESP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_iBooster
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_EPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_YRS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_CIM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_ECC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_PEPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkInvldSig_ICC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkPrivateCANBusOff
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ChkPublicCANBusOff
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_BattVoltBelowThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_BattVoltOverThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_CamBli
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_ECUTmpHiTProtn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircOutpVoltBelowThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircOutpVoltOverThd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircPrmntFlt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_MatchParaErr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_VehCfgInfoErr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IntCircFlt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ESP
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_iBooster
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_EPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_YRS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_BCM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ECC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_TBOX
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_CIM
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ICC
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_MRR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_PEPS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_DLCFlt_ADAS
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_OnlineCalOutOfRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IniCalOutOfRng
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_IniCalTimeout
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_NotCal
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApFcmRx100.PP_SG_FCM_0x487_VDT_SG_FCM_0x48.FCM_OTARdy_Fb
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
