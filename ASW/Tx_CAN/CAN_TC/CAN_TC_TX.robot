*** Settings ***
Library    ../can_tx_validation_interface.py
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
TC-TX_0x1CFFCCCCX: Send Tx XCP variables and validating on CAN signals for message mVcuSwVer
    [Documentation]    Validate TX message 'mVcuSwVer' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": 0}
    ${xcp_var_map}=    Evaluate    {"SwMaj": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwMaj", "SwMin": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwMin", "SwRev": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwRev", "SwStat": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwStat"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": "Development"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 100, "SwMin": 100, "SwRev": 100, "SwStat": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 100, "SwMin": 100, "SwRev": 100, "SwStat": "Development"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": "Released"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message mVcuGyroAngle
    [Documentation]    Validate TX message 'mVcuGyroAngle' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": -30000, "GyroYAng": -30000, "Pitch": -2500, "Tilt": -2500}
    ${xcp_var_map}=    Evaluate    {"GyroXAng": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.GyroXAng", "GyroYAng": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.GyroYAng", "Pitch": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.Pitch", "Tilt": "Rte_C_SG_mVcuGyroAngle_adt_3F70F9D99D313A00CF853F23F7ED10C6.Tilt",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": -30.0, "GyroYAng": -30.0, "Pitch": -25.0, "Tilt": -25.0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": 0, "GyroYAng": 0, "Pitch": 0, "Tilt": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": 0.0, "GyroYAng": 0.0, "Pitch": 0.0, "Tilt": 0.0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"GyroXAng": 30000, "GyroYAng": 30000, "Pitch": 2500, "Tilt": 2500}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GyroXAng": 30.0, "GyroYAng": 30.0, "Pitch": 25.0, "Tilt": 25.0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    mVcuGyroAngle    ${expected_can_signals}    30


tc-tx-0X613: Send Tx XCP variables and validating on CAN signals for message mAdcuStat
    [Documentation]    Validate TX message 'mAdcuStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"AD_Mission_Cmplt": 0, "AD_Ready": 0, "AdcuEstopRq": 0, "AdcuShtdwnRdy": 0,"AdcuStatus": 1, "MsgCntr": 0, "MsgCrc":1, "TO_Assistance_Rq":0}
    ${xcp_var_map}=    Evaluate    {"AD_Mission_Cmplt": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AD_Mission_Cmplt", "AD_Ready": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AD_Ready.AD_Ready", "AdcuEstopRq": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AdcuEstopRq", "AdcuShtdwnRdy": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AdcuShtdwnRdy", "AdcuStatus": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AdcuStatus", "MsgCntr":"Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.MsgCntr", "MsgCrc":"Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.MsgCrc", "TO_Assistance_Rq": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.TO_Assistance_Rq"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AD_Mission_Cmplt": 0, "AD_Ready": 0, "AdcuEstopRq": 0, "AdcuShtdwnRdy": 0,"AdcuStatus": "Init", "MsgCntr": 0, "MsgCrc":80, "TO_Assistance_Rq": "N0_Request"}
    Validate TX Message With Expected Values    mAdcuStat    ${expected_can_signals}    30
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AD_Mission_Cmplt": 0, "AD_Ready": 0, "AdcuEstopRq": 0, "AdcuShtdwnRdy": 0,"AdcuStatus": 2, "MsgCntr": 4, "MsgCrc": 80, "TO_Assistance_Rq": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AD_Mission_Cmplt": 0, "AD_Ready": 0, "AdcuEstopRq": 0, "AdcuShtdwnRdy": 0,"AdcuStatus": "Ok", "MsgCntr": 4, "MsgCrc":80, "TO_Assistance_Rq": "Go_No_Go"}
    Validate TX Message With Expected Values    mAdcuStat    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AD_Mission_Cmplt": 1, "AD_Ready": 1, "AdcuEstopRq": 1, "AdcuShtdwnRdy": 1,"AdcuStatus": 3, "MsgCntr": 9, "MsgCrc": 210, "TO_Assistance_Rq": 2}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AD_Mission_Cmplt": 1, "AD_Ready": 1, "AdcuEstopRq": 1, "AdcuShtdwnRdy": 1,"AdcuStatus": "Error", "MsgCntr": 9, "MsgCrc":210, "TO_Assistance_Rq": "Remote_Control"}
    Validate TX Message With Expected Values    mAdcuStat    ${expected_can_signals}    30
	
	
tc-tx-0X701: Send Tx XCP variables and validating on CAN signals for message mAdcuSwVer
    [Documentation]    Validate TX message 'mAdcuSwVer' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 2, "SwMin": 0, "SwRev": 88, "SwStat": 0}
    ${xcp_var_map}=    Evaluate    {"SwMaj": "Rte_C_SG_mAdcuSwVer_adt_2BFB32AE2908DA4C3469A448683CDEC7.SwMaj", "SwMin": "Rte_C_SG_mAdcuSwVer_adt_2BFB32AE2908DA4C3469A448683CDEC7.SwMin", "SwRev": "Rte_C_SG_mAdcuSwVer_adt_2BFB32AE2908DA4C3469A448683CDEC7.SwRev", "SwStat": "Rte_C_SG_mAdcuSwVer_adt_2BFB32AE2908DA4C3469A448683CDEC7.SwStat"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 2, "SwMin": 0, "SwRev": 88, "SwStat": 0}
    Validate TX Message With Expected Values    mAdcuSwVer    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 80, "SwMin": 90, "SwRev": 100, "SwStat": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 80, "SwMin": 90, "SwRev": 100, "SwStat": 0}
    Validate TX Message With Expected Values    mAdcuSwVer    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 210, "SwMin": 110, "SwRev": 3, "SwStat": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 210, "SwMin": 110, "SwRev": 3, "SwStat": 1}
    Validate TX Message With Expected Values    mAdcuSwVer    ${expected_can_signals}    30
	
	

