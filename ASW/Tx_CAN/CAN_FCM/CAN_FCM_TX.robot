*** Settings ***
Library    ../can_tx_validation_interface.py
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
TC-Send Tx XCP variables and validating on CAN signals for message TBOX_0x178
    [Documentation]    Validate TX message 'TBOX_0x178' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_178_AliveCounter": 0, "TBOX_178_CheckSum": 0, "TBOX_Roll": 0, "TBOX_RollStdDev": 0}
    ${xcp_var_map}=    Evaluate    {"TBOX_178_AliveCounter": "Rte_C_SG_TBOX_0x178_adt_674B821ABA64C143D2E5DF282A3B0FBE.TBOX_178_AliveCounter", "TBOX_178_CheckSum": "Rte_C_SG_TBOX_0x178_adt_674B821ABA64C143D2E5DF282A3B0FBE.TBOX_178_CheckSum", "TBOX_Roll": "Rte_C_SG_TBOX_0x178_adt_674B821ABA64C143D2E5DF282A3B0FBE.TBOX_Roll", "TBOX_RollStdDev": "Rte_C_SG_TBOX_0x178_adt_674B821ABA64C143D2E5DF282A3B0FBE.TBOX_RollStdDev"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_178_AliveCounter": 0, "TBOX_178_CheckSum": 0, "TBOX_Roll": 0, "TBOX_RollStdDev": 0}
    Validate TX Message With Expected Values    TBOX_0x178    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_178_AliveCounter": 11, "TBOX_178_CheckSum": 110., "TBOX_Roll": 100.25, "TBOX_RollStdDev": 150.35}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_178_AliveCounter": 11, "TBOX_178_CheckSum": 110, "TBOX_Roll": 100.25, "TBOX_RollStdDev": 150.35}
    Validate TX Message With Expected Values    TBOX_0x178    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_178_AliveCounter": 14, "TBOX_178_CheckSum": 255, "TBOX_Roll": 360, "TBOX_RollStdDev": 179.9}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_178_AliveCounter": 14, "TBOX_178_CheckSum": 255, "TBOX_Roll": 360, "TBOX_RollStdDev": 179.9}
    Validate TX Message With Expected Values    TBOX_0x178    ${expected_can_signals}    30


TC-TX-Ox179: Send Tx XCP variables and validating on CAN signals for message TBOX_0x179
    [Documentation]    Validate TX message 'TBOX_0x179' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_179_AliveCounter": 0, "TBOX_179_CheckSum": 0, "TBOX_Heading": 0, "TBOX_HeadingStdDev": 0}
    ${xcp_var_map}=    Evaluate    {"TBOX_179_AliveCounter": "Rte_C_SG_TBOX_0x179_adt_01E34BFBF5A27FF853FE05DBFB5BF815.TBOX_179_AliveCounter", "TBOX_179_CheckSum": "Rte_C_SG_TBOX_0x179_adt_01E34BFBF5A27FF853FE05DBFB5BF815.TBOX_179_CheckSum", "TBOX_Heading": "Rte_C_SG_TBOX_0x179_adt_01E34BFBF5A27FF853FE05DBFB5BF815.TBOX_Heading", "TBOX_RollStdDev": "Rte_C_SG_TBOX_0x179_adt_01E34BFBF5A27FF853FE05DBFB5BF815.TBOX_HeadingStdDev"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_179_AliveCounter": 0, "TBOX_179_CheckSum": 0, "TBOX_Heading": 0, "TBOX_HeadingStdDev": 0}
    Validate TX Message With Expected Values    TBOX_0x179    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_179_AliveCounter": 11, "TBOX_179_CheckSum": 110., "TBOX_Heading": 100.25, "TBOX_HeadingStdDev": 120.25}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_179_AliveCounter": 11, "TBOX_179_CheckSum": 110, "TBOX_Heading": 100.25, "TBOX_HeadingStdDev": 150.35}
    Validate TX Message With Expected Values    TBOX_0x179    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_179_AliveCounter": 14, "TBOX_179_CheckSum": 255, "TBOX_Heading": 359.9, "TBOX_HeadingStdDev": 179.9}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_179_AliveCounter": 14, "TBOX_179_CheckSum": 255, "TBOX_Heading": 359.9, "TBOX_HeadingStdDev": 179.9}
    Validate TX Message With Expected Values    TBOX_0x179    ${expected_can_signals}    30


