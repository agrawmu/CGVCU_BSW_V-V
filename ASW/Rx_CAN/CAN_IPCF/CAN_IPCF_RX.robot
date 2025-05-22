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
Send mFMS_PTT_Sched with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message handling and XCP variable read

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

Send mTOStat with Signal Values and Verify by reading XCP Variable
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

    ${signals}=    Evaluate    {"TO_ConnectionStat": 1, "TO_dlg_resp_code": 1, "TO_dlg_resp_id": 1, "TO_cmd_veh_mode": 1, "MsgCntr": 18, "VehDirCmd": 1,"MsgCrc": 255,}

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    18

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    Log    Assigning Maximum Value to the signal

    ${signals}=    Evaluate    {"TO_ConnectionStat": 2, "TO_dlg_resp_code": 2, "TO_dlg_resp_id": 2, "TO_cmd_veh_mode": 2, "MsgCntr": 255, "VehDirCmd": 2,"MsgCrc": 56,}

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
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApVcuTx500_1.PP_SG_mTOStat_VDP_SG_mTOStat.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    56

Send mCgmSwVer with Signal Values and Verify by reading XCP Variable
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