TC-TX-0X621: Send Tx XCP variables and validating on CAN signals for message mFMS_PTT_Sched_FB
    [Documentation]    Validate TX message 'mFMS_PTT_Sched_FB' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"PTT_48VSysChkSts": 0, "PTT_AudioAlertsSts": 0, "PTT_BrkChkSts": 0, "PTT_EpbChkSts": 0, "PTT_ExtLightChkSts": 0, "PTT_SteerSysChkSts": 0}
    ${xcp_var_map}=    Evaluate    {"PTT_48VSysChkSts": "Rte_C_SG_mFMS_PTT_Sched_FB_adt_24C7CAD6C516BE25B225E6F50510E5C9.PTT_48VSysChkSts", "PTT_AudioAlertsSts": "Rte_C_SG_mFMS_PTT_Sched_FB_adt_24C7CAD6C516BE25B225E6F50510E5C9.PTT_AudioAlertsSts", "PTT_BrkChkSts": "Rte_C_SG_mFMS_PTT_Sched_FB_adt_24C7CAD6C516BE25B225E6F50510E5C9.PTT_BrkChkSts", "PTT_EpbChkSts": "Rte_C_SG_mFMS_PTT_Sched_FB_adt_24C7CAD6C516BE25B225E6F50510E5C9.PTT_EpbChkSts", "PTT_ExtLightChkSts": "Rte_C_SG_mFMS_PTT_Sched_FB_adt_24C7CAD6C516BE25B225E6F50510E5C9.PTT_ExtLightChkSts", "PTT_SteerSysChkSts": "Rte_C_SG_mFMS_PTT_Sched_FB_adt_24C7CAD6C516BE25B225E6F50510E5C9.PTT_SteerSysChkSts"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"PTT_48VSysChkSts": 0, "PTT_AudioAlertsSts": 0, "PTT_BrkChkSts": 0, "PTT_EpbChkSts": 0, "PTT_ExtLightChkSts": 0, "PTT_SteerSysChkSts": 0}
    Validate TX Message With Expected Values    mFMS_PTT_Sched_FB    ${expected_can_signals}    30
	
    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"PTT_48VSysChkSts": 0, "PTT_AudioAlertsSts": 0, "PTT_BrkChkSts": 0, "PTT_EpbChkSts": 0, "PTT_ExtLightChkSts": 0, "PTT_SteerSysChkSts": 0}	
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"PTT_48VSysChkSts": 0, "PTT_AudioAlertsSts": 0, "PTT_BrkChkSts": 0, "PTT_EpbChkSts": 0, "PTT_ExtLightChkSts": 0, "PTT_SteerSysChkSts": 0}
    Validate TX Message With Expected Values    mFMS_PTT_Sched_FB    ${expected_can_signals}    30
	
	
    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"PTT_48VSysChkSts": 1, "PTT_AudioAlertsSts": 1, "PTT_BrkChkSts": 1, "PTT_EpbChkSts": 1, "PTT_ExtLightChkSts": 1, "PTT_SteerSysChkSts": 1}	
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"PTT_48VSysChkSts": 1, "PTT_AudioAlertsSts": 1, "PTT_BrkChkSts": 1, "PTT_EpbChkSts": 1, "PTT_ExtLightChkSts": 1, "PTT_SteerSysChkSts": 1}
    Validate TX Message With Expected Values    mFMS_PTT_Sched_FB    ${expected_can_signals}    30
	
	