Send Tx XCP variables and validating on CAN signals for message TBOX_0x4F4
    [Documentation]    Validate TX message 'TBOX_0x4F4' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 0, "TBOX_4F4_4F8_AliveCounter": 0, "TBOX_Sw_upd": 0, "TBOX_Flsflg": 0, "TBOX_RemFlsh": 0, "TBOX_FobdGWPartBUSUDSCom": 0, "TBOX_RemChrgInsulFctReq": 0, "TBOX_EHUSetTrvlMod": 0, "TBOX_ResvACChrgOpenSts": 0, "TBOX_RemKL15PwrOnReq": 0, "TBOX_SetChrgEndSOC": 0, "TBOX_PreCondTriggerReq": 0, "TBOX_BlowLvlReq": 0, "TBOX_ICC_UpdStrt": 0, "TBOX_VehiMod": 1, "TBOX_Crash_cfm": 0, "TBOX_SchedChrgnReq": 0, "TBOX_4F4_SSecOC_Fresh_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte1": 0, "TBOX_4F4_SSecOC_MAC_Byte2": 0}
    ${xcp_var_map}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_4F4_4F8_CheckSum", "TBOX_4F4_4F8_AliveCounter": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_4F4_4F8_AliveCounter", "TBOX_Sw_upd": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_Sw_upd", "TBOX_Flsflg": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_Flsflg","TBOX_RemFlsh": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_RemFlsh", "TBOX_FobdGWPartBUSUDSCom": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_FobdGWPartBUSUDSCom", "TBOX_RemChrgInsulFctReq": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_RemChrgInsulFctReq", "TBOX_EHUSetTrvlMod": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_EHUSetTrvlMod", "TBOX_ResvACChrgOpenSts": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_ResvACChrgOpenSts", "TBOX_RemKL15PwrOnReq": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_RemKL15PwrOnReq", "TBOX_SetChrgEndSOC": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_SetChrgEndSOC", "TBOX_PreCondTriggerReq": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_PreCondTriggerReq", "TBOX_BlowLvlReq": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_BlowLvlReq", "TBOX_ICC_UpdStrt": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_ICC_UpdStrt", "TBOX_VehiMod": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_VehiMod", "TBOX_Crash_cfm": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_Crash_cfm", "TBOX_SchedChrgnReq": "Rte_C_SG_TBOX_0x4F4_adt_54F8F0935AB8F1F747E6851CD8A55822.TBOX_SchedChrgnReq", "TBOX_4F4_SSecOC_Fresh_Byte0": "", "TBOX_4F4_SSecOC_MAC_Byte0": " ", "TBOX_4F4_SSecOC_MAC_Byte1": " ", "TBOX_4F4_SSecOC_MAC_Byte2": " "}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 0, "TBOX_4F4_4F8_AliveCounter": 0, "TBOX_Sw_upd": "Initial", "TBOX_Flsflg": "Initial_Value", "TBOX_RemFlsh": "Without_Request", "TBOX_FobdGWPartBUSUDSCom": "Initial_Value", "TBOX_RemChrgInsulFctReq": "No_Action", "TBOX_EHUSetTrvlMod": "Initial_Value", "TBOX_ResvACChrgOpenSts": "Initial_value", "TBOX_RemKL15PwrOnReq": "Init_value", "TBOX_SetChrgEndSOC": 0, "TBOX_PreCondTriggerReq": "no_trigger", "TBOX_BlowLvlReq": "off", "TBOX_ICC_UpdStrt": "Initial_Value", "TBOX_VehiMod": "Default_Mode", "TBOX_Crash_cfm": "No_Crash"", "TBOX_SchedChrgnReq": "Scheduled_Charging_Req_Inactive", "TBOX_4F4_SSecOC_Fresh_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte1": 0, "TBOX_4F4_SSecOC_MAC_Byte2": 0}
    Validate TX Message With Expected Values    TBOX_0x4F4    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 110, "TBOX_4F4_4F8_AliveCounter": 11, "TBOX_Sw_upd": 1, "TBOX_Flsflg": 1, "TBOX_RemFlsh": 1, "TBOX_FobdGWPartBUSUDSCom": 1, "TBOX_RemChrgInsulFctReq": 1, "TBOX_EHUSetTrvlMod": 1, "TBOX_ResvACChrgOpenSts": 1, "TBOX_RemKL15PwrOnReq": 1, "TBOX_SetChrgEndSOC": 55, "TBOX_PreCondTriggerReq": 1, "TBOX_BlowLvlReq": 1, "TBOX_ICC_UpdStrt": 1, "TBOX_VehiMod": 2, "TBOX_Crash_cfm": 1, "TBOX_SchedChrgnReq": 1, "TBOX_4F4_SSecOC_Fresh_Byte0": 110, "TBOX_4F4_SSecOC_MAC_Byte0": 110, "TBOX_4F4_SSecOC_MAC_Byte1": 110, "TBOX_4F4_SSecOC_MAC_Byte2": 110}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 110, "TBOX_4F4_4F8_AliveCounter": 11, "TBOX_Sw_upd": "Flashing", "TBOX_Flsflg": "HV_Flash_Mode", "TBOX_RemFlsh": "RemFlash_Req_Active", "TBOX_FobdGWPartBUSUDSCom": "Not_Allowed", "TBOX_RemChrgInsulFctReq": "On", "TBOX_EHUSetTrvlMod": "Daily_commuter_mode", "TBOX_ResvACChrgOpenSts": "On", "TBOX_RemKL15PwrOnReq": "Request", "TBOX_SetChrgEndSOC": 55, "TBOX_PreCondTriggerReq": "Start_Precond_Battery", "TBOX_BlowLvlReq": "Step1", "TBOX_ICC_UpdStrt": "With_Request", "TBOX_VehiMod": "Pet_mode", "TBOX_Crash_cfm": "Crash_Happened", "TBOX_SchedChrgnReq": "Scheduled_Charging_Req_Active", "TBOX_4F4_SSecOC_Fresh_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte1": 0, "TBOX_4F4_SSecOC_MAC_Byte2": 0}
    Validate TX Message With Expected Values    TBOX_0x4F4    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 110, "TBOX_4F4_4F8_AliveCounter": 11, "TBOX_Sw_upd": 1, "TBOX_Flsflg": 2, "TBOX_RemFlsh": 1, "TBOX_FobdGWPartBUSUDSCom": 2, "TBOX_RemChrgInsulFctReq": 1, "TBOX_EHUSetTrvlMod": 1, "TBOX_ResvACChrgOpenSts": 1, "TBOX_RemKL15PwrOnReq": 1, "TBOX_SetChrgEndSOC": 55, "TBOX_PreCondTriggerReq": 1, "TBOX_BlowLvlReq": 2, "TBOX_ICC_UpdStrt": 1, "TBOX_VehiMod": 5, "TBOX_Crash_cfm": 2, "TBOX_SchedChrgnReq": 1, "TBOX_4F4_SSecOC_Fresh_Byte0": 110, "TBOX_4F4_SSecOC_MAC_Byte0": 110, "TBOX_4F4_SSecOC_MAC_Byte1": 110, "TBOX_4F4_SSecOC_MAC_Byte2": 110}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 110, "TBOX_4F4_4F8_AliveCounter": 11, "TBOX_Sw_upd": "Flashing", "TBOX_Flsflg": "LV_Flash_Mode", "TBOX_RemFlsh": "RemFlash_Req_Active", "TBOX_FobdGWPartBUSUDSCom": "Recovery", "TBOX_RemChrgInsulFctReq": "On", "TBOX_EHUSetTrvlMod": "Daily_commuter_mode", "TBOX_ResvACChrgOpenSts": "On", "TBOX_RemKL15PwrOnReq": "Request", "TBOX_SetChrgEndSOC": 55, "TBOX_PreCondTriggerReq": "Start_Precond_Battery", "TBOX_BlowLvlReq": "Step2", "TBOX_ICC_UpdStrt": "With_Request", "TBOX_VehiMod": Mode5, "TBOX_Crash_cfm": "Reserved", "TBOX_SchedChrgnReq": "Scheduled_Charging_Req_Active", "TBOX_4F4_SSecOC_Fresh_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte1": 0, "TBOX_4F4_SSecOC_MAC_Byte2": 0}
    Validate TX Message With Expected Values    TBOX_0x4F4    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 255, "TBOX_4F4_4F8_AliveCounter": 14, "TBOX_Sw_upd": 2, "TBOX_Flsflg": 7, "TBOX_RemFlsh": 7, "TBOX_FobdGWPartBUSUDSCom": 7, "TBOX_RemChrgInsulFctReq": 2, "TBOX_EHUSetTrvlMod": 2, "TBOX_ResvACChrgOpenSts": 2, "TBOX_RemKL15PwrOnReq": 3, "TBOX_SetChrgEndSOC": 100, "TBOX_PreCondTriggerReq": 4, "TBOX_BlowLvlReq": 3, "TBOX_ICC_UpdStrt": 2, "TBOX_VehiMod": 3, "TBOX_Crash_cfm": 3, "TBOX_SchedChrgnReq": 3, "TBOX_4F4_SSecOC_Fresh_Byte0": 255, "TBOX_4F4_SSecOC_MAC_Byte0": 255, "TBOX_4F4_SSecOC_MAC_Byte1": 255, "TBOX_4F4_SSecOC_MAC_Byte2": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_4F4_4F8_CheckSum": 255, "TBOX_4F4_4F8_AliveCounter": 14, "TBOX_Sw_upd": "Coding", "TBOX_Flsflg": "Invalid", "TBOX_RemFlsh": "Invalid", "TBOX_FobdGWPartBUSUDSCom": "Void", "TBOX_RemChrgInsulFctReq": "Off", "TBOX_EHUSetTrvlMod": "Long_distance_travel_mode", "TBOX_ResvACChrgOpenSts": "Off", "TBOX_RemKL15PwrOnReq": "Invalid", "TBOX_SetChrgEndSOC": 100, "TBOX_PreCondTriggerReq": "Start_Precond", "TBOX_BlowLvlReq": "Step3", "TBOX_ICC_UpdStrt": "Reserved", "TBOX_VehiMod": "Camping_mode", "TBOX_Crash_cfm": "Invalid", "TBOX_SchedChrgnReq": "Invalid", "TBOX_4F4_SSecOC_Fresh_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte0": 0, "TBOX_4F4_SSecOC_MAC_Byte1": 0, "TBOX_4F4_SSecOC_MAC_Byte2": 0}
    Validate TX Message With Expected Values    TBOX_0x4F4    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message TBOX_0x5C4
    [Documentation]    Validate TX message 'TBOX_0x5C4' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_OTA_ownCondchk" : 0, "TBOX_TerminalRemWakeupSig" : 0, "TBOX_RemSCModReq" : 0, "TBOX_RemPwrBattOpenHeatgReq" : 0, "TBOX_RemPwrBattResvHeatgReq" : 0, "TBOX_RemInsdInfoDispEna" : 0, "TBOX_RemECCDefrstModReq" : 0, "TBOX_RemECCResvDefrstReq" : 0,"TBOX_RemECCSetT" : 0, "TBOX_RemResvECCSetT" : 0, "TBOX_RemSOCMax" : 0, "TBOX_4GSigIND" : 0, "TBOX_Conn_Typ" : 0, "TBOX_TSPNotConn" : 0, "TBOX_EHUNotCONN" : 0, "TBOX_WIFIError" : 0, "TBOX_InnerBattError" : 0, "TBOX_VoltLow" : 0, "TBOX_VoltHigh" : 0, "TBOX_4GLoss" : 0, "TBOX_RemSWH_Req" : 0, "TBOX_OTAInhbReq" : 0}
    ${xcp_var_map}=    Evaluate    {"TBOX_OTA_ownCondchk"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_OTA_ownCondchk", "TBOX_TerminalRemWakeupSig"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_TerminalRemWakeupSig", "TBOX_RemSCModReq"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemSCModReq", "TBOX_RemPwrBattOpenHeatgReq"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemPwrBattOpenHeatgReq", "TBOX_RemPwrBattResvHeatgReq"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemPwrBattResvHeatgReq", "TBOX_RemInsdInfoDispEna"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemInsdInfoDispEna", "TBOX_RemECCDefrstModReq"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemECCDefrstModReq", "TBOX_RemECCResvDefrstReq"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemECCResvDefrstReq", "TBOX_RemECCSetT"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemECCSetT", "TBOX_RemResvECCSetT"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemResvECCSetT", "TBOX_RemSOCMax"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemSOCMax", "TBOX_4GSigIND"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_4GSigIND", "TBOX_Conn_Typ"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_Conn_Typ", "TBOX_TSPNotConn"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_TSPNotConn", "TBOX_EHUNotCONN"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_EHUNotCONN", "TBOX_WIFIError"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_WIFIError", "TBOX_InnerBattError"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_InnerBattError", "TBOX_VoltLow"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_VoltLow", "TBOX_VoltHigh"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_VoltHigh", "TBOX_4GLoss"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_4GLoss", "TBOX_RemSWH_Req"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_RemSWH_Req", "TBOX_OTAInhbReq"  : "Rte_C_SG_TBOX_0x5C4_adt_6CDCB54A9F3AFEB76F753B3AAE5ECD3B.TBOX_OTAInhbReq"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_OTA_ownCondchk" : o, "TBOX_TerminalRemWakeupSig" : 0, "TBOX_RemSCModReq" : 0, "TBOX_RemPwrBattOpenHeatgReq" : 0, "TBOX_RemPwrBattResvHeatgReq" : 0, "TBOX_RemInsdInfoDispEna" : 0, "TBOX_RemECCDefrstModReq" : 0, "TBOX_RemECCResvDefrstReq" : 0, "TBOX_RemECCSetT" : 0, "TBOX_RemResvECCSetT" : 0, "TBOX_RemSOCMax" : 0, "TBOX_4GSigIND" : 0, "TBOX_Conn_Typ" : 0, "TBOX_TSPNotConn" : 0, "TBOX_EHUNotCONN" : 0, "TBOX_WIFIError" : 0, "TBOX_InnerBattError" : 0, "TBOX_VoltLow" : 0, "TBOX_VoltHigh" : 0, "TBOX_4GLoss" : 0, "TBOX_RemSWH_Req" : 0, "TBOX_OTAInhbReq" : 0}
    Validate TX Message With Expected Values    TBOX_0x5C4    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_OTA_ownCondchk" : 1, "TBOX_TerminalRemWakeupSig" : 0, "TBOX_RemSCModReq" : 1, "TBOX_RemPwrBattOpenHeatgReq" : 1, "TBOX_RemPwrBattResvHeatgReq" : 0, "TBOX_RemInsdInfoDispEna" : 0, "TBOX_RemECCDefrstModReq" : 1, "TBOX_RemECCResvDefrstReq" : 0, "TBOX_RemECCSetT" : 100, "TBOX_RemResvECCSetT" : 100, "TBOX_RemSOCMax" : 55, "TBOX_4GSigIND" : 1, "TBOX_Conn_Typ" : 1, "TBOX_TSPNotConn" : 0, "TBOX_EHUNotCONN" : 0, "TBOX_WIFIError" : 0, "TBOX_InnerBattError" : 0, "TBOX_VoltLow" : 0, "TBOX_VoltHigh" : 0, "TBOX_4GLoss" : 0, "TBOX_RemSWH_Req" : 1, "TBOX_OTAInhbReq" : 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_OTA_ownCondchk" : 1, "TBOX_TerminalRemWakeupSig" : 0, "TBOX_RemSCModReq" : 1, "TBOX_RemPwrBattOpenHeatgReq" : 1, "TBOX_RemPwrBattResvHeatgReq" : 0, "TBOX_RemInsdInfoDispEna" : 0, "TBOX_RemECCDefrstModReq" : 1, "TBOX_RemECCResvDefrstReq" : 0, "TBOX_RemECCSetT" : 100, "TBOX_RemResvECCSetT" : 100, "TBOX_RemSOCMax" : 55, "TBOX_4GSigIND" : 1, "TBOX_Conn_Typ" : 1, "TBOX_TSPNotConn" : 0, "TBOX_EHUNotCONN" : 0, "TBOX_WIFIError" : 0, "TBOX_InnerBattError" : 0, "TBOX_VoltLow" : 0, "TBOX_VoltHigh" : 0, "TBOX_4GLoss" : 0, "TBOX_RemSWH_Req" : 1, "TBOX_OTAInhbReq" : 1}
    Validate TX Message With Expected Values    TBOX_0x5C4    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_OTA_ownCondchk" : 3, "TBOX_TerminalRemWakeupSig" : 1, "TBOX_RemSCModReq" : 3, "TBOX_RemPwrBattOpenHeatgReq" : 3, "TBOX_RemPwrBattResvHeatgReq" : 1, "TBOX_RemInsdInfoDispEna" : 1, "TBOX_RemECCDefrstModReq" : 3, "TBOX_RemECCResvDefrstReq" : 1, "TBOX_RemECCSetT" : 127.5, "TBOX_RemResvECCSetT" : 127.5, "TBOX_RemSOCMax" : 100, "TBOX_4GSigIND" : 3, "TBOX_Conn_Typ" : 7, "TBOX_TSPNotConn" : 1, "TBOX_EHUNotCONN" : 1, "TBOX_WIFIError" : 1, "TBOX_InnerBattError" : 1, "TBOX_VoltLow" : 1, "TBOX_VoltHigh" : 1, "TBOX_4GLoss" : 1, "TBOX_RemSWH_Req" : 3, "TBOX_OTAInhbReq" : 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_OTA_ownCondchk" : 3, "TBOX_TerminalRemWakeupSig" : 1, "TBOX_RemSCModReq" : 3, "TBOX_RemPwrBattOpenHeatgReq" : 3, "TBOX_RemPwrBattResvHeatgReq" : 1, "TBOX_RemInsdInfoDispEna" : 1, "TBOX_RemECCDefrstModReq" : 3, "TBOX_RemECCResvDefrstReq" : 1, "TBOX_RemECCSetT" : 127.5, "TBOX_RemResvECCSetT" : 127.5, "TBOX_RemSOCMax" : 100, "TBOX_4GSigIND" : 3, "TBOX_Conn_Typ" : 7, "TBOX_TSPNotConn" : 1, "TBOX_EHUNotCONN" : 1, "TBOX_WIFIError" : 1, "TBOX_InnerBattError" : 1, "TBOX_VoltLow" : 1, "TBOX_VoltHigh" : 1, "TBOX_4GLoss" : 1, "TBOX_RemSWH_Req" : 3, "TBOX_OTAInhbReq" : 3}
    Validate TX Message With Expected Values    TBOX_0x5C4    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message TBOX_0x62F
    [Documentation]    Validate TX message 'TBOX_0x62F' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_ZoneT" : -720, "TBOX_CrtTi_Day" : 1, "TBOX_CrtTi_Hr" : 0, "TBOX_CrtTi_Mins" : 0, "TBOX_CrtTi_Yr" : 2015, "TBOX_CrtTi_Mth" : 1, "TBOX_CrtTi_Sec" : 0}
    ${xcp_var_map}=    Evaluate    {"TBOX_ZoneT" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_ZoneT", "TBOX_CrtTi_Day" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_CrtTi_Day", "TBOX_CrtTi_Hr" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_CrtTi_Hr", "TBOX_CrtTi_Mins" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_CrtTi_Mins", "TBOX_CrtTi_Yr" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_CrtTi_Yr", "TBOX_CrtTi_Mth" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_CrtTi_Mth", "TBOX_CrtTi_Sec" : "Rte_C_SG_TBOX_0x62F_adt_956FC804FA23B9191BD03861699682D9.TBOX_CrtTi_Sec"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_ZoneT" : -720, "TBOX_CrtTi_Day" : 1, "TBOX_CrtTi_Hr" : 0, "TBOX_CrtTi_Mins" : 0, "TBOX_CrtTi_Yr" : 2015, "TBOX_CrtTi_Mth" : 1, "TBOX_CrtTi_Sec" : 0}
    Validate TX Message With Expected Values    TBOX_0x62F    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_ZoneT" : 1000, "TBOX_CrtTi_Day" : 15, "TBOX_CrtTi_Hr" : 15, "TBOX_CrtTi_Mins" : 15, "TBOX_CrtTi_Yr" : 2000, "TBOX_CrtTi_Mth" : 10, "TBOX_CrtTi_Sec" : 15}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_ZoneT" : 1000, "TBOX_CrtTi_Day" : 15, "TBOX_CrtTi_Hr" : 15, "TBOX_CrtTi_Mins" : 15, "TBOX_CrtTi_Yr" : 2000, "TBOX_CrtTi_Mth" : 10, "TBOX_CrtTi_Sec" : 15}
    Validate TX Message With Expected Values    TBOX_0x62F    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_ZoneT" : 1185, "TBOX_CrtTi_Day" : 31, "TBOX_CrtTi_Hr" : 23, "TBOX_CrtTi_Mins" : 59, "TBOX_CrtTi_Yr" : 2270, "TBOX_CrtTi_Mth" : 12, "TBOX_CrtTi_Sec" : 59}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_ZoneT" : 1185, "TBOX_CrtTi_Day" : 31, "TBOX_CrtTi_Hr" : 23, "TBOX_CrtTi_Mins" : 59, "TBOX_CrtTi_Yr" : 2270, "TBOX_CrtTi_Mth" : 12, "TBOX_CrtTi_Sec" : 59}
    Validate TX Message With Expected Values    TBOX_0x62F    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VCU_0x214
    [Documentation]    Validate TX message 'VCU_0x214' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_214_234_CheckSum" : 0, "VCU_214_234_AliveCounter" : 0, "VCU_RdyLamp" : 0,"VCU_BrkLampCtrlSts" : 0, "VCU_RemWakeUpEndFlg" : 0, "VCU_StgyGearSig" : 0, "VCU_ShiftMisoper" : 0, "VCU_GearSigVld" : 0, "VCU_GearSig" : 0, "VCU_ACCRdy" : 0, "VCU_ParkRdy" : 0, "VCU_APSPercVld" : 0, "VCU_VehSt" : 0, "VCU_APSPerc" : 0, "VCU_BrkSig" : 0, "VCU_BrkSigVld" : 0, "VCU_DrvModSigFb" : 0, "VCU_DrvModShiftMisoper" : 0, "VCU_SpclTerrainModEnaSig" : 0}
    ${xcp_var_map}=    Evaluate    {"VCU_214_234_CheckSum" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_214_234_CheckSum", "VCU_214_234_AliveCounter" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_214_234_AliveCounter", "VCU_RdyLamp" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_RdyLamp", "VCU_BrkLampCtrlSts" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_BrkLampCtrlSts", "VCU_RemWakeUpEndFlg" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_RemWakeUpEndFlg", "VCU_StgyGearSig" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_StgyGearSig", "VCU_ShiftMisoper" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_ShiftMisoper", "VCU_GearSigVld" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_GearSigVld", "VCU_GearSig" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_GearSig", "VCU_ACCRdy" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_ACCRdy", "VCU_ParkRdy" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_ParkRdy", "VCU_APSPercVld" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_APSPercVld", "VCU_VehSt" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_VehSt", "VCU_APSPerc" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_APSPerc", "VCU_BrkSig" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_BrkSig", "VCU_BrkSigVld" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_BrkSigVld", "VCU_DrvModSigFb" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_DrvModSigFb", "VCU_DrvModShiftMisoper" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_DrvModShiftMisoper", "VCU_SpclTerrainModEnaSig" : "Rte_C_SG_VCU_0x214_adt_B28F2E915E01743326C344F99B6572E4.VCU_SpclTerrainModEnaSig"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_214_234_CheckSum" : 0, "VCU_214_234_AliveCounter" : 0, "VCU_RdyLamp" : 0, "VCU_BrkLampCtrlSts" : 0, "VCU_RemWakeUpEndFlg" : 0, "VCU_StgyGearSig" : 0, "VCU_ShiftMisoper" : 0, "VCU_GearSigVld" : 0, "VCU_GearSig" : 0, "VCU_ACCRdy" : 0, "VCU_ParkRdy" : 0, "VCU_APSPercVld" : 0, "VCU_VehSt" : 0, "VCU_APSPerc" : 0, "VCU_BrkSig" : 0, "VCU_BrkSigVld" : 0, "VCU_DrvModSigFb" : 0, "VCU_DrvModShiftMisoper" : 0, "VCU_SpclTerrainModEnaSig" : 0}
    Validate TX Message With Expected Values    VCU_0x214    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_214_234_CheckSum" : 100, "VCU_214_234_AliveCounter" : 10, "VCU_RdyLamp" : 0, "VCU_BrkLampCtrlSts" : 0, "VCU_RemWakeUpEndFlg" : 0, "VCU_StgyGearSig" : 5, "VCU_ShiftMisoper" : 0, "VCU_GearSigVld" : 1, "VCU_GearSig" : 5, "VCU_ACCRdy" : 0, "VCU_ParkRdy" : 0, "VCU_APSPercVld" : 1, "VCU_VehSt" : 455, "VCU_APSPerc" : 50, "VCU_BrkSig" : 0, "VCU_BrkSigVld" : 1, "VCU_DrvModSigFb" : 1, "VCU_DrvModShiftMisoper" : 0, "VCU_SpclTerrainModEnaSig" : 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_214_234_CheckSum" : 100, "VCU_214_234_AliveCounter" : 10, "VCU_RdyLamp" : 0, "VCU_BrkLampCtrlSts" : 0, "VCU_RemWakeUpEndFlg" : 0, "VCU_StgyGearSig" : 5, "VCU_ShiftMisoper" : 0, "VCU_GearSigVld" : 1, "VCU_GearSig" : 5, "VCU_ACCRdy" : 0, "VCU_ParkRdy" : 0, "VCU_APSPercVld" : 1, "VCU_VehSt" : 455, "VCU_APSPerc" : 50, "VCU_BrkSig" : 0, "VCU_BrkSigVld" : 1, "VCU_DrvModSigFb" : 1, "VCU_DrvModShiftMisoper" : 0, "VCU_SpclTerrainModEnaSig" : 0}
    Validate TX Message With Expected Values    VCU_0x214    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_214_234_CheckSum" : 255, "VCU_214_234_AliveCounter" : 14, "VCU_RdyLamp" : 1, "VCU_BrkLampCtrlSts" : 1, "VCU_RemWakeUpEndFlg" : 1, "VCU_StgyGearSig" : 15, "VCU_ShiftMisoper" : 1, "VCU_GearSigVld" : 3, "VCU_GearSig" : 15, "VCU_ACCRdy" : 1, "VCU_ParkRdy" : 1, "VCU_APSPercVld" : 3, "VCU_VehSt" : 65535, "VCU_APSPerc" : 100, "VCU_BrkSig" : 1, "VCU_BrkSigVld" : 3, "VCU_DrvModSigFb" : 7, "VCU_DrvModShiftMisoper" : 1, "VCU_SpclTerrainModEnaSig" : 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_214_234_CheckSum" : 255, "VCU_214_234_AliveCounter" : 14, "VCU_RdyLamp" : 1, "VCU_BrkLampCtrlSts" : 1, "VCU_RemWakeUpEndFlg" : 1, "VCU_StgyGearSig" : 15, "VCU_ShiftMisoper" : 1, "VCU_GearSigVld" : 3, "VCU_GearSig" : 15, "VCU_ACCRdy" : 1, "VCU_ParkRdy" : 1, "VCU_APSPercVld" : 3, "VCU_VehSt" : 65535, "VCU_APSPerc" : 100, "VCU_BrkSig" : 1, "VCU_BrkSigVld" : 3, "VCU_DrvModSigFb" : 7, "VCU_DrvModShiftMisoper" : 1, "VCU_SpclTerrainModEnaSig" : 1}
    Validate TX Message With Expected Values    VCU_0x214    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VCU_0x358
    [Documentation]    Validate TX message 'VCU_0x358' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_358_CheckSum" : 0, "VCU_358_AliveCounter" : 0, "VCU_KickdwnFlg" : 0, "VCU_EPedlEnaSig" : 0, "VCU_ComLostFlt_ESP" : 0, "VCU_ComFlt_iBooster" : 0, "VCU_AccelModFb" : 0, "VCU_EPedlStsFb" : 0, "VCU_CcTrgSpdDisp" : 0, "VCU_Sts_CC_ICC" : 0, "VCU_CCIconDisp" : 0, "VCU_DispSpdUnit_CC" : 0, "VCU_BoostEnStat" : 0, "VCU_OTARdy_Fb" : 0, "VCU_OTA_ECUInhb_Req" : 0, "VCU_OTAVehCdnChk_ASIL" : 0, "VCU_OTAVehInhb_ASIL_Fb" : 0}
    ${xcp_var_map}=    Evaluate    {"VCU_358_CheckSum" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_358_CheckSum", "VCU_358_AliveCounter" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_358_AliveCounter", "VCU_KickdwnFlg" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_KickdwnFlg", "VCU_EPedlEnaSig" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_EPedlEnaSig", "VCU_ComLostFlt_ESP" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_ComLostFlt_ESP" "VCU_ComFlt_iBooster" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_ComFlt_iBooster", "VCU_AccelModFb" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_AccelModFb", "VCU_EPedlStsFb" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_EPedlStsFb", "VCU_CcTrgSpdDisp" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_CcTrgSpdDisp", "VCU_Sts_CC_ICC" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_Sts_CC_ICC", "VCU_CCIconDisp" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_CCIconDisp", "VCU_DispSpdUnit_CC" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_DispSpdUnit_CC", "VCU_BoostEnStat" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_BoostEnStat", "VCU_OTARdy_Fb" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_OTARdy_Fb", "VCU_OTA_ECUInhb_Req" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_OTA_ECUInhb_Req", "VCU_OTAVehCdnChk_ASIL" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_OTAVehCdnChk_ASIL", "VCU_OTAVehInhb_ASIL_Fb" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_OTAVehInhb_ASIL_Fb"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_358_CheckSum" : 0, "VCU_358_AliveCounter" : 0, "VCU_KickdwnFlg" : 0, "VCU_EPedlEnaSig" : 0, "VCU_ComLostFlt_ESP" : 0, "VCU_ComFlt_iBooster" : 0, "VCU_AccelModFb" : 0, "VCU_EPedlStsFb" : 0, "VCU_CcTrgSpdDisp" : 0, "VCU_Sts_CC_ICC" : 0, "VCU_CCIconDisp" : 0, "VCU_DispSpdUnit_CC" : 0, "VCU_BoostEnStat" : 0, "VCU_OTARdy_Fb" : 0, "VCU_OTA_ECUInhb_Req" : 0, "VCU_OTAVehCdnChk_ASIL" : 0, "VCU_OTAVehInhb_ASIL_Fb" : 0}
    Validate TX Message With Expected Values    VCU_0x358    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_358_CheckSum" : 100, "VCU_358_AliveCounter" : 10, "VCU_KickdwnFlg" : 1, "VCU_EPedlEnaSig" : 0, "VCU_ComLostFlt_ESP" : 0, "VCU_ComFlt_iBooster" : 0, "VCU_AccelModFb" : 1, "VCU_EPedlStsFb" : 1, "VCU_CcTrgSpdDisp" : 100, "VCU_Sts_CC_ICC" : 5, "VCU_CCIconDisp" : 5, "VCU_DispSpdUnit_CC" : 0, "VCU_BoostEnStat" : 5, "VCU_OTARdy_Fb" : 1, "VCU_OTA_ECUInhb_Req" : 1, "VCU_OTAVehCdnChk_ASIL" : 1, "VCU_OTAVehInhb_ASIL_Fb" : 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_358_CheckSum" : 100, "VCU_358_AliveCounter" : 10, "VCU_KickdwnFlg" : 1, "VCU_EPedlEnaSig" : 0, "VCU_ComLostFlt_ESP" : 0, "VCU_ComFlt_iBooster" : 0, "VCU_AccelModFb" : 1, "VCU_EPedlStsFb" : 1, "VCU_CcTrgSpdDisp" : 100, "VCU_Sts_CC_ICC" : 5, "VCU_CCIconDisp" : 5, "VCU_DispSpdUnit_CC" : 0, "VCU_BoostEnStat" : 5, "VCU_OTARdy_Fb" : 1, "VCU_OTA_ECUInhb_Req" : 1, "VCU_OTAVehCdnChk_ASIL" : 1, "VCU_OTAVehInhb_ASIL_Fb" : 1}
    Validate TX Message With Expected Values    VCU_0x358    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_358_CheckSum" : 255, "VCU_358_AliveCounter" : 14, "VCU_KickdwnFlg" : 3, "VCU_EPedlEnaSig" : 1, "VCU_ComLostFlt_ESP" : 1, "VCU_ComFlt_iBooster" : 1, "VCU_AccelModFb" : 3, "VCU_EPedlStsFb" : 3, "VCU_CcTrgSpdDisp" : 255, "VCU_Sts_CC_ICC" : 15, "VCU_CCIconDisp" : 7, "VCU_DispSpdUnit_CC" : 1, "VCU_BoostEnStat" : 15, "VCU_OTARdy_Fb" : 3, "VCU_OTA_ECUInhb_Req" : 3, "VCU_OTAVehCdnChk_ASIL" : 3, "VCU_OTAVehInhb_ASIL_Fb" : 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_358_CheckSum" : 255, "VCU_358_AliveCounter" : 14, "VCU_KickdwnFlg" : 3, "VCU_EPedlEnaSig" : 1, "VCU_ComLostFlt_ESP" : 1, "VCU_ComFlt_iBooster" : 1, "VCU_AccelModFb" : 3, "VCU_EPedlStsFb" : 3, "VCU_CcTrgSpdDisp" : 255, "VCU_Sts_CC_ICC" : 15, "VCU_CCIconDisp" : 7, "VCU_DispSpdUnit_CC" : 1, "VCU_BoostEnStat" : 15, "VCU_OTARdy_Fb" : 3, "VCU_OTA_ECUInhb_Req" : 3, "VCU_OTAVehCdnChk_ASIL" : 3, "VCU_OTAVehInhb_ASIL_Fb" : 3}
    Validate TX Message With Expected Values    VCU_0x358    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VCU_0x507
    [Documentation]    Validate TX message 'VCU_0x507' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "VCU_OTAVehCdnChk_QM_sts" : "VCU_DrvAvl" : "VCU_CllsnSigSts" : "VCU_VehSts_GB" : "VCU_MCUOverTFlt_GB" : "VCU_DrvrMotOverTFlt_GB" : "VCU_SOCTooLoAlrm" : "VCU_SOCJumpAlrm" : "VCU_PwrBattPackMismatAlrm" : "VCU_SOCTooHiAlrm" :  "VCU_DCDCEnaCmd" :  "VCU_PwrBattECCEnaCmd" :  "VCU_MstRlyCtrlCmd" :  "VCU_DCDCOutpVoltCmd" :  "VCU_CCCnctnVolt" :  "VCU_GearSig_GB" :  "VCU_DrvrMotNr_GB" :  "VCU_BattVolt" : 0}
    ${xcp_var_map}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_OTAVehInhb_QM_Fb", "VCU_OTAVehCdnChk_QM_sts" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_OTAVehCdnChk_QM_sts", "VCU_DrvAvl" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_DrvAvl", "VCU_CllsnSigSts" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_CllsnSigSts", "VCU_VehSts_GB" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_VehSts_GB", "VCU_MCUOverTFlt_GB" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_MCUOverTFlt_GB", "VCU_DrvrMotOverTFlt_GB" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_DrvrMotOverTFlt_GB", "VCU_SOCTooLoAlrm" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_SOCTooLoAlrm", "VCU_SOCJumpAlrm" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_SOCJumpAlrm", "VCU_PwrBattPackMismatAlrm" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_PwrBattPackMismatAlrm", "VCU_SOCTooHiAlrm" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_SOCTooHiAlrm", "VCU_DCDCEnaCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_DCDCEnaCmd", "VCU_PwrBattECCEnaCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_PwrBattECCEnaCmd", "VCU_MstRlyCtrlCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_MstRlyCtrlCmd", "VCU_DCDCOutpVoltCmd" :  "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_DCDCOutpVoltCmd", "VCU_CCCnctnVolt" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_CCCnctnVolt", "VCU_GearSig_GB" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_GearSig_GB", "VCU_DrvrMotNr_GB" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_DrvrMotNr_GB", "VCU_BattVolt" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_BattVolt"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "VCU_OTAVehCdnChk_QM_sts" : "VCU_DrvAvl" : "VCU_CllsnSigSts" : "VCU_VehSts_GB" : "VCU_MCUOverTFlt_GB" : "VCU_DrvrMotOverTFlt_GB" : "VCU_SOCTooLoAlrm" : "VCU_SOCJumpAlrm" : "VCU_PwrBattPackMismatAlrm" : "VCU_SOCTooHiAlrm" :  "VCU_DCDCEnaCmd" :  "VCU_PwrBattECCEnaCmd" :  "VCU_MstRlyCtrlCmd" :  "VCU_DCDCOutpVoltCmd" :  "VCU_CCCnctnVolt" :  "VCU_GearSig_GB" :  "VCU_DrvrMotNr_GB" :  "VCU_BattVolt" : 0}
    Validate TX Message With Expected Values    VCU_0x507    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "VCU_OTAVehCdnChk_QM_sts" : "VCU_DrvAvl" : "VCU_CllsnSigSts" : "VCU_VehSts_GB" : "VCU_MCUOverTFlt_GB" : "VCU_DrvrMotOverTFlt_GB" : "VCU_SOCTooLoAlrm" : "VCU_SOCJumpAlrm" : "VCU_PwrBattPackMismatAlrm" : "VCU_SOCTooHiAlrm" :  "VCU_DCDCEnaCmd" :  "VCU_PwrBattECCEnaCmd" :  "VCU_MstRlyCtrlCmd" :  "VCU_DCDCOutpVoltCmd" :  "VCU_CCCnctnVolt" :  "VCU_GearSig_GB" :  "VCU_DrvrMotNr_GB" :  "VCU_BattVolt" : }
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "VCU_OTAVehCdnChk_QM_sts" : "VCU_DrvAvl" : "VCU_CllsnSigSts" : "VCU_VehSts_GB" : "VCU_MCUOverTFlt_GB" : "VCU_DrvrMotOverTFlt_GB" : "VCU_SOCTooLoAlrm" : "VCU_SOCJumpAlrm" : "VCU_PwrBattPackMismatAlrm" : "VCU_SOCTooHiAlrm" :  "VCU_DCDCEnaCmd" :  "VCU_PwrBattECCEnaCmd" :  "VCU_MstRlyCtrlCmd" :  "VCU_DCDCOutpVoltCmd" :  "VCU_CCCnctnVolt" :  "VCU_GearSig_GB" :  "VCU_DrvrMotNr_GB" :  "VCU_BattVolt" : }
    Validate TX Message With Expected Values    VCU_0x507    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "VCU_OTAVehCdnChk_QM_sts" : "VCU_DrvAvl" : "VCU_CllsnSigSts" : "VCU_VehSts_GB" : "VCU_MCUOverTFlt_GB" : "VCU_DrvrMotOverTFlt_GB" : "VCU_SOCTooLoAlrm" : "VCU_SOCJumpAlrm" : "VCU_PwrBattPackMismatAlrm" : "VCU_SOCTooHiAlrm" :  "VCU_DCDCEnaCmd" :  "VCU_PwrBattECCEnaCmd" :  "VCU_MstRlyCtrlCmd" :  "VCU_DCDCOutpVoltCmd" :  "VCU_CCCnctnVolt" :  "VCU_GearSig_GB" :  "VCU_DrvrMotNr_GB" :  "VCU_BattVolt" : }
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_OTAVehInhb_QM_Fb" : "VCU_OTAVehCdnChk_QM_sts" : "VCU_DrvAvl" : "VCU_CllsnSigSts" : "VCU_VehSts_GB" : "VCU_MCUOverTFlt_GB" : "VCU_DrvrMotOverTFlt_GB" : "VCU_SOCTooLoAlrm" : "VCU_SOCJumpAlrm" : "VCU_PwrBattPackMismatAlrm" : "VCU_SOCTooHiAlrm" :  "VCU_DCDCEnaCmd" :  "VCU_PwrBattECCEnaCmd" :  "VCU_MstRlyCtrlCmd" :  "VCU_DCDCOutpVoltCmd" :  "VCU_CCCnctnVolt" :  "VCU_GearSig_GB" :  "VCU_DrvrMotNr_GB" :  "VCU_BattVolt" : }
    Validate TX Message With Expected Values    VCU_0x507    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VCU_0x511
    [Documentation]    Validate TX message 'VCU_0x511' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_BMSLVWakeUpSts" : 0, "VCU_ONWakeUpSig" : 0, "VCU_FCWakeUpSig" : 0, "VCU_SCWakeUpSig" : 0, "VCU_RemWakeUpSig" : 0, "VCU_NetWakeUpSig" : 0, "VCU_LVWakeUpSts_PDU" : 0, "VCU_VehEOLFctFlg" : 0, "VCU_LVWakeUpSts_MCU" : 0, "VCU_PwrAntithefAllwtRdyFlg" : 0, "VCU_LVWakeUpSts_CCU" : 0, "VCU_RemECCEndCmd" : 0, "VCU_EvChrgElectcLockCtrlCmd" : 0, "VCU_RemPwrBattHeatgEndCmd" : 0, "VCU_RemChrgEndCmd" : 0, "VCU_V2L_TrAvl" : 0, "VCU_RemBattHeatgFailReason" : 0, "VCU_RemECCEndReason" : 0, "VCU_V2L_ChrgPortAvl" : 0, "VCU_RemChrgEndReason" : 0, "VCU_SchedChrgnStsFb" : 0, "VCU_V2V_Avl" : 0, "VCU_V2H_Avl" : 0, "VCU_V2G_Avl" : 0, "VCU_VehMod" : 0, "VCU_VehCrtChrgEndSOC" : 0, "VCU_CalSwVers" : 0, "VCU_RemPwrBattPreheatgEndFlg" : 0, "VCU_VehOperMod" : 0, "VCU_VehRemRefrshModReq" : 0, "VCU_RemDTCPwrOnReq" : 0}
    ${xcp_var_map}=    Evaluate    {"VCU_BMSLVWakeUpSts" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_BMSLVWakeUpSts", "VCU_ONWakeUpSig" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_ONWakeUpSig", "VCU_FCWakeUpSig" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_FCWakeUpSig", "VCU_SCWakeUpSig" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_SCWakeUpSig", "VCU_RemWakeUpSig" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemWakeUpSig", "VCU_NetWakeUpSig" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_NetWakeUpSig", "VCU_LVWakeUpSts_PDU" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_LVWakeUpSts_PDU", "VCU_VehEOLFctFlg" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_VehEOLFctFlg", "VCU_LVWakeUpSts_MCU" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_LVWakeUpSts_MCU", "VCU_PwrAntithefAllwtRdyFlg" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_PwrAntithefAllwtRdyFlg", "VCU_LVWakeUpSts_CCU" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_LVWakeUpSts_CCU", "VCU_RemECCEndCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemECCEndCmd", "VCU_EvChrgElectcLockCtrlCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_EvChrgElectcLockCtrlCmd", "VCU_RemPwrBattHeatgEndCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemPwrBattHeatgEndCmd", "VCU_RemChrgEndCmd" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemChrgEndCmd", "VCU_V2L_TrAvl" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_V2L_TrAvl", "VCU_RemBattHeatgFailReason" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemBattHeatgFailReason", "VCU_RemECCEndReason" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemECCEndReason", "VCU_V2L_ChrgPortAvl" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_V2L_ChrgPortAvl", "VCU_RemChrgEndReason" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemChrgEndReason", "VCU_SchedChrgnStsFb" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_SchedChrgnStsFb", "VCU_V2V_Avl" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_V2V_Avl", "VCU_V2H_Avl" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_V2H_Avl", "VCU_V2G_Avl" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_V2G_Avl", "VCU_VehMod" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_VehMod", "VCU_VehCrtChrgEndSOC" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_VehCrtChrgEndSOC", "VCU_CalSwVers" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_CalSwVers", "VCU_RemPwrBattPreheatgEndFlg" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemPwrBattPreheatgEndFlg", "VCU_VehOperMod" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_VehOperMod", "VCU_VehRemRefrshModReq" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_VehRemRefrshModReq", "VCU_RemDTCPwrOnReq" : "Rte_C_SG_VCU_0x358_adt_D7C5CF849C81B8298DEE18F201879C5C.VCU_RemDTCPwrOnReq"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_BMSLVWakeUpSts" : 0, "VCU_ONWakeUpSig" : 0, "VCU_FCWakeUpSig" : 0, "VCU_SCWakeUpSig" : 0, "VCU_RemWakeUpSig" : 0, "VCU_NetWakeUpSig" : 0, "VCU_LVWakeUpSts_PDU" : 0, "VCU_VehEOLFctFlg" : 0, "VCU_LVWakeUpSts_MCU" : 0, "VCU_PwrAntithefAllwtRdyFlg" : 0, "VCU_LVWakeUpSts_CCU" : 0, "VCU_RemECCEndCmd" : 0, "VCU_EvChrgElectcLockCtrlCmd" : 0, "VCU_RemPwrBattHeatgEndCmd" : 0, "VCU_RemChrgEndCmd" : 0, "VCU_V2L_TrAvl" : 0, "VCU_RemBattHeatgFailReason" : 0, "VCU_RemECCEndReason" : 0, "VCU_V2L_ChrgPortAvl" : 0, "VCU_RemChrgEndReason" : 0, "VCU_SchedChrgnStsFb" : 0, "VCU_V2V_Avl" : 0, "VCU_V2H_Avl" : 0, "VCU_V2G_Avl" : 0, "VCU_VehMod" : 0, "VCU_VehCrtChrgEndSOC" : 0, "VCU_CalSwVers" : 0, "VCU_RemPwrBattPreheatgEndFlg" : 0, "VCU_VehOperMod" : "0, VCU_VehRemRefrshModReq" : 0, "VCU_RemDTCPwrOnReq" : 0}
    Validate TX Message With Expected Values    VCU_0x511    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_BMSLVWakeUpSts" : 0, "VCU_ONWakeUpSig" : 0, "VCU_FCWakeUpSig" : 0, "VCU_SCWakeUpSig" : 0, "VCU_RemWakeUpSig" : 0, "VCU_NetWakeUpSig" : 0, "VCU_LVWakeUpSts_PDU" : 0, "VCU_VehEOLFctFlg" : 0, "VCU_LVWakeUpSts_MCU" : 0, "VCU_PwrAntithefAllwtRdyFlg" : 0, "VCU_LVWakeUpSts_CCU" : 0, "VCU_RemECCEndCmd" : 0, "VCU_EvChrgElectcLockCtrlCmd" : 1, "VCU_RemPwrBattHeatgEndCmd" : 0, "VCU_RemChrgEndCmd" : 0, "VCU_V2L_TrAvl" : 0, "VCU_RemBattHeatgFailReason" : 5, "VCU_RemECCEndReason" : 0, "VCU_V2L_ChrgPortAvl" : 0, "VCU_RemChrgEndReason" : 5, "VCU_SchedChrgnStsFb" : 1, "VCU_V2V_Avl" : 0, "VCU_V2H_Avl" : 0, "VCU_V2G_Avl" : 0, "VCU_VehMod" : 10, "VCU_VehCrtChrgEndSOC" : 50, "VCU_CalSwVers" : 5, "VCU_RemPwrBattPreheatgEndFlg" : 0, "VCU_VehOperMod" : 10, "VCU_VehRemRefrshModReq" : 1, "VCU_RemDTCPwrOnReq" : 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_BMSLVWakeUpSts" : 0, "VCU_ONWakeUpSig" : 0, "VCU_FCWakeUpSig" : 0, "VCU_SCWakeUpSig" : 0, "VCU_RemWakeUpSig" : 0, "VCU_NetWakeUpSig" : 0, "VCU_LVWakeUpSts_PDU" : 0, "VCU_VehEOLFctFlg" : 0, "VCU_LVWakeUpSts_MCU" : 0, "VCU_PwrAntithefAllwtRdyFlg" : 0, "VCU_LVWakeUpSts_CCU" : 0, "VCU_RemECCEndCmd" : 0, "VCU_EvChrgElectcLockCtrlCmd" : 1, "VCU_RemPwrBattHeatgEndCmd" : 0, "VCU_RemChrgEndCmd" : 0, "VCU_V2L_TrAvl" : 0, "VCU_RemBattHeatgFailReason" : 5, "VCU_RemECCEndReason" : 0, "VCU_V2L_ChrgPortAvl" : 0, "VCU_RemChrgEndReason" : 5, "VCU_SchedChrgnStsFb" : 1, "VCU_V2V_Avl" : 0, "VCU_V2H_Avl" : 0, "VCU_V2G_Avl" : 0, "VCU_VehMod" : 10, "VCU_VehCrtChrgEndSOC" : 50, "VCU_CalSwVers" : 5, "VCU_RemPwrBattPreheatgEndFlg" : 0, "VCU_VehOperMod" : 10, "VCU_VehRemRefrshModReq" : 1, "VCU_RemDTCPwrOnReq" : 0}
    Validate TX Message With Expected Values    VCU_0x511    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_BMSLVWakeUpSts" : 0, "VCU_ONWakeUpSig" : 1, "VCU_FCWakeUpSig" : 1, "VCU_SCWakeUpSig" : 1, "VCU_RemWakeUpSig" : 1, "VCU_NetWakeUpSig" : 1, "VCU_LVWakeUpSts_PDU" : 1, "VCU_VehEOLFctFlg" : 1, "VCU_LVWakeUpSts_MCU" : 1, "VCU_PwrAntithefAllwtRdyFlg" : 1, "VCU_LVWakeUpSts_CCU" : 1, "VCU_RemECCEndCmd" : 1, "VCU_EvChrgElectcLockCtrlCmd" : 3, "VCU_RemPwrBattHeatgEndCmd" : 1, "VCU_RemChrgEndCmd" : 1, "VCU_V2L_TrAvl" : 1, "VCU_RemBattHeatgFailReason" : 7, "VCU_RemECCEndReason" : 1, "VCU_V2L_ChrgPortAvl" : 1, "VCU_RemChrgEndReason" : 7, "VCU_SchedChrgnStsFb" : 3, "VCU_V2V_Avl" : 1, "VCU_V2H_Avl" : 1, "VCU_V2G_Avl" : 1, "VCU_VehMod" : 15, "VCU_VehCrtChrgEndSOC" : 100, "VCU_CalSwVers" : 31, "VCU_RemPwrBattPreheatgEndFlg" : 1, "VCU_VehOperMod" : 31, "VCU_VehRemRefrshModReq" : 3, "VCU_RemDTCPwrOnReq" : 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_BMSLVWakeUpSts" : 0, "VCU_ONWakeUpSig" : 1, "VCU_FCWakeUpSig" : 1, "VCU_SCWakeUpSig" : 1, "VCU_RemWakeUpSig" : 1, "VCU_NetWakeUpSig" : 1, "VCU_LVWakeUpSts_PDU" : 1, "VCU_VehEOLFctFlg" : 1, "VCU_LVWakeUpSts_MCU" : 1, "VCU_PwrAntithefAllwtRdyFlg" : 1, "VCU_LVWakeUpSts_CCU" : 1, "VCU_RemECCEndCmd" : 1, "VCU_EvChrgElectcLockCtrlCmd" : 3, "VCU_RemPwrBattHeatgEndCmd" : 1, "VCU_RemChrgEndCmd" : 1, "VCU_V2L_TrAvl" : 1, "VCU_RemBattHeatgFailReason" : 7, "VCU_RemECCEndReason" : 1, "VCU_V2L_ChrgPortAvl" : 1, "VCU_RemChrgEndReason" : 7, "VCU_SchedChrgnStsFb" : 3, "VCU_V2V_Avl" : 1, "VCU_V2H_Avl" : 1, "VCU_V2G_Avl" : 1, "VCU_VehMod" : 15, "VCU_VehCrtChrgEndSOC" : 100, "VCU_CalSwVers" : 31, "VCU_RemPwrBattPreheatgEndFlg" : 1, "VCU_VehOperMod" : 31, "VCU_VehRemRefrshModReq" : 3, "VCU_RemDTCPwrOnReq" : 1}
    Validate TX Message With Expected Values    VCU_0x511    ${expected_can_signals}    30


