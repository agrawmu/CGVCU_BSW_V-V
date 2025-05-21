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

Send FCM_0x487 with Signal Values and Verify by reading XCP Variable
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