TC-TX-0X303: Send Tx XCP variables and validating on CAN signals for message mPreTripStat
    [Documentation]    Validate TX message 'mPreTripStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"AudioAlrtChk": 1, "BrkChk": 1, "EpbChk": 1, "ExtLghtChk": 1, "LvBattChk": 1, "LvSysChk": 1,"MsgCntr": 0,"MsgCrc": 10, "MvSysChk": 0,"PreTripRslt": 0, "PreTripStat": 0, "SteerSysChk": 1}
    ${xcp_var_map}=    Evaluate    {"AudioAlrtChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.AudioAlrtChk", "BrkChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.BrkChk", "EpbChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.EpbChk", "ExtLghtChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.ExtLghtChk", "LvBattChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.LvBattChk", "LvSysChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.LvSysChk", "MsgCntr": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.MsgCntr", "MsgCrc": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.MsgCrc", "MvSysChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.MvSysChk", "PreTripRslt": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.PreTripRslt", "PreTripStat": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.PreTripStat", "SteerSysChk": "Rte_C_SG_mPreTripStat_adt_354701605F7089E76E6D954D65721F2B.AudioAlrtChk.SteerSysChk"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AudioAlrtChk": "Ok", "BrkChk": "Ok", "EpbChk": "Ok", "ExtLghtChk": "Ok", "LvBattChk": "Ok", "LvSysChk": "Ok","MsgCntr": 0,"MsgCrc": 10,"MvSysChk": "SNA","PreTripRslt": "SNA", "PreTripStat": "SNA", "SteerSysChk": "Ok"}
    Validate TX Message With Expected Values    mPreTripStat    ${expected_can_signals}    30
	
	 
    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AudioAlrtChk": 0, "BrkChk": 0, "EpbChk": 0, "ExtLghtChk": 0, "LvBattChk": 0, "LvSysChk": 0,"MsgCntr": 5,"MsgCrc": 109, "MvSysChk": 0,"PreTripRslt": 0, "PreTripStat": 0, "SteerSysChk": 1}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AudioAlrtChk": 0, "BrkChk": 0, "EpbChk": 0, "ExtLghtChk": 0, "LvBattChk": 0, "LvSysChk": 0,"MsgCntr": 5,"MsgCrc": 109,"MvSysChk": "SNA","PreTripRslt": "SNA", "PreTripStat": "SNA", "SteerSysChk": "Ok"}
    Validate TX Message With Expected Values    mPreTripStat    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AudioAlrtChk": 3, "BrkChk": 2, "EpbChk": 2, "ExtLghtChk": 1, "LvBattChk": 2, "LvSysChk": 2,"MsgCntr": 10,"MsgCrc": 200, "MvSysChk": 5,"PreTripRslt": 2, "PreTripStat": 1, "SteerSysChk": 2}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AudioAlrtChk": "HornFail", "BrkChk": "Fail", "EpbChk": "Fail", "ExtLghtChk": "HighBeamFail", "LvBattChk": "Low", "LvSysChk": "Fail","MsgCntr": 10,"MsgCrc": 200,"MvSysChk": "Batt1 Pass, Batt2 Pass ","PreTripRslt": "Failed Mandatory", "PreTripStat": "EnabledMdtry", "SteerSysChk": "Fail"}
    Validate TX Message With Expected Values    mPreTripStat    ${expected_can_signals}    30
	

TC-TX-0X488: Send Tx XCP variables and validating on CAN signals for message mVcuHeartbeat
    [Documentation]    Validate TX message 'mVcuHeartbeat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"nanoseconds": 0, "seconds": -2147483648}
    ${xcp_var_map}=    Evaluate    {"nanoseconds": "Rte_C_SG_mVcuHeartbeat_adt_31DAF32B9B16721020C3A567CE3EA075.nanoseconds", "seconds": "Rte_C_SG_mVcuHeartbeat_adt_31DAF32B9B16721020C3A567CE3EA075.seconds"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"nanoseconds": 0, "seconds": -2147483648}
    Validate TX Message With Expected Values    mVcuHeartbeat    ${expected_can_signals}    30
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"nanoseconds": 0, "seconds": 20}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"nanoseconds": 0, "seconds": 0}
    Validate TX Message With Expected Values    mVcuHeartbeat    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"nanoseconds": 0, "seconds": 2147483647}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"nanoseconds": 0, "seconds": 2147483647}
    Validate TX Message With Expected Values    mVcuHeartbeat    ${expected_can_signals}    30
		

TC-TX_0x1CFFCCCCX: Send Tx XCP variables and validating on CAN signals for message mVcuSwVer
    [Documentation]    Validate TX message 'mVcuSwVer' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": 0}
    ${xcp_var_map}=    Evaluate    {"SwMaj": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwMaj", "SwMin": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwMin", "SwRev": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwRev", "SwStat": "Rte_C_SG_mVcuSwVer_adt_7945B6A58EEF4F1D9A99755BB3E53D80.SwStat"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 0, "SwMin": 0, "SwRev": 0, "SwStat": "Development"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30
	
    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 100, "SwMin": 100, "SwRev": 100, "SwStat": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 100, "SwMin": 100, "SwRev": 100, "SwStat": "Development"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"SwMaj": 255, "SwMin": 255, "SwRev": 255, "SwStat": "Released"}
    Validate TX Message With Expected Values    mVcuSwVer    ${expected_can_signals}    30	
	

TC-TX-0X671: Send Tx XCP variables and validating on CAN signals for message mVehBattStat
    [Documentation]    Validate TX message 'mVehBattStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"BattSocFast": 0, "CellTmprMin": -273, "MsgCntr": 10, "MsgCrc": 10}
    ${xcp_var_map}=    Evaluate    {"BattSocFast": "Rte_C_SG_mVehBattStat_adt_61A4ABCECF2CBFAA5EFBCD25559E617E.BattSocFast", "CellTmprMin": "Rte_C_SG_mVehBattStat_adt_61A4ABCECF2CBFAA5EFBCD25559E617E.CellTmprMin", "MsgCntr": "Rte_C_SG_mVehBattStat_adt_61A4ABCECF2CBFAA5EFBCD25559E617E.MsgCntr", "MsgCrc": "Rte_C_SG_mVehBattStat_adt_61A4ABCECF2CBFAA5EFBCD25559E617E.MsgCrc"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BattSocFast": 0, "CellTmprMin": -273, "MsgCntr": 10, "MsgCrc": 10}
    Validate TX Message With Expected Values    mVehBattStat    ${expected_can_signals}    30
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"BattSocFast": 190, "CellTmprMin": 190, "MsgCntr": 5, "MsgCrc": 5}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BattSocFast": 190, "CellTmprMin": 190, "MsgCntr": 5, "MsgCrc": 5}
    Validate TX Message With Expected Values    mVehBattStat    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"BattSocFast": 100.3984375, "CellTmprMin": 1734.96875, "MsgCntr": 15, "MsgCrc": 255}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"BattSocFast": 100.3984375, "CellTmprMin": 1734.96875, "MsgCntr": 15, "MsgCrc": 255}
    Validate TX Message With Expected Values    mVehBattStat    ${expected_can_signals}    30
	