Send Tx XCP variables and validating on CAN signals for message VCU_0x6E5
    [Documentation]    Validate TX message 'VCU_0x6E5' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod1": 0}
    ${xcp_var_map}=    Evaluate    {"VCU_VINCod1": "Rte_C_SG_VCU_0x6E5_adt_8169177D5383A0EC751E035FD495B850.VCU_VINCod1"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod1": 0}
    Validate TX Message With Expected Values    VCU_0x6E5    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod1": 100000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod1": 100000}
    Validate TX Message With Expected Values    VCU_0x6E5    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod1": 16777215}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod1": 16777215}
    Validate TX Message With Expected Values    VCU_0x6E5    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VCU_0x6E6
    [Documentation]    Validate TX message 'VCU_0x6E6' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod2": 0}
    ${xcp_var_map}=    Evaluate    {"VCU_VINCod2": "Rte_C_SG_VCU_0x6E6_adt_05CA1BD686BD44F04D901E2B0D03ADD0.VCU_VINCod2"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod2": 0}
    Validate TX Message With Expected Values    VCU_0x6E6    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod2": 100000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod2": 100000}
    Validate TX Message With Expected Values    VCU_0x6E6    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod2": 16777215}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod2": 16777215}
    Validate TX Message With Expected Values    VCU_0x6E6    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message VCU_0x6E7
    [Documentation]    Validate TX message 'VCU_0x6E7' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod3": 0}
    ${xcp_var_map}=    Evaluate    {"VCU_VINCod3": "Rte_C_SG_VCU_0x6E7_adt_B0100FD64089A5BB21D8B136FB84C4C0.VCU_VINCod3"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod3": 0}
    Validate TX Message With Expected Values    VCU_0x6E7    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod3": 100000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod3": 100000}
    Validate TX Message With Expected Values    VCU_0x6E7    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"VCU_VINCod3": 16777215}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VCU_VINCod3": 16777215}
    Validate TX Message With Expected Values    VCU_0x6E7    ${expected_can_signals}    30


