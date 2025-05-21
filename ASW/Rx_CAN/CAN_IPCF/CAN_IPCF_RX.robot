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
Send mCgmFaults with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mCgmFaults and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"modem_telematics_fault":0, "modem_teleops_1_fault":0, "modem_teleops_2_fault":0, "modem_teleops_3_fault":0, "vcu_connection_fault":0, "to_connection_fault":0, "adcu_ros_bridge_fault":0, "adcu_grpc_bridge_fault":0, "gps_sensor_fault":0, "fms_connection_fault":0,}
    Send Can Message    mCgmFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_telematics_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_teleops_1_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_teleops_2_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_teleops_3_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.vcu_connection_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.to_connection_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.adcu_ros_bridge_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.adcu_grpc_bridge_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.gps_sensor_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.fms_connection_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning  Maximum  Value to the signal
    ${signals}=    Evaluate    {"modem_telematics_fault":1, "modem_teleops_1_fault":1, "modem_teleops_2_fault":1, "modem_teleops_3_fault":1, "vcu_connection_fault":1, "to_connection_fault":1, "adcu_ros_bridge_fault":1, "adcu_grpc_bridge_fault":1, "gps_sensor_fault":1, "fms_connection_fault":1,}
    Send Can Message    mCgmFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_telematics_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_teleops_1_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_teleops_2_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.modem_teleops_3_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.vcu_connection_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.to_connection_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.adcu_ros_bridge_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.adcu_grpc_bridge_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.gps_sensor_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmFaults_VDP_SG_mCgmFau.fms_connection_fault
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1