TC-TX-0X672: Send Tx XCP variables and validating on CAN signals for message mVehBattStat2
    [Documentation]    Validate TX message 'mVehBattStat2' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"CellTmprMax": -273, "MsgCntr": 1, "MsgCrc": 99, "MvCurrBatt": -1600}
    ${xcp_var_map}=    Evaluate    {"CellTmprMax": "Rte_C_SG_mVehBattStat2_adt_F40414917C7597FC81EDC9FDC222B370.CellTmprMax", "MsgCntr": "Rte_C_SG_mVehBattStat2_adt_F40414917C7597FC81EDC9FDC222B370.MsgCntr", "MsgCrc": "Rte_C_SG_mVehBattStat2_adt_F40414917C7597FC81EDC9FDC222B370.MsgCrc", "MvCurrBatt": "Rte_C_SG_mVehBattStat2_adt_F40414917C7597FC81EDC9FDC222B370.MvCurrBatt"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CellTmprMax": -273, "MsgCntr": 1, "MsgCrc": 99, "MvCurrBatt": -1600}
    Validate TX Message With Expected Values    mVehBattStat2    ${expected_can_signals}    30
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"CellTmprMax": 190, "MsgCntr": 8, "MsgCrc": 150, "MvCurrBatt": 200}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CellTmprMax": 190, "MsgCntr": 8, "MsgCrc": 150, "MvCurrBatt": 200}
    Validate TX Message With Expected Values    mVehBattStat2    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"CellTmprMax": 1734.96875, "MsgCntr": 14, "MsgCrc": 255, "MvCurrBatt": 1612.75}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CellTmprMax": 1734.96875, "MsgCntr": 14, "MsgCrc": 255, "MvCurrBatt": 1612.75}
    Validate TX Message With Expected Values    mVehBattStat2    ${expected_can_signals}    30
	
	

TC-TX-0X555: Send Tx XCP variables and validating on CAN signals for message mVehCargoStat1
    [Documentation]    Validate TX message 'mVehCargoStat1' by writing XCP variables and reading CAN signals

	Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"CargoDoor1Stat": 0,"CargoHeatPad1Stat": 0,"DeliveryStatusCargo1" 0,"LightCargoStat" 0,"MsgCntr": 2,"tripCargoDoorOnePinRcvd": 10 }
	${xcp_var_map}=    Evaluate    {"CargoDoor1Stat": "Rte_C_SG_mVehCargoStat1_adt_8C416EFE4F4F0CFFF54D9A16BEA1BC02.CargoDoor1Stat", "CargoHeatPad1Stat": "Rte_C_SG_mVehCargoStat1_adt_8C416EFE4F4F0CFFF54D9A16BEA1BC02.CargoHeatPad1Stat", "DeliveryStatusCargo1": "Rte_C_SG_mVehCargoStat1_adt_8C416EFE4F4F0CFFF54D9A16BEA1BC02.DeliveryStatusCargo1", "LightCargoStat": "Rte_C_SG_mVehCargoStat1_adt_8C416EFE4F4F0CFFF54D9A16BEA1BC02.LightCargoStat","MsgCntr": "Rte_C_SG_mVehCargoStat1_adt_8C416EFE4F4F0CFFF54D9A16BEA1BC02.MsgCntr","tripCargoDoorOnePinRcvd": "Rte_C_SG_mVehCargoStat1_adt_8C416EFE4F4F0CFFF54D9A16BEA1BC02.tripCargoDoorOnePinRcvd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CargoDoor1Stat": "Closed","CargoHeatPad1Stat": "OFF","DeliveryStatusCargo1": "idle","LightCargoStat": "Off","MsgCntr": 2,"tripCargoDoorOnePinRcvd": 10}
    Validate TX Message With Expected Values    mVehCargoStat1    ${expected_can_signals}    30
	
   
    Log  writing mid value to the xcp variables
	${xcp_values}=    Evaluate    {"CargoDoor1Stat": 1,"CargoHeatPad1Stat": 1,"DeliveryStatusCargo1": 1,"LightCargoStat": 1,"MsgCntr": 9,"tripCargoDoorOnePinRcvd": 230 }
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CargoDoor1Stat": "Moving","CargoHeatPad1Stat": "ON","DeliveryStatusCargo1": "Delivery In Progress","LightCargoStat": "ON","MsgCntr": 9,"tripCargoDoorOnePinRcvd": 230}
    Validate TX Message With Expected Values    mVehCargoStat1    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
	${xcp_values}=    Evaluate    {"CargoDoor1Stat": 2,"CargoHeatPad1Stat": 2,"DeliveryStatusCargo1": 3,"LightCargoStat": 8,"MsgCntr": 14,"tripCargoDoorOnePinRcvd": 1020 }
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CargoDoor1Stat": "Open","CargoHeatPad1Stat": "Fault","DeliveryStatusCargo1": "Delivery Successful","LightCargoStat": " Open Load","MsgCntr": 14,"tripCargoDoorOnePinRcvd": 1020}
    Validate TX Message With Expected Values    mVehCargoStat1    ${expected_can_signals}    30
	
	

