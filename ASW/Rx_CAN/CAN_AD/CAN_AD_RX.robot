*** Settings ***
Library    ../can_rx_validation_interface.py
Library    BuiltIn

Suite Setup    Setup
Suite Teardown    Shutdown

*** Keywords ***
Setup
    Open Canape And Load Imu Configuration
    Initialize Can    C:/Users/validation/Documents/PythonProject/CANoe/RX_Testing/CAN_AD/CAN_AD_V1.6.4.dbc    3    500000
    Sleep    3s

Shutdown
    Shutdown Can
    Close Canape

*** Test Cases ***
AD-RX-0x207: Send mAdcuFaults with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message and XCP variable read
    # Evaluate the dictionary to convert string to native dict
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"Flt_EPVMC_Cameras": 0,}

    Send Can Message    mAdcuFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mAdcuFaults_VDP_SG_mAdcuF.Flt_EPVMC_Cameras
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"Flt_EPVMC_Cameras": 1,}

    Send Can Message    mAdcuFaults    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mAdcuFaults_VDP_SG_mAdcuF.Flt_EPVMC_Cameras
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

AD-RX-0x613: Send mAdcuStat with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"AdcuStatus": 1, "AdcuShtdwnRdy": 0, "AdcuEstopRq": 0, "AD_Ready": 0, "AD_Mission_Cmplt": 0, "TO_Assistance_Rq": 0, "MsgCntr": 0, "MsgCrc": 1}
    Send Can Message    mAdcuStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuStatus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuEstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AD_Ready
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AD_Mission_Cmplt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.TO_Assistance_Rq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

    Log    Assigning Mid Value to the signal
    ${signals}=    Evaluate    {"AdcuStatus": 2, "AdcuShtdwnRdy": 1, "AdcuEstopRq": 1, "AD_Ready": 1, "AD_Mission_Cmplt": 1, "TO_Assistance_Rq": 1, "MsgCntr": 4, "MsgCrc": 80}
    Send Can Message    mAdcuStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuStatus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuEstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AD_Ready
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AD_Mission_Cmplt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.TO_Assistance_Rq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    80

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"AdcuStatus": 3, "AdcuShtdwnRdy": 1, "AdcuEstopRq": 1, "AD_Ready": 1, "AD_Mission_Cmplt": 1, "TO_Assistance_Rq": 2, "MsgCntr": 9, "MsgCrc": 210}
    Send Can Message    mAdcuStat    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuStatus
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuShtdwnRdy
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AdcuEstopRq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AD_Ready
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.AD_Mission_Cmplt
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.TO_Assistance_Rq
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    9
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mAdcuStat_VDP_SG_mAdcuSta.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    210



AD-RX-0x701: Send mAdcuSwVer with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message and XCP variable read
    # Evaluate the dictionary to convert string to native dict
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"SwMaj": 2, "SwMin": 0, "SwRev": 88, "SwStat": 0,}

    Send Can Message    mAdcuSwVer    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    2
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    88
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning mid Value to the signal

    ${signals}=    Evaluate    {"SwMaj": 4, "SwMin": 90, "SwRev": 3, "SwStat": 1,}

    Send Can Message    mAdcuSwVer    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    4
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    90
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1


    Log    Assigning maximum Value to the signal

    ${signals}=    Evaluate    {"SwMaj": 210, "SwMin": 110, "SwRev": 255, "SwStat": 1,}

    Send Can Message    mAdcuSwVer    ${signals}
    Sleep    10s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwMaj
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    210
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwMin
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    110
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwRev
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx10000.PP_SG_mAdcuSwVer_VDP_SG_mAdcuSw.SwStat
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1


AD-RX-0x611: Send mExtLightsADRq with Signal Values and Verify by reading XCP Variable

    [Documentation]    Validate RX message and XCP variable read
    # Evaluate the dictionary to convert string to native dict
    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"LightTurnCmdR": 0, "LightTurnCmdL": 0, "LightHighCmd": 0, "HornCmd": 0, "LightHazardCmd": 0,}

    Send Can Message    mExtLightsADRq    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightTurnCmdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightTurnCmdL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightHighCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.HornCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightHazardCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0


    Log    Assigning maximum Value to the signal

    ${signals}=    Evaluate    {"LightTurnCmdR": 1, "LightTurnCmdL": 1, "LightHighCmd": 1, "HornCmd": 1, "LightHazardCmd": 1,}

    Send Can Message    mExtLightsADRq    ${signals}
    Sleep    1s
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightTurnCmdR
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightTurnCmdL
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightHighCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.HornCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mExtLightsADRq_VDP_SG_mEx.LightHazardCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1