Send Tx XCP variables and validating on CAN signals for message YRS_0x112
    [Documentation]    Validate TX message 'YRS_0x112' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"YRS_112_CheckSum": 0, "YRS_112_AliveCounter": 0, "YRS_YawRateCalSts": 0, "YRS_YawRateSnsrSts": 0, "YRS_LatSnsrSts": 0, "YRS_LatAcce": -2, "YRS_YawRate": -180}
    ${xcp_var_map}=    Evaluate    {"YRS_112_CheckSum": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_112_CheckSum", "YRS_112_AliveCounter": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_112_AliveCounter", "YRS_YawRateCalSts": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_YawRateCalSts", "YRS_YawRateSnsrSts": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_YawRateSnsrSts", "YRS_LatSnsrSts": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_LatSnsrSts", "YRS_LatAcce": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_LatAcce", "YRS_YawRate": "Rte_C_SG_YRS_0x112_adt_7E06CB5398F3C7D75359B44BEE8F8E25.YRS_YawRate"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"YRS_112_CheckSum": 0, "YRS_112_AliveCounter": 0, "YRS_YawRateCalSts": 0, "YRS_YawRateSnsrSts": 0, "YRS_LatSnsrSts": 0, "YRS_LatAcce": -2, "YRS_YawRate": -180}
    Validate TX Message With Expected Values    YRS_0x112    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"YRS_112_CheckSum": 100, "YRS_112_AliveCounter": 10, "YRS_YawRateCalSts": 0, "YRS_YawRateSnsrSts": 1, "YRS_LatSnsrSts": 1, "YRS_LatAcce": 1, "YRS_YawRate": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"YRS_112_CheckSum": 100, "YRS_112_AliveCounter": 10, "YRS_YawRateCalSts": 0, "YRS_YawRateSnsrSts": 1, "YRS_LatSnsrSts": 1, "YRS_LatAcce": 1, "YRS_YawRate": 100}
    Validate TX Message With Expected Values    YRS_0x112    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"YRS_112_CheckSum": 255, "YRS_112_AliveCounter": 14, "YRS_YawRateCalSts": 1, "YRS_YawRateSnsrSts": 3, "YRS_LatSnsrSts": 3, "YRS_LatAcce": 2, "YRS_YawRate": 180}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"YRS_112_CheckSum": 255, "YRS_112_AliveCounter": 14, "YRS_YawRateCalSts": 1, "YRS_YawRateSnsrSts": 3, "YRS_LatSnsrSts": 3, "YRS_LatAcce": 2, "YRS_YawRate": 180}
    Validate TX Message With Expected Values    YRS_0x112    ${expected_can_signals}    30