TC-TX-0X122: Send Tx XCP variables and validating on CAN signals for message mVehFdbkTO
    [Documentation]    Validate TX message 'mVehFdbkTO' by writing XCP variables and reading CAN signals

	Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"EstopDetected": 0,"MsgCntr": 2,"MsgCrc": 10,"TO_Steer_Fdbk": -1,"VCU_dlg_msg_rq": 0}
	${xcp_var_map}=    Evaluate    {"EstopDetected": "Rte_C_SG_mVehFdbkTO_adt_22F929EFC5E02D76AA2C728B4BA1C57E.EstopDetected", "MsgCntr": "Rte_C_SG_mVehFdbkTO_adt_22F929EFC5E02D76AA2C728B4BA1C57E.MsgCntr", "MsgCrc": "Rte_C_SG_mVehFdbkTO_adt_22F929EFC5E02D76AA2C728B4BA1C57E.MsgCrc", "TO_Steer_Fdbk": "Rte_C_SG_mVehFdbkTO_adt_22F929EFC5E02D76AA2C728B4BA1C57E.TO_Steer_Fdbk","VCU_dlg_msg_rq": "Rte_C_SG_mVehFdbkTO_adt_22F929EFC5E02D76AA2C728B4BA1C57E.VCU_dlg_msg_rq"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EstopDetected": 0,"MsgCntr": 2,"MsgCrc": 10,"TO_Steer_Fdbk": -1,"VCU_dlg_msg_rq": "No_Popup"}
    Validate TX Message With Expected Values    mVehFdbkTO    ${expected_can_signals}    30


    Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"EstopDetected": 0,"MsgCntr": 9,"MsgCrc": 99,"TO_Steer_Fdbk":0.5,"VCU_dlg_msg_rq": 6}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EstopDetected": 0,"MsgCntr": 9,"MsgCrc": 99,"TO_Steer_Fdbk": 0.5,"VCU_dlg_msg_rq": "ControlRq_AD"}
    Validate TX Message With Expected Values    mVehFdbkTO    ${expected_can_signals}    30
	
	
	Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"EstopDetected": 1,"MsgCntr": 15,"MsgCrc": 250,"TO_Steer_Fdbk": 1,"VCU_dlg_msg_rq": 6}
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EstopDetected": 1,"MsgCntr": 15,"MsgCrc": 250,"TO_Steer_Fdbk": 1,"VCU_dlg_msg_rq": "reserved"}
    Validate TX Message With Expected Values    mVehFdbkTO    ${expected_can_signals}    30
	

TC-TC-0X1CFFBACCX: Send Tx XCP variables and validating on CAN signals for message mVcuVehID
    [Documentation]    Validate TX message 'mVcuVehID' by writing XCP variables and reading CAN signals

	Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"VehId_Char1": 65,"VehId_Char2": 97,"VehId_Char3": 65,"VehId_Char4": 97,"VehId_Char5": 65, "VehId_Char6": 97, "VehId_Char7": 65, "VehId_Char8": 97}
	${xcp_var_map}=    Evaluate    {"VehId_Char1": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char1", "VehId_Char2": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char2", "VehId_Char3": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char3", "VehId_Char4": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char4","VehId_Char5": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char5", "VehId_Char6": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char6", "VehId_Char7": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char7", "VehId_Char8": "Rte_C_SG_mVcuVehID_adt_7DA42239F7CD85E78CF29B16247450A3.VehId_Char8",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehId_Char1": 65,"VehId_Char2": 97,"VehId_Char3": 65,"VehId_Char4": 97,"VehId_Char5": 65, "VehId_Char6": 97, "VehId_Char7": 65, "VehId_Char8": 97}
    Validate TX Message With Expected Values    mVcuVehID    ${expected_can_signals}    30
	
    Log  writing mid value to the xcp variables
	${xcp_values}=    Evaluate    {"VehId_Char1": 74,"VehId_Char2": 103,"VehId_Char3": 74,"VehId_Char4": 103,"VehId_Char5": 74, "VehId_Char6": 103, "VehId_Char7": 74, "VehId_Char8": 103}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehId_Char1": 74,"VehId_Char2": 103,"VehId_Char3": 74,"VehId_Char4": 103,"VehId_Char5": 74, "VehId_Char6": 103, "VehId_Char7": 74, "VehId_Char8": 103}
    Validate TX Message With Expected Values    mVcuVehID    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
	${xcp_values}=    Evaluate    {"VehId_Char1": 80,"VehId_Char2": 111,"VehId_Char3": 80,"VehId_Char4": 111,"VehId_Char5": 80, "VehId_Char6": 111, "VehId_Char7": 80, "VehId_Char8": 111}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehId_Char1": 80,"VehId_Char2": 111,"VehId_Char3": 80,"VehId_Char4": 111,"VehId_Char5": 80, "VehId_Char6": 111, "VehId_Char7": 80, "VehId_Char8": 111}
    Validate TX Message With Expected Values    mVcuVehID    ${expected_can_signals}    30		
	

