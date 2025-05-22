*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration    D:/Validation/Vinayak/ASW/CAN_VM_Configuration/ASW_CAN_TC_RX    CAN_VM_RX
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/RX_Testing/CAN_VM/CAN_TC_V1.0.4.dbc    3    500000
    Sleep    3s


Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
Send mTCLeftJoyStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mCgmFaults and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl":0, "LeftX_Neg":0, "LeftX_Pos":0, "LeftX_Value":0, "LeftY_Ntrl":0, "LeftY_Neg":0, "LeftY_Pos":0, "LeftY_Value":10, "Left_Trigger":0, "Btn_Dwn":0,"Btn_Right":0,"Btn_Up":0,"Btn_Left":0,"MsgCntr":1,"MsgCrc":23,}
    Send Can Message    mTCLeftJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Left_Trigger
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    23


    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl":1, "LeftX_Neg":1, "LeftX_Pos":1, "LeftX_Value":190, "LeftY_Ntrl":1, "LeftY_Neg":1, "LeftY_Pos":1, "LeftY_Value":230, "Left_Trigger":1, "Btn_Dwn":1,"Btn_Right":1,"Btn_Up":1,"Btn_Left":1,"MsgCntr":2,"MsgCrc":56,}
    Send Can Message    mTCLeftJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    190

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    230

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Left_Trigger
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    56

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"LeftX_Ntrl":2, "LeftX_Neg":2, "LeftX_Pos":2, "LeftX_Value":1010, "LeftY_Ntrl":2, "LeftY_Neg":2, "LeftY_Pos":2, "LeftY_Value":1020, "Left_Trigger":2, "Btn_Dwn":2,"Btn_Right":2,"Btn_Up":2,"Btn_Left":2,"MsgCntr":14,"MsgCrc":230,}
    Send Can Message    mTCLeftJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftX_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1010

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Ntrl
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Neg
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Pos
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.LeftY_Value
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1020

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Left_Trigger
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Dwn
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Right
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Up
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.Btn_Left
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    14

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCLeftJoyStat_VDP_SG_mTC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    230

Send mTcSwVer with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message mCgmFaults and XCP variable read
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"HwMaj":10, "HwMin":10, "SwMaj":10, "SwMin":10,}
    Send Can Message    mTcSwVer    ${signals}
    Sleep    1.5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.HwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.HwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    10

    Log    Assigning Middle Value to the signal
    ${signals}=    Evaluate    {"HwMaj":230, "HwMin":230, "SwMaj":230, "SwMin":230,}
    Send Can Message    mTcSwVer    ${signals}
    Sleep    1.5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.HwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    230

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.HwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    230

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    230

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    230

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"HwMaj":1020, "HwMin":1020, "SwMaj":1020, "SwMin":1020,}
    Send Can Message    mTcSwVer    ${signals}
    Sleep    1.5s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.HwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1020

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.HwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1020

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1020

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx1000.PP_SG_mTcSwVer_VDP_SG_mTcSwVer.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1020