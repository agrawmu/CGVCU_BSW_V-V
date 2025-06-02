*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***

Setup
    Open Canape And Load Imu Configuration    D:/Jenkins/workspace/CGVCU_BSW_V-V/ASW/Rx_CAN/Rx_CAN_Config    CAN_RX
    Initialize Can    D:/Jenkins/workspace/CGVCU_BSW_V-V/ASW/DBC/CAN_TC_V1.0.4.dbc    1    500000
    Sleep    3s


Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
IPCF-RX-0x558: Send mCgmFaults with Signal Values and Verify by reading XCP Variable
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

    Log    Assigning Maximum Value to the signal
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

IPCF-RX-0x553: Send mBECargoPIN with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mBECargoPIN XCP variable read
    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"tripCargoDoorOnePin": 0,"tripCargoDoorTwoPin": 0,}

    Send Can Message    mBECargoPIN  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorOnePin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorTwoPin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning min Value to the signal
    ${signals}=    Evaluate    {"tripCargoDoorOnePin": 2194967295,"tripCargoDoorTwoPin": 1294967295,}
    Send Can Message    mBECargoPIN  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorOnePin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   2194967295
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorTwoPin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1294967295
    
    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"tripCargoDoorOnePin": 4294967295,"tripCargoDoorTwoPin": 3294967295,}
    Send Can Message    mBECargoPIN  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorOnePin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   4294967295
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorTwoPin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3294967295

IPCF-RX-0x554: Send mBECmd with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mBECmd XCP variable read
    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"tripIsActive": 0,"BETripMeterStart": 0,"BETripMeterReset": 0,"Bay2DoorRemoteCmd": 0,"Bay2HtrRemoteCmd": 0,"Bay1DoorRemoteCmd": 0,"Bay1HtrRemoteCmd": 0,"jobType": 0,"AllowDeliveryMode": 0,"MsgCntr": 0,"MsgCrc": 0,}
    Send Can Message    mBECmd  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.tripIsActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.BETripMeterStart
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.BETripMeterReset
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay2DoorRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay2HtrRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay1DoorRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay1HtrRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.jobType
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.AllowDeliveryMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning middle Value to the signal
    ${signals}=    Evaluate    {"tripIsActive": 0,"BETripMeterStart": 0,"BETripMeterReset": 0,"Bay2DoorRemoteCmd": 1,"Bay2HtrRemoteCmd": 1,"Bay1DoorRemoteCmd": 1,"Bay1HtrRemoteCmd": 1,"jobType": 1,"AllowDeliveryMode": 1,"MsgCntr": 7,"MsgCrc": 50,}
    Send Can Message    mBECmd  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.tripIsActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.BETripMeterStart
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.BETripMeterReset
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay2DoorRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay2HtrRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay1DoorRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay1HtrRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.jobType
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.AllowDeliveryMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"tripIsActive": 0,"BETripMeterStart": 0,"BETripMeterReset": 0,"Bay2DoorRemoteCmd": 3,"Bay2HtrRemoteCmd": 1,"Bay1DoorRemoteCmd": 1,"Bay1HtrRemoteCmd": 1,"jobType": 3,"AllowDeliveryMode": 1,"MsgCntr": 15,"MsgCrc": 250,}
    Send Can Message    mBECmd  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.tripIsActive
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.BETripMeterStart
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.BETripMeterReset
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay2DoorRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay2HtrRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay1DoorRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.Bay1HtrRemoteCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.jobType
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.AllowDeliveryMode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECmd_VDP_SG_mBECmd.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

IPCF-RX-0x121: Send mVehCtrlTORq with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mVehCtrlTORq XCP variable read
    Log    Assigning minimum Value to the signal
    ${signals}=    Evaluate    {"TO_Accel_Cmd": 0,"TO_Steer_Cmd": 0,"MsgCntr": 0,"TO_EstopRq": 0,"MsgCrc": 0,}
    Send Can Message    mVehCtrlTORq  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Accel_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Steer_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_EstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    Log    Assigning middle Value to the signal
    ${signals}=    Evaluate    {"TO_Accel_Cmd": 1,"TO_Steer_Cmd": 1,"MsgCntr": 7,"TO_EstopRq": 1,"MsgCrc": 50,}
    Send Can Message    mVehCtrlTORq  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Accel_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Steer_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   7
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_EstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   50

    Log    Assigning maximum Value to the signal
    ${signals}=    Evaluate    {"TO_Accel_Cmd": 1,"TO_Steer_Cmd": 1,"MsgCntr": 15,"TO_EstopRq": 1,"MsgCrc": 250,}
    Send Can Message    mVehCtrlTORq  ${signals}
    Sleep   1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Accel_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Steer_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_EstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250