TC-TX-0X613: Send Tx XCP variables and validating on CAN signals for message mAdcuStat
    [Documentation]    Validate TX message 'mAdcuStat' by writing XCP variables and reading CAN signals

	Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"AD_Mission_Cmplt": 0,"AD_Ready": 0,"AdcuEstopRq": 0,"AdcuShtdwnRdy": 0,"AdcuStatus": 1, "MsgCntr": 3, "MsgCrc": 11, "TO_Assistance_Rq": 0}
	${xcp_var_map}=    Evaluate    {"AD_Mission_Cmplt": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AD_Mission_Cmplt", "AD_Ready": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AD_Ready", "AdcuEstopRq": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AdcuEstopRq", "AdcuShtdwnRdy": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AdcuShtdwnRdy","AdcuStatus": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.AdcuStatus", "MsgCntr": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.MsgCntr", "MsgCrc": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.MsgCrc", "TO_Assistance_Rq": "Rte_C_SG_mAdcuStat_adt_53CE4826C9EB456D18C4EB1938074675.TO_Assistance_Rq",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AD_Mission_Cmplt": 0,"AD_Ready": 0,"AdcuEstopRq": 0,"AdcuShtdwnRdy": 0,"AdcuStatus": "Init", "MsgCntr": 3, "MsgCrc": 11, "TO_Assistance_Rq": "No_Request"}
    Validate TX Message With Expected Values    mAdcuStat    ${expected_can_signals}    30
	
    Log  writing mid value to the xcp variables
	${xcp_values}=    Evaluate    {"AD_Mission_Cmplt": 0,"AD_Ready": 0,"AdcuEstopRq": 0,"AdcuShtdwnRdy": 0,"AdcuStatus": 2, "MsgCntr": 10, "MsgCrc": 99, "TO_Assistance_Rq": 1}	
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AD_Mission_Cmplt": 0,"AD_Ready": 0,"AdcuEstopRq": 0,"AdcuShtdwnRdy": 0,"AdcuStatus": "Ok", "MsgCntr": 10, "MsgCrc": 99, "TO_Assistance_Rq": " Go_No_Go"}
    Validate TX Message With Expected Values    mAdcuStat    ${expected_can_signals}    30
	
	Log  writing max value to the xcp variables
	${xcp_values}=    Evaluate    {"AD_Mission_Cmplt": 0,"AD_Ready": 0,"AdcuEstopRq": 0,"AdcuShtdwnRdy": 0,"AdcuStatus": 3, "MsgCntr": 14, "MsgCrc": 251, "TO_Assistance_Rq": 2}	
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AD_Mission_Cmplt": 0,"AD_Ready": 0,"AdcuEstopRq": 0,"AdcuShtdwnRdy": 0,"AdcuStatus": "Error", "MsgCntr": 14, "MsgCrc": 251, "TO_Assistance_Rq": "Remote_Control"}
    Validate TX Message With Expected Values    mAdcuStat    ${expected_can_signals}    30
	