#AD-RX-0x608: Send mGpsAntStatus with Signal Values and Verify by reading XCP Variable
#    [Documentation]    Validate RX message and XCP variable read
#    # Evaluate the dictionary to convert string to native dict
#    Log    Assigning Minimum Value to the signal
#    ${signals}=    Evaluate    {"RelPosLength": -23.3}
#    Send Can Message    mGpsAntStatus    ${signals}
#    Sleep    1s
#    Log        [Physical value]=([Raw value]*[Factor]) + [Offset] And As per dbc factor is 0.001 for RelPosLength
#    ${Raw_value_mGpsAntStatus}=  Evaluate    int(-23.3 / 0.001)    # -23300
#    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mGpdAntStatus_VDP_SG_mGpd.RelPosLength
#    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    ${Raw_value_mGpsAntStatus}    precision=0.001
#
#    Log    Assigning Mid Value to the signal
#    ${signals}=    Evaluate    {"RelPosLength": 10}
#    Send Can Message    mGpsAntStatus    ${signals}
#    Sleep    1s
#    ${Raw_value_mGpsAntStatus}=  Evaluate    int(10 / 0.001)    # 10000
#    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mGpdAntStatus_VDP_SG_mGpd.RelPosLength
#    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    ${Raw_value_mGpsAntStatus}    precision=0.001
#
#    Log    Assigning Maximum Value to the signal
#    ${signals}=    Evaluate    {"RelPosLength": 30}
#    Send Can Message    mGpsAntStatus    ${signals}
#    Sleep    1s
#    ${Raw_value_mGpsAntStatus}=  Evaluate    int(30 / 0.001)    # 30000
#    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx100.PP_SG_mGpdAntStatus_VDP_SG_mGpd.RelPosLength
#    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    ${Raw_value_mGpsAntStatus}    precision=0.001


AD-RX-0x78: Send mVehCtrlADRq with Signal Values and Verify by reading XCP Variable
    [Documentation]    Validate RX message and XCP variable read

    Log    Assigning Minimum Value to the signal
    ${signals}=    Evaluate    {"VehSpdCmd": -64, "VehAccelLongCmd": -32, "VehRoadWhlAngleCmd": -327.68, "b_High_Deceleration_Flag": 0, "AebEvent": 0, "AebSrc": 0, "MsgCntr": 0, "VehDirCmd": 0, "MsgCrc": 0}

    Run Keyword And Continue On Failure    Send Can Message    mVehCtrlADRq    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehSpdCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -64
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehAccelLongCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -32
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehRoadWhlAngleCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    -327.68    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.b_High_Deceleration_Flag
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebEvent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebSrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0

    Log    Assigning Mid Value to the signal

    ${signals}=    Evaluate    {"VehSpdCmd": 0, "VehAccelLongCmd": 0, "VehRoadWhlAngleCmd": 0, "b_High_Deceleration_Flag": 1, "AebEvent": 1, "AebSrc": 8, "MsgCntr": 8, "VehDirCmd": 1, "MsgCrc": 128}
    Run Keyword And Continue On Failure    Send Can Message    mVehCtrlADRq    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehSpdCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehAccelLongCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehRoadWhlAngleCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    0    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.b_High_Deceleration_Flag
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebEvent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebSrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    8
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    8
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    128

    ${signals}=    Evaluate    {"VehSpdCmd": 1, "VehAccelLongCmd": 1, "VehRoadWhlAngleCmd": 1, "b_High_Deceleration_Flag": 1, "AebEvent": 1, "AebSrc": 6, "MsgCntr": 15, "VehDirCmd": 1, "MsgCrc": 100}
    Run Keyword And Continue On Failure    Send Can Message    mVehCtrlADRq    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehSpdCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehAccelLongCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehRoadWhlAngleCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.b_High_Deceleration_Flag
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebEvent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebSrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    6
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    100

    Log    Assigning Maximum Value to the signal
    ${signals}=    Evaluate    {"VehSpdCmd": 63.96875, "VehAccelLongCmd": 31.984375, "VehRoadWhlAngleCmd": 327.67, "b_High_Deceleration_Flag": 1, "AebEvent": 1, "AebSrc": 15, "MsgCntr": 15, "VehDirCmd": 3, "MsgCrc": 255}

    Run Keyword And Continue On Failure    Send Can Message    mVehCtrlADRq    ${signals}
    Sleep    1s

    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehSpdCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    63.96875    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehAccelLongCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    31.984375    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehRoadWhlAngleCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    327.67    precision=0.001
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.b_High_Deceleration_Flag
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebEvent
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    1
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.AebSrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCntr
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    15
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.VehDirCmd
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    3
    ${value}=    Read Xcp Variable    rtARID_DEF_CpApAdcuRx20.PP_SG_mVehCtrlADRq_VDP_SG_mVehC.MsgCrc
    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${value}    255