IPCF-RX-0x210: Send mCgmHeartbeat with Signal Values and Verify by reading XCP Variable
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
    ${signals}=    Evaluate    {"seconds": 60, "nanoseconds": 1194967295,}
    Run Keyword And Continue On Failure     Send Can Message    mCgmHeartbeat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.seconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    60
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.nanoseconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1194967295

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"seconds": 100, "nanoseconds": 2294967295,}
    Run Keyword And Continue On Failure     Send Can Message    mCgmHeartbeat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.seconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmHeartbeat_VDP_SG_mCgm.nanoseconds
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2294967295

IPCF-RX-0x621: Send mFMS_PTT_Sched with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    # Evaluate the dictionary to convert string to native dict
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"PTT_BrkChk": 0, "PTT_48VSysChk": 0, "PTT_ExtLightChk": 0, "PTT_EpbChk": 0, "PTT_SteerSysChk": 0, "PTT_AudioAlertsChk": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mFMS_PTT_Sched    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_BrkChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_48VSysChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_ExtLightChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_EpbChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_SteerSysChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_AudioAlertsChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    
    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"PTT_BrkChk": 1, "PTT_48VSysChk": 1, "PTT_ExtLightChk": 1, "PTT_EpbChk": 1, "PTT_SteerSysChk": 1, "PTT_AudioAlertsChk": 1,}
    Run Keyword And Continue On Failure    Send Can Message    mFMS_PTT_Sched    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_BrkChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_48VSysChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_ExtLightChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_EpbChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_SteerSysChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_AudioAlertsChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    
    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"PTT_BrkChk": 2, "PTT_48VSysChk": 2, "PTT_ExtLightChk": 2, "PTT_EpbChk": 2, "PTT_SteerSysChk": 2, "PTT_AudioAlertsChk": 2,}
    Run Keyword And Continue On Failure    Send Can Message    mFMS_PTT_Sched    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_BrkChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_48VSysChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_ExtLightChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_EpbChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_SteerSysChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx1000.PP_SG_mFMS_PTT_Sched_VDP_SG_mFM.PTT_AudioAlertsChk
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

IPCF-RX-0x120: Send mTOStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"TO_ConnectionStat": 0, "TO_dlg_resp_code": 0, "TO_dlg_resp_id": 0, "TO_cmd_veh_mode": 0, "MsgCntr": 0, "VehDirCmd": 0,"MsgCrc": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mTOStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_ConnectionStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_dlg_resp_code
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_dlg_resp_code
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_cmd_veh_mode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"TO_ConnectionStat": 1, "TO_dlg_resp_code": 1, "TO_dlg_resp_id": 1, "TO_cmd_veh_mode": 1, "MsgCntr": 7, "VehDirCmd": 1,"MsgCrc": 56,}
    Run Keyword And Continue On Failure    Send Can Message    mTOStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_ConnectionStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_dlg_resp_code
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_dlg_resp_code
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_cmd_veh_mode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    56

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"TO_ConnectionStat": 2, "TO_dlg_resp_code": 2, "TO_dlg_resp_id": 2, "TO_cmd_veh_mode": 2, "MsgCntr": 15, "VehDirCmd": 2,"MsgCrc": 255,}
    Send Can Message    mTOStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_ConnectionStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_dlg_resp_code
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_dlg_resp_code
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.TO_cmd_veh_mode
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

IPCF-RX-0x557: Send mCgmSwVer with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mCgmSwVer    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"SwMaj": 121, "SwMin": 75, "SwRev": 45, "SwStat": 0,}
    Run Keyword And Continue On Failure    Send Can Message    mCgmSwVer    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    121
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    75
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    45
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": 1,}
    Run Keyword And Continue On Failure    Send Can Message    mCgmSwVer    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mCgmSwVer_VDP_SG_mCgmSwVe.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

IPCF-RX-0x612: Send mExtLightsTORq with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mExtLightsTORq and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LightTurnCmdR": 0, "LightTurnCmdL": 0, "LightHighCmd": 0, "HornCmd": 0, "LightHazardCmd": 0, "MsgCntr": 0,"MsgCrc": 0}
    Run Keyword And Continue On Failure    Send Can Message    mExtLightsTORq    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.HornCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightHazardCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightHighCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightTurnCmdL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightTurnCmdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"LightTurnCmdR": 1, "LightTurnCmdL": 1, "LightHighCmd": 1, "HornCmd": 1, "LightHazardCmd": 1, "MsgCntr": 7,"MsgCrc": 35}
    Run Keyword And Continue On Failure    Send Can Message    mExtLightsTORq    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.HornCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightHazardCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightHighCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightTurnCmdL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightTurnCmdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    7
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    35

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"LightTurnCmdR": 1, "LightTurnCmdL": 1, "LightHighCmd": 1, "HornCmd": 1, "LightHazardCmd": 1, "MsgCntr": 15,"MsgCrc": 255}
    Run Keyword And Continue On Failure    Send Can Message    mExtLightsTORq    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.HornCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightHazardCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightHighCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightTurnCmdL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.LightTurnCmdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mExtLightsTORq_VDP_SG_mEx.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