TC-TC-0X204: Send Tx XCP variables and validating on CAN signals for message mVcuFaults
    [Documentation]    Validate TX message 'mVcuFaults' by writing XCP variables and reading CAN signals

	Log  writing min value to the xcp variables
	${xcp_values}=    Evaluate    {"Flt_12Volt": 0,"Flt_12vSys": 0,"Flt_48Volt": 0,"Flt_Bay1BeltSns": 0,"Flt_Bay1Mtr": 0,"Flt_Bay1MtrPos": 0,"Flt_Bay1Pwr12v": 0,"Flt_Bay2BeltSns": 0,"Flt_Bay2Mtr": 0,"Flt_Bay2MtrPos": 0,"Flt_Bay2Pwr12v": 0,"Flt_BrkPrsr": 0,"Flt_BrkSafeSys": 0,"Flt_CntctrStat": 0,"Flt_DcdcEnbl": 0,"Flt_EpbSys": 0,"Flt_ImuRst": 0,"Flt_ImuSns": 0,"Flt_InvalidGearRq": 0,"Flt_Keypad4": 0,"Flt_KeypadC": 0,"Flt_KeypadLight": 0,"Flt_LocAdcu": 0,"Flt_LocAVAS": 0,"Flt_LocBe": 0,"Flt_LocEbcm1": 0,"Flt_LocEbcm2": 0,"Flt_LocEpb": 0,"Flt_LocEss": 0,"Flt_LocFcmCan": 0,"Flt_LocLrr": 0,"Flt_LocSbw": 0,"Flt_LocTc": 0,"Flt_LocTo": 0,"Flt_LocVsc": 0,"Flt_LocWhd": 0,"Flt_MstrSwitch": 0,"Flt_ReadEeprom": 0,"Flt_SafeCircuit": 0,"Flt_SafeExtLight": 0,"Flt_SafeProp": 0,"Flt_SafeSteer": 0,"Flt_SbwEnbl": 0,"Flt_WhdEnbl": 0,"Flt_WriteEeprom": 0}
	${xcp_var_map}=    Evaluate    {"Flt_12Volt": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_12Volt", "Flt_12vSys": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_12vSys", "Flt_48Volt": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_48Volt", "Flt_Bay1BeltSns": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1BeltSns", "Flt_Bay1Mtr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1Mtr", "Flt_Bay1MtrPos": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1MtrPos", "Flt_Bay1Pwr12v": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay1Pwr12v", "Flt_Bay2BeltSns": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2BeltSns", "Flt_Bay2Mtr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2Mtr", "Flt_Bay2MtrPos": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2MtrPos", "Flt_Bay2Pwr12v": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Bay2Pwr12v", "Flt_BrkPrsr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_BrkPrsr", "Flt_BrkSafeSys": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_BrkSafeSys", "Flt_CntctrStat": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_CntctrStat", "Flt_DcdcEnbl": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_DcdcEnbl", "Flt_EpbSys": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_EpbSys", "Flt_ImuRst": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_ImuRst", "Flt_ImuSns": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_ImuSns", "Flt_InvalidGearRq": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_InvalidGearRq", "Flt_Keypad4": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_Keypad4", "Flt_KeypadC": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_KeypadC", "Flt_KeypadLight": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_KeypadLight", "Flt_LocAdcu": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocAdcu", "Flt_LocAVAS": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocAVAS", "Flt_LocBe": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocBe", "Flt_LocEbcm1": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEbcm1", "Flt_LocEbcm2": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEbcm2", "Flt_LocEpb": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEpb", "Flt_LocEss": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocEss", "Flt_LocFcmCan": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocFcmCan", "Flt_LocLrr": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocLrr", "Flt_LocSbw": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocSbw", "Flt_LocTc": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocTc", "Flt_LocTo": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocTo", "Flt_LocVsc": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocVsc", "Flt_LocWhd": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_LocWhd", "Flt_MstrSwitch": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_MstrSwitch", "Flt_ReadEeprom": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_ReadEeprom", "Flt_SafeCircuit": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeCircuit", "Flt_SafeExtLight": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeExtLight", "Flt_SafeProp": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeProp", "Flt_SafeSteer": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SafeSteer","Flt_SbwEnbl": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_SbwEnbl", "Flt_WhdEnbl": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_WhdEnbl", "Flt_WriteEeprom": "Rte_C_SG_mVcuFaults_adt_60ADFA18B5BCEFCF7478C0AEED916E2D.Flt_WriteEeprom"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Flt_12Volt": "Ok","Flt_12vSys": "OK","Flt_48Volt": "Ok","Flt_Bay1BeltSns": "Ok","Flt_Bay1Mtr": "Ok","Flt_Bay1MtrPos": "Ok","Flt_Bay1Pwr12v": "Ok","Flt_Bay2BeltSns": "Ok","Flt_Bay2Mtr": "Ok","Flt_Bay2MtrPos": "Ok","Flt_Bay2Pwr12v": "Ok","Flt_BrkPrsr": "Ok","Flt_BrkSafeSys": "Ok","Flt_CntctrStat": "Ok","Flt_DcdcEnbl": "Ok","Flt_EpbSys": "Ok","Flt_ImuRst": "Ok","Flt_ImuSns": "Ok","Flt_InvalidGearRq": "Ok","Flt_Keypad4": "Ok","Flt_KeypadC": "Ok","Flt_KeypadLight": "Ok","Flt_LocAdcu": 0,"Flt_LocAVAS": "Ok","Flt_LocBe": "Ok","Flt_LocEbcm1": "Ok","Flt_LocEbcm2": "Ok","Flt_LocEpb": "Ok","Flt_LocEss": "Ok","Flt_LocFcmCan": "Ok","Flt_LocLrr": "Ok","Flt_LocSbw": "Ok","Flt_LocTc": "Ok","Flt_LocTo": "Ok","Flt_LocVsc": "Ok","Flt_LocWhd": "Ok","Flt_MstrSwitch": "Ok","Flt_ReadEeprom": "Ok","Flt_SafeCircuit": "Ok","Flt_SafeExtLight": "Ok","Flt_SafeProp": "Ok","Flt_SafeSteer": "Ok","Flt_SbwEnbl": "Ok","Flt_WhdEnbl": "Ok","Flt_WriteEeprom": "Ok"}
    Validate TX Message With Expected Values    mVcuFaults    ${expected_can_signals}    30
	
	
    Log  writing mid value to the xcp variables
	${xcp_values}=    Evaluate    {"Flt_12Volt": 1,"Flt_12vSys": 0,"Flt_48Volt": 1,"Flt_Bay1BeltSns": 0,"Flt_Bay1Mtr": 0,"Flt_Bay1MtrPos": 0,"Flt_Bay1Pwr12v": 0,"Flt_Bay2BeltSns": 0,"Flt_Bay2Mtr": 0,"Flt_Bay2MtrPos": 0,"Flt_Bay2Pwr12v": 0,"Flt_BrkPrsr": 0,"Flt_BrkSafeSys": 0,"Flt_CntctrStat": 1,"Flt_DcdcEnbl": 0,"Flt_EpbSys": 0,"Flt_ImuRst": 0,"Flt_ImuSns": 0,"Flt_InvalidGearRq": 0,"Flt_Keypad4": 0,"Flt_KeypadC": 0,"Flt_KeypadLight": 0,"Flt_LocAdcu": 2,"Flt_LocAVAS": 1,"Flt_LocBe": 1,"Flt_LocEbcm1": 1,"Flt_LocEbcm2": 1,"Flt_LocEpb": 1,"Flt_LocEss": 1,"Flt_LocFcmCan": 0,"Flt_LocLrr": 0,"Flt_LocSbw": 1,"Flt_LocTc": 1,"Flt_LocTo": 1,"Flt_LocVsc": 1,"Flt_LocWhd": 1,"Flt_MstrSwitch": 0,"Flt_ReadEeprom": 0,"Flt_SafeCircuit": 0,"Flt_SafeExtLight": 0,"Flt_SafeProp": 1,"Flt_SafeSteer": 1,"Flt_SbwEnbl": 0,"Flt_WhdEnbl": 0,"Flt_WriteEeprom": 0}	
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Flt_12Volt": "High","Flt_12vSys": "OK","Flt_48Volt": "High","Flt_Bay1BeltSns": "Ok","Flt_Bay1Mtr": "Ok","Flt_Bay1MtrPos": "Ok","Flt_Bay1Pwr12v": "Ok","Flt_Bay2BeltSns": "Ok","Flt_Bay2Mtr": "Ok","Flt_Bay2MtrPos": "Ok","Flt_Bay2Pwr12v": "Ok","Flt_BrkPrsr": "Ok","Flt_BrkSafeSys": "Ok","Flt_CntctrStat": "Stuck Open","Flt_DcdcEnbl": "Ok","Flt_EpbSys": "Ok","Flt_ImuRst": "Ok","Flt_ImuSns": "Ok","Flt_InvalidGearRq": "Ok","Flt_Keypad4": "Ok","Flt_KeypadC": "Ok","Flt_KeypadLight": "Ok","Flt_LocAdcu": 2,"Flt_LocAVAS": "Active","Flt_LocBe": "Active","Flt_LocEbcm1": "Active","Flt_LocEbcm2": "Active","Flt_LocEpb": "Active","Flt_LocEss": "Active","Flt_LocFcmCan": "OK","Flt_LocLrr": "Ok","Flt_LocSbw": "Active","Flt_LocTc": "Active","Flt_LocTo": "Active","Flt_LocVsc": "Active","Flt_LocWhd": "Active","Flt_MstrSwitch": "Ok","Flt_ReadEeprom": "Ok","Flt_SafeCircuit": "Ok","Flt_SafeExtLight": "Ok","Flt_SafeProp": "Command","Flt_SafeSteer": "Command","Flt_SbwEnbl": "Ok","Flt_WhdEnbl": "Ok","Flt_WriteEeprom": "Ok"}
    Validate TX Message With Expected Values    mVcuFaults    ${expected_can_signals}    30


    Log  writing max value to the xcp variables
	${xcp_values}=    Evaluate    {"Flt_12Volt": 1,"Flt_12vSys": 0,"Flt_48Volt": 1,"Flt_Bay1BeltSns": 0,"Flt_Bay1Mtr": 0,"Flt_Bay1MtrPos": 0,"Flt_Bay1Pwr12v": 0,"Flt_Bay2BeltSns": 0,"Flt_Bay2Mtr": 0,"Flt_Bay2MtrPos": 0,"Flt_Bay2Pwr12v": 0,"Flt_BrkPrsr": 0,"Flt_BrkSafeSys": 0,"Flt_CntctrStat": 1,"Flt_DcdcEnbl": 0,"Flt_EpbSys": 0,"Flt_ImuRst": 0,"Flt_ImuSns": 0,"Flt_InvalidGearRq": 0,"Flt_Keypad4": 0,"Flt_KeypadC": 0,"Flt_KeypadLight": 0,"Flt_LocAdcu": 2,"Flt_LocAVAS": 1,"Flt_LocBe": 1,"Flt_LocEbcm1": 1,"Flt_LocEbcm2": 1,"Flt_LocEpb": 1,"Flt_LocEss": 1,"Flt_LocFcmCan": 0,"Flt_LocLrr": 0,"Flt_LocSbw": 1,"Flt_LocTc": 1,"Flt_LocTo": 1,"Flt_LocVsc": 1,"Flt_LocWhd": 1,"Flt_MstrSwitch": 0,"Flt_ReadEeprom": 0,"Flt_SafeCircuit": 0,"Flt_SafeExtLight": 0,"Flt_SafeProp": 1,"Flt_SafeSteer": 1,"Flt_SbwEnbl": 0,"Flt_WhdEnbl": 0,"Flt_WriteEeprom": 0}	
	Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Flt_12Volt": "High","Flt_12vSys": "OK","Flt_48Volt": "High","Flt_Bay1BeltSns": "Ok","Flt_Bay1Mtr": "Ok","Flt_Bay1MtrPos": "Ok","Flt_Bay1Pwr12v": "Ok","Flt_Bay2BeltSns": "Ok","Flt_Bay2Mtr": "Ok","Flt_Bay2MtrPos": "Ok","Flt_Bay2Pwr12v": "Ok","Flt_BrkPrsr": "Ok","Flt_BrkSafeSys": "Ok","Flt_CntctrStat": "Stuck Open","Flt_DcdcEnbl": "Ok","Flt_EpbSys": "Ok","Flt_ImuRst": "Ok","Flt_ImuSns": "Ok","Flt_InvalidGearRq": "Ok","Flt_Keypad4": "Ok","Flt_KeypadC": "Ok","Flt_KeypadLight": "Ok","Flt_LocAdcu": 2,"Flt_LocAVAS": "Active","Flt_LocBe": "Active","Flt_LocEbcm1": "Active","Flt_LocEbcm2": "Active","Flt_LocEpb": "Active","Flt_LocEss": "Active","Flt_LocFcmCan": "OK","Flt_LocLrr": "Ok","Flt_LocSbw": "Active","Flt_LocTc": "Active","Flt_LocTo": "Active","Flt_LocVsc": "Active","Flt_LocWhd": "Active","Flt_MstrSwitch": "Ok","Flt_ReadEeprom": "Ok","Flt_SafeCircuit": "Ok","Flt_SafeExtLight": "Ok","Flt_SafeProp": "Command","Flt_SafeSteer": "Command","Flt_SbwEnbl": "Ok","Flt_WhdEnbl": "Ok","Flt_WriteEeprom": "Ok"}
    Validate TX Message With Expected Values    mVcuFaults    ${expected_can_signals}    30
































	
	
	
