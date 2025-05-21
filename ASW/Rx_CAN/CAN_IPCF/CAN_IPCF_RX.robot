*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Validation/Vinayak/ASW/CAN_VM_Configuration/ASW_CAN_IPCF_RX    CAN_VM_RX
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/RX_Testing/CAN_VM/CAN_TC_V1.0.4.dbc    3    500000
    Sleep    3s


Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
Send mCgmHeartbeat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mCgmHeartbeat and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"seconds": -100, "nanoseconds": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mCgmHeartbeat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.seconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.nanoseconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"seconds": -40, "nanoseconds": 0,}
    Run Keyword And Continue On Failure     Send Can Message    mCgmHeartbeat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.seconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -40

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"seconds": 60, "nanoseconds": 0,}
    Run Keyword And Continue On Failure     Send Can Message    mCgmHeartbeat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.seconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    60

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"seconds": 100, "nanoseconds": 2294967295,}
    Run Keyword And Continue On Failure     Send Can Message    mCgmHeartbeat    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.seconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.nanoseconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2294967295