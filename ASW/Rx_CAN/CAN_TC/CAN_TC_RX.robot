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
Send mTCRightJoyStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read
    # Evaluate the dictionary to convert string to native dict
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 0, "RightX_Neg": 0, "RightX_Pos": 0, "RightX_Value": 10, "RightY_Ntrl": 0, "RightY_Neg": 0, "RightY_Pos": 0, "RightY_Value": 10, "Right_Trigger": 0, "Btn_1": 0, "Btn_2": 0, "Btn_3": 0, "Btn_4": 0, "MsgCntr": 15, "MsgCrc": 23,}

    Run Keyword And Continue On Failure    Send Can Message    mTCRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Ntrl
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Neg
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Pos
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Value
    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Ntrl
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Neg
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Pos
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Value
    Should Be Equal As Numbers    ${value}    10

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Right_Trigger
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_1
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_2
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_3
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_4
    Should Be Equal As Numbers    ${value}    0

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.MsgCntr
    Should Be Equal As Numbers    ${value}    15

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.MsgCrc
    Should Be Equal As Numbers    ${value}    23


    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 1, "RightX_Neg": 1, "RightX_Pos": 1, "RightX_Value": 230, "RightY_Ntrl": 1, "RightY_Neg": 1, "RightY_Pos": 1, "RightY_Value": 230, "Right_Trigger": 1, "Btn_1": 1, "Btn_2": 1, "Btn_3": 1, "Btn_4": 1, "MsgCntr": 15, "MsgCrc": 56,}

    Run Keyword And Continue On Failure    Send Can Message    mTCRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Ntrl
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Neg
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Pos
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Value
    Should Be Equal As Numbers    ${value}    230

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Ntrl
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Neg
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Pos
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Value
    Should Be Equal As Numbers    ${value}    230

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Right_Trigger
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_1
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_2
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_3
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_4
    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.MsgCrc
    Should Be Equal As Numbers    ${value}    56


    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"RightX_Ntrl": 2, "RightX_Neg": 2, "RightX_Pos": 2, "RightX_Value": 1020, "RightY_Ntrl": 2, "RightY_Neg": 2, "RightY_Pos": 2, "RightY_Value": 1020, "Right_Trigger": 2, "Btn_1": 2, "Btn_2": 2, "Btn_3": 2, "Btn_4": 2, "MsgCntr": 15, "MsgCrc": 230,}

    Run Keyword And Continue On Failure    Send Can Message    mTCRightJoyStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Ntrl
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Neg
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Pos
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightX_Value
    Should Be Equal As Numbers    ${value}    1020

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Ntrl
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Neg
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Pos
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.RightY_Value
    Should Be Equal As Numbers    ${value}    1020

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Right_Trigger
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_1
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_2
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_3
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.Btn_4
    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApTcRx100.PP_SG_mTCRightJoyStat_VDP_SG_mT.MsgCrc
    Should Be Equal As Numbers    ${value}    230