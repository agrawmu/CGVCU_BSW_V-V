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

Send mBECargoPIN with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mBECargoPIN XCP variable read

    Log    Assigning minimum/maximum Value to the signal
    ${signals}=    Evaluate    {"tripCargoDoorOnePin": 0,"tripCargoDoorTwoPin": 0,}

    Send Can Message    mBECargoPIN  ${signals}
    Sleep   1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorOnePin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApCgmRx500.PP_SG_mBECargoPIN_VDP_SG_mBECar.tripCargoDoorTwoPin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   0

Send mBECmd with Signal Values and Verify by reading XCP Variable
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

Send mVehCtrlTORq with Signal Values and Verify by reading XCP Variable
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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1000000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Steer_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1000000

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1000000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_Steer_Cmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1000000

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.TO_EstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx20_3.PP_SG_mVehCtrlTORq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}   250


