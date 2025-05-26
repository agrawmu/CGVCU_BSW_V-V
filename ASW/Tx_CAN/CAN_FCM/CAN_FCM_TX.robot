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
Send Tx XCP variables and validating on CAN signals for message ESP_0x116
    [Documentation]    Validate TX message 'ESP_0x116' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_116_CheckSum": 1, "ESP_116_AliveCounter": 0, "ESP_WhlSpdVld_RR": Initializing, "ESP_WhlSpd_RR": 1, "ESP_WhlMovgDir_RR": Init, "ESP_WhlMovgDir_RL": Init, "ESP_WhlSpdVld_RL": Initializing, "ESP_WhlSpd_RL": 0}
    ${xcp_var_map}=    Evaluate    {"ESP_116_CheckSum": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_116_CheckSum", "ESP_116_AliveCounter": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_116_AliveCounter", "ESP_WhlSpdVld_RR": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpdVld_RR", "ESP_WhlSpd_RR": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpd_RR", "ESP_WhlMovgDir_RR": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlMovgDir_RR", "ESP_WhlMovgDir_RL": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlMovgDir_RL", "ESP_WhlSpdVld_RL": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpdVld_RL", "ESP_WhlSpd_RL": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpd_RL"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_116_CheckSum": 1, "ESP_116_AliveCounter": 0, "ESP_WhlSpdVld_RR": Initializing, "ESP_WhlSpd_RR": 1, "ESP_WhlMovgDir_RR": Init, "ESP_WhlMovgDir_RL": Init, "ESP_WhlSpdVld_RL": Initializing, "ESP_WhlSpd_RL": 0}
    Validate TX Message With Expected Values    ESP_0x116    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_116_CheckSum": 100, "ESP_116_AliveCounter": 6, "ESP_WhlSpdVld_RR": Invalid, "ESP_WhlSpd_RR": 50, "ESP_WhlMovgDir_RR": Stop, "ESP_WhlMovgDir_RL": Stop, "ESP_WhlSpdVld_RL": Invalid, "ESP_WhlSpd_RL": 50}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_116_CheckSum": 100, "ESP_116_AliveCounter": 6 "ESP_WhlSpdVld_RR": Invalid, "ESP_WhlSpd_RR": 50, "ESP_WhlMovgDir_RR": Stop, "ESP_WhlMovgDir_RL": Stop, "ESP_WhlSpdVld_RL": Invalid, "ESP_WhlSpd_RL": 50}
    Validate TX Message With Expected Values    ESP_0x116    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_116_CheckSum": 255, "ESP_116_AliveCounter": 14, "ESP_WhlSpdVld_RR": Reserved, "ESP_WhlSpd_RR": 300, "ESP_WhlMovgDir_RR": Invalid, "ESP_WhlMovgDir_RL": Invalid, "ESP_WhlSpdVld_RL": Reserved, "ESP_WhlSpd_RL": 300}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_116_CheckSum": 255, "ESP_116_AliveCounter": 14, "ESP_WhlSpdVld_RR": Reserved, "ESP_WhlSpd_RR": 300, "ESP_WhlMovgDir_RR": Invalid, "ESP_WhlMovgDir_RL": Invalid, "ESP_WhlSpdVld_RL": Reserved, "ESP_WhlSpd_RL": 300}
    Validate TX Message With Expected Values    ESP_0x116    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message ESP_0x120
    [Documentation]    Validate TX message 'ESP_0x120' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_120_CheckSum": 1, "ESP_120_AliveCounter": 0, "ESP_ActvSig_ABS": ABS_Standby, "ESP_MstCylPVld": Initializing, "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": Initializing, "ESP_TotBrkTqReq": 1}
    ${xcp_var_map}=    Evaluate    {"ESP_120_CheckSum": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_120_CheckSum", "ESP_120_AliveCounter": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_120_AliveCounter", "ESP_ActvSig_ABS": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_ActvSig_ABS", "ESP_MstCylPVld": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylPVld", "ESP_MstCylP": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylP", "ESP_MstCylPOffs": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylPOffs", "ESP_MstCylPOffsVld": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylPOffsVld", "ESP_TotBrkTqReq": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_TotBrkTqReq"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_120_CheckSum": 1, "ESP_120_AliveCounter": 0, "ESP_ActvSig_ABS": ABS_Standby, "ESP_MstCylPVld": Initializing, "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": Initializing, "ESP_TotBrkTqReq": 1}
    Validate TX Message With Expected Values    ESP_0x120    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_120_CheckSum": 100, "ESP_120_AliveCounter": 6, "ESP_ActvSig_ABS": ABS_Standby, "ESP_MstCylPVld": Invalid, "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": Invalid, "ESP_TotBrkTqReq": 5}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_120_CheckSum": 100, "ESP_120_AliveCounter": 6, "ESP_ActvSig_ABS": ABS_Standby, "ESP_MstCylPVld": Invalid, "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": Invalid, "ESP_TotBrkTqReq": 5}
    Validate TX Message With Expected Values    ESP_0x120    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_120_CheckSum": 255, "ESP_120_AliveCounter": 14, "ESP_ActvSig_ABS": ABS_ActuallyOperating, "ESP_MstCylPVld": Reserved, "ESP_MstCylP": 276.6, "ESP_MstCylPOffs": 2, "ESP_MstCylPOffsVld": Reserved, "ESP_TotBrkTqReq": 30000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_120_CheckSum": 255, "ESP_120_AliveCounter": 14, "ESP_ActvSig_ABS": ABS_ActuallyOperating, "ESP_MstCylPVld": Reserved, "ESP_MstCylP": 276.6, "ESP_MstCylPOffs": 2, "ESP_MstCylPOffsVld": Reserved, "ESP_TotBrkTqReq": 30000}
    Validate TX Message With Expected Values    ESP_0x120    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message ESP_0x125
    [Documentation]    Validate TX message 'ESP_0x125' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_125_CheckSum": 1, "ESP_125_AliveCounter": 0, "ESP_WhlOdoEdges_FL": 2, "ESP_WhlOdoEdges_FR": 3, "ESP_WhlOdoEdges_RL": 4, "ESP_WhlOdoEdges_RR": 5, "ESP_WhlOdoEdgesVld_FL": Initializing, "ESP_WhlOdoEdgesVld_FR": Initializing, "ESP_WhlOdoEdgesVld_RL": Initializing, "ESP_WhlOdoEdgesVld_RR": Initializing}
    ${xcp_var_map}=    Evaluate    {"ESP_125_CheckSum": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_125_CheckSum", "ESP_125_AliveCounter": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_125_AliveCounter", "ESP_WhlOdoEdges_FL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_FL", "ESP_WhlOdoEdges_FR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_FR", "ESP_WhlOdoEdges_RL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_RL", "ESP_WhlOdoEdges_RR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_RR", "ESP_WhlOdoEdgesVld_FL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_FL", "ESP_WhlOdoEdgesVld_FR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_FR", "ESP_WhlOdoEdgesVld_RL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_RL", "ESP_WhlOdoEdgesVld_RR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_RR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_125_CheckSum": 1, "ESP_125_AliveCounter": 0, "ESP_WhlOdoEdges_FL": 2, "ESP_WhlOdoEdges_FR": 3, "ESP_WhlOdoEdges_RL": 4, "ESP_WhlOdoEdges_RR": 5, "ESP_WhlOdoEdgesVld_FL": Initializing, "ESP_WhlOdoEdgesVld_FR": Initializing, "ESP_WhlOdoEdgesVld_RL": Initializing, "ESP_WhlOdoEdgesVld_RR": Initializing}
    Validate TX Message With Expected Values    ESP_0x125    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_125_CheckSum": 100, "ESP_125_AliveCounter": 6, "ESP_WhlOdoEdges_FL": 100, "ESP_WhlOdoEdges_FR": 100, "ESP_WhlOdoEdges_RL": 100, "ESP_WhlOdoEdges_RR": 100, "ESP_WhlOdoEdgesVld_FL": Invalid, "ESP_WhlOdoEdgesVld_FR": Invalid, "ESP_WhlOdoEdgesVld_RL": Invalid, "ESP_WhlOdoEdgesVld_RR": Invalid}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_125_CheckSum": 100, "ESP_125_AliveCounter": 6, "ESP_WhlOdoEdges_FL": 100, "ESP_WhlOdoEdges_FR": 100, "ESP_WhlOdoEdges_RL": 100, "ESP_WhlOdoEdges_RR": 100, "ESP_WhlOdoEdgesVld_FL": Invalid, "ESP_WhlOdoEdgesVld_FR": Invalid, "ESP_WhlOdoEdgesVld_RL": Invalid, "ESP_WhlOdoEdgesVld_RR": Invalid}
    Validate TX Message With Expected Values    ESP_0x125   ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_125_CheckSum": 255, "ESP_125_AliveCounter": 14, "ESP_WhlOdoEdges_FL": 255, "ESP_WhlOdoEdges_FR": 255, "ESP_WhlOdoEdges_RL": 255, "ESP_WhlOdoEdges_RR": 255, "ESP_WhlOdoEdgesVld_FL": Reserved, "ESP_WhlOdoEdgesVld_FR": Reserved, "ESP_WhlOdoEdgesVld_RL": Reserved, "ESP_WhlOdoEdgesVld_RR": Reserved}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_125_CheckSum": 255, "ESP_125_AliveCounter": 14, "ESP_WhlOdoEdges_FL": 255, "ESP_WhlOdoEdges_FR": 255, "ESP_WhlOdoEdges_RL": 255, "ESP_WhlOdoEdges_RR": 255, "ESP_WhlOdoEdgesVld_FL": Reserved, "ESP_WhlOdoEdgesVld_FR": Reserved, "ESP_WhlOdoEdgesVld_RL": Reserved, "ESP_WhlOdoEdgesVld_RR": Reserved}
    Validate TX Message With Expected Values    ESP_0x125    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message ESP_0x12A
    [Documentation]    Validate TX message 'ESP_0x12A' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_12A_CheckSum": 1, "ESP_12A_AliveCounter": 0, "ESP_ExtBrkReqFlg": Qtarget_Off, "ESP_FBldgCtrlSts": PFC_Inactive, "ESP_ExtBrkReq": -252, "ESP_MstCylVirtPTarValVld": Initializing, "ESP_MstCylTarPVld": Initializing, "ESP_VirtP": 1, "ESP_StopMain2BackupState": NotAvailable_Temporary, "ESP_MstCylTarP": 1}
    ${xcp_var_map}=    Evaluate    {"ESP_12A_CheckSum": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_12A_CheckSum", "ESP_12A_AliveCounter": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_12A_AliveCounter", "ESP_ExtBrkReqFlg": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_ExtBrkReqFlg", "ESP_FBldgCtrlSts": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_FBldgCtrlSts", "ESP_ExtBrkReq": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_ExtBrkReq", "ESP_MstCylVirtPTarValVld": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_MstCylVirtPTarValVld", "ESP_MstCylTarPVld": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_MstCylTarPVld", "ESP_VirtP": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_VirtP", "ESP_StopMain2BackupState": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_StopMain2BackupState", "ESP_MstCylTarP": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_MstCylTarP"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_12A_CheckSum": 1, "ESP_12A_AliveCounter": 0, "ESP_ExtBrkReqFlg": Qtarget_Off, "ESP_FBldgCtrlSts": PFC_Inactive, "ESP_ExtBrkReq": -252, "ESP_MstCylVirtPTarValVld": Initializing, "ESP_MstCylTarPVld": Initializing, "ESP_VirtP": 1, "ESP_StopMain2BackupState": NotAvailable_Temporary, "ESP_MstCylTarP": 1}
    Validate TX Message With Expected Values    ESP_0x12A    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_12A_CheckSum": 100, "ESP_12A_AliveCounter": 6, "ESP_ExtBrkReqFlg": Qtarget_EBR, "ESP_FBldgCtrlSts": PFC_Hold, "ESP_ExtBrkReq": 100, "ESP_MstCylVirtPTarValVld": Invalid, "ESP_MstCylTarPVld": Invalid, "ESP_VirtP": 100, "ESP_StopMain2BackupState": Activation_Pending, "ESP_MstCylTarP": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_12A_CheckSum": 100, "ESP_12A_AliveCounter": 6, "ESP_ExtBrkReqFlg": Qtarget_EBR, "ESP_FBldgCtrlSts": PFC_Hold, "ESP_ExtBrkReq": 100, "ESP_MstCylVirtPTarValVld": Invalid, "ESP_MstCylTarPVld": Invalid, "ESP_VirtP": 100, "ESP_StopMain2BackupState": Activation_Pending, "ESP_MstCylTarP": 100}
    Validate TX Message With Expected Values    ESP_0x12A   ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_v alues}=    Evaluate    {"ESP_12A_CheckSum": 255, "ESP_12A_AliveCounter": 14, "ESP_ExtBrkReqFlg": Undefined, "ESP_FBldgCtrlSts": PFC_Active, "ESP_ExtBrkReq": 252, "ESP_MstCylVirtPTarValVld": Reserved, "ESP_MstCylTarPVld": Reserved, "ESP_VirtP": 255, "ESP_StopMain2BackupState": Activated_FailOperation, "ESP_MstCylTarP": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_12A_CheckSum": 255, "ESP_12A_AliveCounter": 14, "ESP_ExtBrkReqFlg": Undefined, "ESP_FBldgCtrlSts": PFC_Active, "ESP_ExtBrkReq": 252, "ESP_MstCylVirtPTarValVld": Reserved, "ESP_MstCylTarPVld": Reserved, "ESP_VirtP": 255, "ESP_StopMain2BackupState": Activated_FailOperation, "ESP_MstCylTarP": 255}
    Validate TX Message With Expected Values    ESP_0x12A    ${expected_can_signals}    30

Send Tx XCP variables and validating on CAN signals for message ESP_0x1B8
    [Documentation]    Validate TX message 'ESP_0x1B8' by writing XCP variables and reading CAN signals

    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_1B8_CheckSum": 1, "ESP_1B8_AliveCounter": 0, "ESP_ModFbSig": Init, "ESP_ModSwtAllw": Not_Allowed, "ESP_ActvVehHldFlq": False, "ESP_VehSecuCdn": ParkSt_Other, "ESP_BrkFStsFlg": False, "ESP_CddApOpsDirMovmt": False, "ESP_VehStopSts": Not_Stop, "ESP_VehStandstillSts": Not_Standstill, "ESP_EPB_BenchMode": Not_Active, "ESP_RoadSlopVld": Initializing, "ESP_AEBRdy": Not_ready, "ESP_ACCRdy": Not_Ready, "ESP_ParkRdy": Not_ready, "ESP_ReAEBRdy": Not_ready, "ESP_SpclTerrainModFltIndcn": Not_Available, "ESP_DrvOffStRdy": False, "ESP_TarLSMSts": LSM_Off, "ESP_RoadSlop": -10}
    ${xcp_var_map}=    Evaluate    {"ESP_1B8_CheckSum"_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ModSwtAllw", "ESP_ActvVehHldFlq": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ActvVehHldFlg", "ESP_VehSecuCdn": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_VehSecuCdn", "ESP_BrkFStsFlg": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_BrkFStsFlg", "ESP_CddApOpsDirMovmt": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_CddApOpsDirMovmt", "ESP_VehStopSts": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_VehStopSts", "ESP_VehStandstillSts": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_VehStandstillSts", "ESP_EPB_BenchMode": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_EPB_BenchMode", "ESP_RoadSlopVld": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_RoadSlopVld", "ESP_AEBRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_AEBRdy", "ESP_ACCRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESPACCRdy", "ESP_ParkRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ParkRdy", "ESP_ReAEBRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ReAEBRdy", "ESP_SpclTerrainModFltIndcn": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_SpclTerrainModFltIndcn", "ESP_DrvOffStRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_DrvOffStRdy", "ESP_TarLSMSts": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_TarLSMSts", "ESP_RoadSlop": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_RoadSlop"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_1B8_CheckSum": 1, "ESP_1B8_AliveCounter": 0, "ESP_ModFbSig": Init, "ESP_ModSwtAllw": Not_Allowed, "ESP_ActvVehHldFlq": False, "ESP_VehSecuCdn": ParkSt_Other, "ESP_BrkFStsFlg": False, "ESP_CddApOpsDirMovmt": False, "ESP_VehStopSts": Not_Stop, "ESP_VehStandstillSts": Not_Standstill, "ESP_EPB_BenchMode": Not_Active, "ESP_RoadSlopVld": Initializing, "ESP_AEBRdy": Not_ready, "ESP_ACCRdy": Not_Ready, "ESP_ParkRdy": Not_ready, "ESP_ReAEBRdy": Not_ready, "ESP_SpclTerrainModFltIndcn": Not_Available, "ESP_DrvOffStRdy": False, "ESP_TarLSMSts": LSM_Off, "ESP_RoadSlop": -10}
    Validate TX Message With Expected Values    ESP_0x1B8    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_1B8_CheckSum": 100, "ESP_1B8_AliveCounter": 6, "ESP_ModFbSig": Sport, "ESP_ModSwtAllw": Not_Allowed, "ESP_ActvVehHldFlq": False, "ESP_VehSecuCdn": ParkSt_Reld, "ESP_BrkFStsFlg": False, "ESP_CddApOpsDirMovmt": False, "ESP_VehStopSts": Not_Stop, "ESP_VehStandstillSts": Not_Standstill, "ESP_EPB_BenchMode": Active, "ESP_RoadSlopVld": Invalid, "ESP_AEBRdy": Reserved, "ESP_ACCRdy": Ready, "ESP_ParkRdy": Reserved, "ESP_ReAEBRdy": Reserved, "ESP_SpclTerrainModFltIndcn": Not_Available, "ESP_DrvOffStRdy": False, "ESP_TarLSMSts": LSM_Off, "ESP_RoadSlop": 5}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_1B8_CheckSum": 100, "ESP_1B8_AliveCounter": 6, "ESP_ModFbSig": Sport, "ESP_ModSwtAllw": Not_Allowed, "ESP_ActvVehHldFlq": False, "ESP_VehSecuCdn": ParkSt_Reld, "ESP_BrkFStsFlg": False, "ESP_CddApOpsDirMovmt": False, "ESP_VehStopSts": Not_Stop, "ESP_VehStandstillSts": Not_Standstill, "ESP_EPB_BenchMode": Active, "ESP_RoadSlopVld": Invalid, "ESP_AEBRdy": Reserved, "ESP_ACCRdy": Ready, "ESP_ParkRdy": Reserved, "ESP_ReAEBRdy": Reserved, "ESP_SpclTerrainModFltIndcn": Not_Available, "ESP_DrvOffStRdy": False, "ESP_TarLSMSts": LSM_Off, "ESP_RoadSlop": 5}
    Validate TX Message With Expected Values    ESP_0x1B8   ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_1B8_CheckSum": 255, "ESP_1B8_AliveCounter": 14, "ESP_ModFbSig": Invalid, "ESP_ModSwtAllw": Allowed, "ESP_ActvVehHldFlq": True, "ESP_VehSecuCdn": ParkSt_ReqToutorOvrdn, "ESP_BrkFStsFlg": True, "ESP_CddApOpsDirMovmt": True, "ESP_VehStopSts": Stop, "ESP_VehStandstillSts": Standstill, "ESP_EPB_BenchMode": Invalid, "ESP_RoadSlopVld": Reserved, "ESP_AEBRdy": Invalid, "ESP_ACCRdy": Invalid, "ESP_ParkRdy": Invalid, "ESP_ReAEBRdy": Invalid, "ESP_SpclTerrainModFltIndcn": Available, "ESP_DrvOffStRdy": True, "ESP_TarLSMSts": LSM_On, "ESP_RoadSlop": 10}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_1B8_CheckSum": 255, "ESP_1B8_AliveCounter": 14, "ESP_ModFbSig": Invalid, "ESP_ModSwtAllw": Allowed, "ESP_ActvVehHldFlq": True, "ESP_VehSecuCdn": ParkSt_ReqToutorOvrdn, "ESP_BrkFStsFlg": True, "ESP_CddApOpsDirMovmt": True, "ESP_VehStopSts": Stop, "ESP_VehStandstillSts": Standstill, "ESP_EPB_BenchMode": Invalid, "ESP_RoadSlopVld": Reserved, "ESP_AEBRdy": Invalid, "ESP_ACCRdy": Invalid, "ESP_ParkRdy": Invalid, "ESP_ReAEBRdy": Invalid, "ESP_SpclTerrainModFltIndcn": Available, "ESP_DrvOffStRdy": True, "ESP_TarLSMSts": LSM_On, "ESP_RoadSlop": 10}
    Validate TX Message With Expected Values    ESP_0x1B8    ${expected_can_signals}    30