Send Tx XCP variables and validating on CAN signals for message YRS_0x113
    [Documentation]    Validate TX message 'YRS_0x113' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"YRS_113_CheckSum": 0, "YRS_113_AliveCounter": 0, "YRS_LgtSnsrSts": 0, "YRS_LgtAcce": 0}
    ${xcp_var_map}=    Evaluate    {"YRS_113_CheckSum": "Rte_C_SG_YRS_0x113_adt_B65C7485CC461A7E547F9C6CDFF6A070.YRS_113_CheckSum", "YRS_113_AliveCounter": "Rte_C_SG_YRS_0x113_adt_B65C7485CC461A7E547F9C6CDFF6A070.YRS_113_AliveCounter", "YRS_LgtSnsrSts": "Rte_C_SG_YRS_0x113_adt_B65C7485CC461A7E547F9C6CDFF6A070.YRS_LgtSnsrSts", "YRS_LgtAcce": "Rte_C_SG_YRS_0x113_adt_B65C7485CC461A7E547F9C6CDFF6A070.YRS_LgtAcce"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"YRS_113_CheckSum": 0, "YRS_113_AliveCounter": 0, "YRS_LgtSnsrSts": 0, "YRS_LgtAcce": 0}
    Validate TX Message With Expected Values    YRS_0x113    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"YRS_113_CheckSum": 100, "YRS_113_AliveCounter": 10, "YRS_LgtSnsrSts": 0, "YRS_LgtAcce": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"YRS_113_CheckSum": 100, "YRS_113_AliveCounter": 10, "YRS_LgtSnsrSts": 0, "YRS_LgtAcce": 1}
    Validate TX Message With Expected Values    YRS_0x113    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"YRS_113_CheckSum": 255, "YRS_113_AliveCounter": 14, "YRS_LgtSnsrSts": 1, "YRS_LgtAcce": 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"YRS_113_CheckSum": 255, "YRS_113_AliveCounter": 14, "YRS_LgtSnsrSts": 1, "YRS_LgtAcce": 3}
    Validate TX Message With Expected Values    YRS_0x113    ${expected_can_signals}    30