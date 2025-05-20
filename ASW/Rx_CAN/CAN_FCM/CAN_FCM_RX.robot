*** Settings ***
Library    can_rx_validation_interface.py
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

