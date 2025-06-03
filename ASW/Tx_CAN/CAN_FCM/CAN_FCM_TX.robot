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

FCM-TX-0x531: Send Tx XCP variables and validating on CAN signals for message ICC_0x531
    [Documentation]    Validate TX message 'ICC_0x531' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_TotMilgVld_ODO": 0,"ICC_TotMilg_ODO": 0,"ICC_DispVehSpd": 0,"ICC_DispVehSpdUnit": 0,"ICC_ADASSigFlt": 0,"ICC_DispFlt": 0,"ICC_WorkshopMode": 0}
    ${xcp_var_map}=    Evaluate    {"ICC_TotMilgVld_ODO": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_TotMilgVld_ODO","ICC_TotMilg_ODO": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_TotMilg_ODO","ICC_DispVehSpd": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_DispVehSpd","ICC_DispVehSpdUnit": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_DispVehSpdUnit","ICC_ADASSigFlt": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_ADASSigFlt","ICC_DispFlt": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_DispFlt","ICC_WorkshopMode": "Rte_C_SG_ICC_0x531_adt_D61B3906D1B43337D03540B4EA3CB4D1.ICC_WorkshopMode",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_TotMilgVld_ODO": "Value_OK","ICC_TotMilg_ODO": 0,"ICC_DispVehSpd": 0,"ICC_DispVehSpdUnit": "KMH","ICC_ADASSigFlt": "No_Failure","ICC_DispFlt": "No_Error_No_error","ICC_WorkshopMode": "Init"}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    ICC_0x531    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_TotMilgVld_ODO": 1,"ICC_TotMilg_ODO": 300,"ICC_DispVehSpd": 120,"ICC_DispVehSpdUnit": 1,"ICC_ADASSigFlt": 1,"ICC_DispFlt": 1,"ICC_WorkshopMode": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_TotMilgVld_ODO": "Value_Unreliable","ICC_TotMilg_ODO": 300,"ICC_DispVehSpd": 120,"ICC_DispVehSpdUnit": "MPH","ICC_ADASSigFlt": "Reversible_Failure","ICC_DispFlt": "Error_error","ICC_WorkshopMode": "Active"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ICC_0x531    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_TotMilgVld_ODO": 1,"ICC_TotMilg_ODO": 400,"ICC_DispVehSpd": 255,"ICC_DispVehSpdUnit": 1,"ICC_ADASSigFlt": 3,"ICC_DispFlt": 1,"ICC_WorkshopMode": 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_TotMilgVld_ODO": "Value_Unreliable","ICC_TotMilg_ODO": 400,"ICC_DispVehSpd": 255,"ICC_DispVehSpdUnit": "MPH","ICC_ADASSigFlt": "Reserved","ICC_DispFlt": "Error_error","ICC_WorkshopMode": "Invalid"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ICC_0x531    ${expected_can_signals}    30

FCM-TX-0x429: Send Tx XCP variables and validating on CAN signals for message PKC_NM_0x429
    [Documentation]    Validate TX message 'PKC_NM_0x429' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"PKC_SrcNodeID": 0,"PKC_CtrlBitVector_Bit0_RMR": 0,"PKC_CtrlBitVector_Bit1_Res": 0,"PKC_CtrlBitVector_Bit2_Res": 0,"PKC_CtrlBitVector_Bit3_NMCoord": 0,"PKC_CtrlBitVector_Bit4_ActWake": 0,"PKC_CtrlBitVector_Bit5_Res": 0,"PKC_CtrlBitVector_Bit6_PNI": 0,"PKC_CtrlBitVector_Bit7_Res": 0,"PKC_UsrData0": 0,"PKC_UsrData1_Bit0_IGN_WAKEUP": 0,"PKC_UsrData1_Bit1_RESET_WAKEUP": 0,"PKC_UsrData1_Bit2_NETWORK_WAKEUP": 0,"PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": 0,"PKC_UsrData1_Bit4_NETWORK_AWAKE": 0,"PKC_UsrData1_Bit5_IGNITION_AWAKE": 0,"PKC_UsrData1_Bit6_DIAGN_AWAKE": 0,"PKC_UsrData1_Bit7_ECUSPEC_AWAKE": 0,"PKC_UsrData2": 0,"PKC_UsrData3": 0,"PKC_UsrData4_PN_Info1": 0,"PKC_UsrData5_PN_Info2": 0}
    ${xcp_var_map}=    Evaluate    {"PKC_SrcNodeID": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_SrcNodeID","PKC_CtrlBitVector_Bit0_RMR": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit0_RMR","PKC_CtrlBitVector_Bit1_Res": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit1_Res","PKC_CtrlBitVector_Bit2_Res": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit2_Res","PKC_CtrlBitVector_Bit3_NMCoord": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit3_NMCoord","PKC_CtrlBitVector_Bit4_ActWake": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit4_ActWake","PKC_CtrlBitVector_Bit5_Res": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit5_Res","PKC_CtrlBitVector_Bit6_PNI": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit6_PNI","PKC_CtrlBitVector_Bit7_Res": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_CtrlBitVector_Bit7_Res","PKC_UsrData0": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData0","PKC_UsrData1_Bit0_IGN_WAKEUP": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit0_IGN_WAKEUP","PKC_UsrData1_Bit1_RESET_WAKEUP": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit1_RESET_WAKEUP","PKC_UsrData1_Bit2_NETWORK_WAKEUP": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit2_NETWORK_WAKEUP","PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit3_ECUSPEC_WAKEUP","PKC_UsrData1_Bit4_NETWORK_AWAKE": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit4_NETWORK_AWAKE","PKC_UsrData1_Bit5_IGNITION_AWAKE": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit5_IGNITION_AWAKE","PKC_UsrData1_Bit6_DIAGN_AWAKE": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit6_DIAGN_AWAKE","PKC_UsrData1_Bit7_ECUSPEC_AWAKE": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData1_Bit7_ECUSPEC_AWAKE","PKC_UsrData2": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData2","PKC_UsrData3": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData3","PKC_UsrData4_PN_Info1": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData4_PN_Info1","PKC_UsrData5_PN_Info2": "Rte_C_SG_PKC_NM_0x429_adt_93B1296C12AB6A91EC19DD9059B16582.PKC_UsrData5_PN_Info2",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"PKC_SrcNodeID": 0,"PKC_CtrlBitVector_Bit0_RMR": "Repeat_Message_State_not_requested","PKC_CtrlBitVector_Bit1_Res": 0,"PKC_CtrlBitVector_Bit2_Res": 0,"PKC_CtrlBitVector_Bit3_NMCoord": "Start_of_synchronized_shutdown_is_not_requested_by_main_coordinator","PKC_CtrlBitVector_Bit4_ActWake": "Node_has_not_woken_up_the_network_(passive_wakeup)","PKC_CtrlBitVector_Bit5_Res": 0,"PKC_CtrlBitVector_Bit6_PNI": "NM_PDU_contains_no_Partial_Network_request_information","PKC_CtrlBitVector_Bit7_Res": 0,"PKC_UsrData0": "User_data_for_current_vehicle_without_partial_networking","PKC_UsrData1_Bit0_IGN_WAKEUP": "inactive","PKC_UsrData1_Bit1_RESET_WAKEUP": "inactive","PKC_UsrData1_Bit2_NETWORK_WAKEUP": "inactive","PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": "inactive","PKC_UsrData1_Bit4_NETWORK_AWAKE": "inactive","PKC_UsrData1_Bit5_IGNITION_AWAKE": "inactive","PKC_UsrData1_Bit6_DIAGN_AWAKE": "inactive","PKC_UsrData1_Bit7_ECUSPEC_AWAKE": "inactive","PKC_UsrData2": 0,"PKC_UsrData3": 0,"PKC_UsrData4_PN_Info1": 0,"PKC_UsrData5_PN_Info2": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    PKC_NM_0x429    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"PKC_SrcNodeID": 100,"PKC_CtrlBitVector_Bit0_RMR": 0,"PKC_CtrlBitVector_Bit1_Res": 0,"PKC_CtrlBitVector_Bit2_Res": 0,"PKC_CtrlBitVector_Bit3_NMCoord": 0,"PKC_CtrlBitVector_Bit4_ActWake": 0,"PKC_CtrlBitVector_Bit5_Res": 0,"PKC_CtrlBitVector_Bit6_PNI": 0,"PKC_CtrlBitVector_Bit7_Res": 0,"PKC_UsrData0": 0,"PKC_UsrData1_Bit0_IGN_WAKEUP": 0,"PKC_UsrData1_Bit1_RESET_WAKEUP": 0,"PKC_UsrData1_Bit2_NETWORK_WAKEUP": 0,"PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": 0,"PKC_UsrData1_Bit4_NETWORK_AWAKE": 0,"PKC_UsrData1_Bit5_IGNITION_AWAKE": 0,"PKC_UsrData1_Bit6_DIAGN_AWAKE": 0,"PKC_UsrData1_Bit7_ECUSPEC_AWAKE": 0,"PKC_UsrData2": 100,"PKC_UsrData3": 100,"PKC_UsrData4_PN_Info1": 100,"PKC_UsrData5_PN_Info2": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"PKC_SrcNodeID": 100,"PKC_CtrlBitVector_Bit0_RMR": "Repeat_Message_State_not_requested","PKC_CtrlBitVector_Bit1_Res": 0,"PKC_CtrlBitVector_Bit2_Res": 0,"PKC_CtrlBitVector_Bit3_NMCoord": "Start_of_synchronized_shutdown_is_not_requested_by_main_coordinator","PKC_CtrlBitVector_Bit4_ActWake": "Node_has_not_woken_up_the_network_(passive_wakeup)","PKC_CtrlBitVector_Bit5_Res": 0,"PKC_CtrlBitVector_Bit6_PNI": "NM_PDU_contains_no_Partial_Network_request_information","PKC_CtrlBitVector_Bit7_Res": 0,"PKC_UsrData0": "User_data_for_current_vehicle_without_partial_networking","PKC_UsrData1_Bit0_IGN_WAKEUP": "inactive","PKC_UsrData1_Bit1_RESET_WAKEUP": "inactive","PKC_UsrData1_Bit2_NETWORK_WAKEUP": "inactive","PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": "inactive","PKC_UsrData1_Bit4_NETWORK_AWAKE": "inactive","PKC_UsrData1_Bit5_IGNITION_AWAKE": "inactive","PKC_UsrData1_Bit6_DIAGN_AWAKE": "inactive","PKC_UsrData1_Bit7_ECUSPEC_AWAKE": "inactive","PKC_UsrData2": 100,"PKC_UsrData3": 100,"PKC_UsrData4_PN_Info1": 100,"PKC_UsrData5_PN_Info2": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    PKC_NM_0x429    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"PKC_SrcNodeID": 127,"PKC_CtrlBitVector_Bit0_RMR": 1,"PKC_CtrlBitVector_Bit1_Res": 0,"PKC_CtrlBitVector_Bit2_Res": 0,"PKC_CtrlBitVector_Bit3_NMCoord": 1,"PKC_CtrlBitVector_Bit4_ActWake": 1,"PKC_CtrlBitVector_Bit5_Res": 0,"PKC_CtrlBitVector_Bit6_PNI": 1,"PKC_CtrlBitVector_Bit7_Res": 0,"PKC_UsrData0": 1,"PKC_UsrData1_Bit0_IGN_WAKEUP": 1,"PKC_UsrData1_Bit1_RESET_WAKEUP": 1,"PKC_UsrData1_Bit2_NETWORK_WAKEUP": 1,"PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": 1,"PKC_UsrData1_Bit4_NETWORK_AWAKE": 1,"PKC_UsrData1_Bit5_IGNITION_AWAKE": 1,"PKC_UsrData1_Bit6_DIAGN_AWAKE": 1,"PKC_UsrData1_Bit7_ECUSPEC_AWAKE": 1,"PKC_UsrData2": 255,"PKC_UsrData3": 255,"PKC_UsrData4_PN_Info1": 255,"PKC_UsrData5_PN_Info2": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"PKC_SrcNodeID": 127,"PKC_CtrlBitVector_Bit0_RMR": "Repeat_Message_State_requested","PKC_CtrlBitVector_Bit1_Res": 0,"PKC_CtrlBitVector_Bit2_Res": 0,"PKC_CtrlBitVector_Bit3_NMCoord": "Start_of_synchronized_shutdown_is_requested_by_main_coordinator","PKC_CtrlBitVector_Bit4_ActWake": "Node_has_woken_up_the_network_(active_Wakeup)","PKC_CtrlBitVector_Bit5_Res": 0,"PKC_CtrlBitVector_Bit6_PNI": "NM_PDU_contains_Partial_Network_request_information","PKC_CtrlBitVector_Bit7_Res": 0,"PKC_UsrData0": "User_data_for_current_vehicle_with_partial_networking","PKC_UsrData1_Bit0_IGN_WAKEUP": "active","PKC_UsrData1_Bit1_RESET_WAKEUP": "active","PKC_UsrData1_Bit2_NETWORK_WAKEUP": "active","PKC_UsrData1_Bit3_ECUSPEC_WAKEUP": "active","PKC_UsrData1_Bit4_NETWORK_AWAKE": "active","PKC_UsrData1_Bit5_IGNITION_AWAKE": "active","PKC_UsrData1_Bit6_DIAGN_AWAKE": "active","PKC_UsrData1_Bit7_ECUSPEC_AWAKE": "active","PKC_UsrData2": 255,"PKC_UsrData3": 255,"PKC_UsrData4_PN_Info1": 255,"PKC_UsrData5_PN_Info2": 255}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    PKC_NM_0x429    ${expected_can_signals}    30

FCM-TX-0x174: Send Tx XCP variables and validating on CAN signals for message TBOX_0x174
    [Documentation]    Validate TX message 'TBOX_0x174' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_174_CheckSum": 0,"TBOX_174_AliveCounter": 0,"TBOX_XAcce": -327,"TBOX_XVelocity": -32786,"TBOX_XAgrRate": -327}
    ${xcp_var_map}=    Evaluate    {"TBOX_174_CheckSum": "Rte_C_SG_TBOX_0x174_adt_FBC9FD7E0EA06DE042C8795A4C833BA8.TBOX_174_CheckSum","TBOX_174_AliveCounter": "Rte_C_SG_TBOX_0x174_adt_FBC9FD7E0EA06DE042C8795A4C833BA8.TBOX_174_AliveCounter","TBOX_XAcce": "Rte_C_SG_TBOX_0x174_adt_FBC9FD7E0EA06DE042C8795A4C833BA8.TBOX_XAcce","TBOX_XVelocity": "Rte_C_SG_TBOX_0x174_adt_FBC9FD7E0EA06DE042C8795A4C833BA8.TBOX_XVelocity","TBOX_XAgrRate": "Rte_C_SG_TBOX_0x174_adt_FBC9FD7E0EA06DE042C8795A4C833BA8.TBOX_XAgrRate",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_174_CheckSum": 0,"TBOX_174_AliveCounter": 0,"TBOX_XAcce": -327,"TBOX_XVelocity": -32786,"TBOX_XAgrRate": -327}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    TBOX_0x174    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_174_CheckSum": 100,"TBOX_174_AliveCounter": 7,"TBOX_XAcce": 100,"TBOX_XVelocity": 3000,"TBOX_XAgrRate": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_174_CheckSum": 100,"TBOX_174_AliveCounter": 7,"TBOX_XAcce": 100,"TBOX_XVelocity": 3000,"TBOX_XAgrRate": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x174    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_174_CheckSum": 255,"TBOX_174_AliveCounter": 14,"TBOX_XAcce": 327,"TBOX_XVelocity": 32767,"TBOX_XAgrRate": 327}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_174_CheckSum": 255,"TBOX_174_AliveCounter": 14,"TBOX_XAcce": 327,"TBOX_XVelocity": 32767,"TBOX_XAgrRate": 327}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x174    ${expected_can_signals}    30

FCM-TX-0x176: Send Tx XCP variables and validating on CAN signals for message TBOX_0x176

    [Documentation]    Validate TX message 'TBOX_0x176' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_176_CheckSum": 0,"TBOX_176_AliveCounter": 0,"TBOX_ZAcce": -327,"TBOX_ZVelocity": -32786,"TBOX_ZAgrRate": -327}
    ${xcp_var_map}=    Evaluate    {"TBOX_176_CheckSum": "Rte_C_SG_TBOX_0x176_adt_C9CF9F708ADED2371F07E7C9287B5A63.TBOX_176_CheckSum","TBOX_176_AliveCounter": "Rte_C_SG_TBOX_0x176_adt_C9CF9F708ADED2371F07E7C9287B5A63.TBOX_176_AliveCounter","TBOX_ZAcce": "Rte_C_SG_TBOX_0x176_adt_C9CF9F708ADED2371F07E7C9287B5A63.TBOX_ZAcce","TBOX_ZVelocity": "Rte_C_SG_TBOX_0x176_adt_C9CF9F708ADED2371F07E7C9287B5A63.TBOX_ZVelocity","TBOX_ZAgrRate": "Rte_C_SG_TBOX_0x176_adt_C9CF9F708ADED2371F07E7C9287B5A63.TBOX_ZAgrRate",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_176_CheckSum": 0,"TBOX_176_AliveCounter": 0,"TBOX_ZAcce": -327,"TBOX_ZVelocity": -32786,"TBOX_ZAgrRate": -327}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    TBOX_0x176    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_176_CheckSum": 100,"TBOX_176_AliveCounter": 7,"TBOX_ZAcce": 100,"TBOX_ZVelocity": 3000,"TBOX_ZAgrRate": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_176_CheckSum": 100,"TBOX_176_AliveCounter": 7,"TBOX_ZAcce": 100,"TBOX_ZVelocity": 3000,"TBOX_ZAgrRate": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x176    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_176_CheckSum": 255,"TBOX_176_AliveCounter": 14,"TBOX_ZAcce": 327,"TBOX_ZVelocity": 32767,"TBOX_ZAgrRate": 327}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_176_CheckSum": 255,"TBOX_176_AliveCounter": 14,"TBOX_ZAcce": 327,"TBOX_ZVelocity": 32767,"TBOX_ZAgrRate": 327}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x176    ${expected_can_signals}    30

FCM-TX-0x175: Send Tx XCP variables and validating on CAN signals for message TBOX_0x175
    [Documentation]    Validate TX message 'TBOX_0x175' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_175_CheckSum": 0,"TBOX_175_AliveCounter": 0,"TBOX_YAcce": -327,"TBOX_YVelocity": -32786,"TBOX_YAgrRate": -327}
    ${xcp_var_map}=    Evaluate    {"TBOX_175_CheckSum": "Rte_C_SG_TBOX_0x175_adt_C3B9626778116B6923216611E56BC855.TBOX_175_CheckSum","TBOX_175_AliveCounter": "Rte_C_SG_TBOX_0x175_adt_C3B9626778116B6923216611E56BC855.TBOX_175_AliveCounter","TBOX_YAcce": "Rte_C_SG_TBOX_0x175_adt_C3B9626778116B6923216611E56BC855.TBOX_YAcce","TBOX_YVelocity": "Rte_C_SG_TBOX_0x175_adt_C3B9626778116B6923216611E56BC855.TBOX_YVelocity","TBOX_YAgrRate": "Rte_C_SG_TBOX_0x175_adt_C3B9626778116B6923216611E56BC855.TBOX_YAgrRate",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_175_CheckSum": 0,"TBOX_175_AliveCounter": 0,"TBOX_YAcce": -327,"TBOX_YVelocity": -32786,"TBOX_YAgrRate": -327}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    TBOX_0x175    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_175_CheckSum": 100,"TBOX_175_AliveCounter": 7,"TBOX_YAcce": 100,"TBOX_YVelocity": 3000,"TBOX_YAgrRate": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_175_CheckSum": 100,"TBOX_175_AliveCounter": 7,"TBOX_YAcce": 100,"TBOX_YVelocity": 3000,"TBOX_YAgrRate": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x175    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_175_CheckSum": 255,"TBOX_175_AliveCounter": 14,"TBOX_YAcce": 327,"TBOX_YVelocity": 32767,"TBOX_YAgrRate": 327}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_175_CheckSum": 255,"TBOX_175_AliveCounter": 14,"TBOX_YAcce": 327,"TBOX_YVelocity": 32767,"TBOX_YAgrRate": 327}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x175    ${expected_can_signals}    30


FCM-TX-0x177: Send Tx XCP variables and validating on CAN signals for message TBOX_0x177
    [Documentation]    Validate TX message 'TBOX_0x177' by writing XCP variables and reading CAN signals

    Log    writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_177_CheckSum": 0,"TBOX_177_AliveCounter": 0,"TBOX_DftlAge": 300,"TBOX_Pitch_A": -180,"TBOX_PitchStdDev": 0}
    ${xcp_var_map}=    Evaluate    {"TBOX_177_CheckSum": "Rte_C_SG_TBOX_0x177_adt_DE1DDADEADED1F5983CB613F90018C24.TBOX_177_CheckSum","TBOX_177_AliveCounter": "Rte_C_SG_TBOX_0x177_adt_DE1DDADEADED1F5983CB613F90018C24.TBOX_177_AliveCounter","TBOX_DftlAge": "Rte_C_SG_TBOX_0x177_adt_DE1DDADEADED1F5983CB613F90018C24.TBOX_DftlAge","TBOX_Pitch_A": "Rte_C_SG_TBOX_0x177_adt_DE1DDADEADED1F5983CB613F90018C24.TBOX_Pitch_A","TBOX_PitchStdDev": "Rte_C_SG_TBOX_0x177_adt_DE1DDADEADED1F5983CB613F90018C24.TBOX_PitchStdDev",}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_177_CheckSum": 0,"TBOX_177_AliveCounter": 0,"TBOX_DftlAge": 300,"TBOX_Pitch_A": -180,"TBOX_PitchStdDev": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    TBOX_0x177    ${expected_can_signals}    30

    Log    writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_177_CheckSum": 100,"TBOX_177_AliveCounter": 7,"TBOX_DftlAge": 5000,"TBOX_Pitch_A": 90,"TBOX_PitchStdDev": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_177_CheckSum": 100,"TBOX_177_AliveCounter": 7,"TBOX_DftlAge": 5000,"TBOX_Pitch_A": 90,"TBOX_PitchStdDev": 100}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x177    ${expected_can_signals}    30

    Log    writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"TBOX_177_CheckSum": 255,"TBOX_177_AliveCounter": 14,"TBOX_DftlAge": 65000,"TBOX_Pitch_A": 180,"TBOX_PitchStdDev": 179}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"TBOX_177_CheckSum": 255,"TBOX_177_AliveCounter": 14,"TBOX_DftlAge": 65000,"TBOX_Pitch_A": 180,"TBOX_PitchStdDev": 179}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    TBOX_0x177    ${expected_can_signals}    30

FCM-TX-0x116: Send Tx XCP variables and validating on CAN signals for message ESP_0x116
    [Documentation]    Validate TX message 'ESP_0x116' by writing XCP variables and reading CAN signals

    ${xcp_values}=    Evaluate    {"ESP_116_CheckSum": 1, "ESP_116_AliveCounter": 0, "ESP_WhlSpdVld_RR": 0, "ESP_WhlSpd_RR": 1, "ESP_WhlMovgDir_RR": 0, "ESP_WhlMovgDir_RL": 0, "ESP_WhlSpdVld_RL": 0, "ESP_WhlSpd_RL": 0}
    ${xcp_var_map}=    Evaluate    {"ESP_116_CheckSum": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_116_CheckSum", "ESP_116_AliveCounter": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_116_AliveCounter", "ESP_WhlSpdVld_RR": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpdVld_RR", "ESP_WhlSpd_RR": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpd_RR", "ESP_WhlMovgDir_RR": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlMovgDir_RR", "ESP_WhlMovgDir_RL": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlMovgDir_RL", "ESP_WhlSpdVld_RL": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpdVld_RL", "ESP_WhlSpd_RL": "Rte_C_SG_ESP_0x116_adt_95C837244DF06A1CC35067C68C426722.ESP_WhlSpd_RL"}

    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_116_CheckSum": 1, "ESP_116_AliveCounter": 0, "ESP_WhlSpdVld_RR": "Initializing", "ESP_WhlSpd_RR": 1, "ESP_WhlMovgDir_RR": "Init", "ESP_WhlMovgDir_RL": "Init", "ESP_WhlSpdVld_RL": "Initializing", "ESP_WhlSpd_RL": 0}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ESP_0x116    ${expected_can_signals}    30

    Log    Writing mid value to the XCP variables
    ${xcp_values}=    Evaluate    {"ESP_116_CheckSum": 100, "ESP_116_AliveCounter": 6, "ESP_WhlSpdVld_RR": 2, "ESP_WhlSpd_RR": 50, "ESP_WhlMovgDir_RR": 3, "ESP_WhlMovgDir_RL": 3, "ESP_WhlSpdVld_RL": 2, "ESP_WhlSpd_RL": 50}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}

    ${expected_can_signals}=    Evaluate    {"ESP_116_CheckSum": 100, "ESP_116_AliveCounter": 6, "ESP_WhlSpdVld_RR": "Invalid", "ESP_WhlSpd_RR": 50, "ESP_WhlMovgDir_RR": "Stop", "ESP_WhlMovgDir_RL": "Stop", "ESP_WhlSpdVld_RL": "Invalid", "ESP_WhlSpd_RL": 50}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ESP_0x116    ${expected_can_signals}    30

    Log    Writing max value to the XCP variables
    ${xcp_values}=    Evaluate    {"ESP_116_CheckSum": 255, "ESP_116_AliveCounter": 14, "ESP_WhlSpdVld_RR": 3, "ESP_WhlSpd_RR": 300, "ESP_WhlMovgDir_RR": 2, "ESP_WhlMovgDir_RL": 2, "ESP_WhlSpdVld_RL": 3, "ESP_WhlSpd_RL": 300}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}

    ${expected_can_signals}=    Evaluate    {"ESP_116_CheckSum": 255, "ESP_116_AliveCounter": 14, "ESP_WhlSpdVld_RR": "Reserved", "ESP_WhlSpd_RR": 300, "ESP_WhlMovgDir_RR": "Backward", "ESP_WhlMovgDir_RL": "Backward", "ESP_WhlSpdVld_RL": "Reserved", "ESP_WhlSpd_RL": 300}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ESP_0x116    ${expected_can_signals}    30

FCM-TX-0x120: Send Tx XCP variables and validating on CAN signals for message ESP_0x120
    [Documentation]    Validate TX message 'ESP_0x120' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_120_CheckSum": 1, "ESP_120_AliveCounter": 0, "ESP_ActvSig_ABS": 0, "ESP_MstCylPVld": 0, "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": 0, "ESP_TotBrkTqReq": 1}
    ${xcp_var_map}=    Evaluate    {"ESP_120_CheckSum": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_120_CheckSum", "ESP_120_AliveCounter": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_120_AliveCounter", "ESP_ActvSig_ABS": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_ActvSig_ABS", "ESP_MstCylPVld": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylPVld", "ESP_MstCylP": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylP", "ESP_MstCylPOffs": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylPOffs", "ESP_MstCylPOffsVld": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_MstCylPOffsVld", "ESP_TotBrkTqReq": "Rte_C_SG_ESP_0x120_adt_EFF829A85F8E28D5EA8DB3CCA8795C92.ESP_TotBrkTqReq"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_120_CheckSum": 1, "ESP_120_AliveCounter": 0, "ESP_ActvSig_ABS": "ABS_Standby", "ESP_MstCylPVld": "Initializing", "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": "Initializing", "ESP_TotBrkTqReq": 1}
    Validate TX Message With Expected Values  ESP_0x120    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_120_CheckSum": 100, "ESP_120_AliveCounter": 6, "ESP_ActvSig_ABS": 0, "ESP_MstCylPVld": 1, "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": 1, "ESP_TotBrkTqReq": 5}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_120_CheckSum": 100, "ESP_120_AliveCounter": 6, "ESP_ActvSig_ABS": "ABS_Standby", "ESP_MstCylPVld": "Valid", "ESP_MstCylP": 0, "ESP_MstCylPOffs": 1, "ESP_MstCylPOffsVld": "Valid", "ESP_TotBrkTqReq": 5}
    Validate TX Message With Expected Values    ESP_0x120    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_120_CheckSum": 255, "ESP_120_AliveCounter": 14, "ESP_ActvSig_ABS": 1, "ESP_MstCylPVld": 3, "ESP_MstCylP": 276.6, "ESP_MstCylPOffs": 2, "ESP_MstCylPOffsVld": 3, "ESP_TotBrkTqReq": 30000}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_120_CheckSum": 255, "ESP_120_AliveCounter": 14, "ESP_ActvSig_ABS": "ABS_Actually_Operating", "ESP_MstCylPVld": "Reserved", "ESP_MstCylP": 276.6, "ESP_MstCylPOffs": 2, "ESP_MstCylPOffsVld": "Reserved", "ESP_TotBrkTqReq": 30000}
    Validate TX Message With Expected Values    ESP_0x120    ${expected_can_signals}    30

FCM-TX-0x125: Send Tx XCP variables and validating on CAN signals for message ESP_0x125
    [Documentation]    Validate TX message 'ESP_0x125' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_125_CheckSum": 1, "ESP_125_AliveCounter": 0, "ESP_WhlOdoEdges_FL": 2, "ESP_WhlOdoEdges_FR": 3, "ESP_WhlOdoEdges_RL": 4, "ESP_WhlOdoEdges_RR": 5, "ESP_WhlOdoEdgesVld_FL": 0, "ESP_WhlOdoEdgesVld_FR": 0, "ESP_WhlOdoEdgesVld_RL": 0, "ESP_WhlOdoEdgesVld_RR": 0}
    ${xcp_var_map}=    Evaluate    {"ESP_125_CheckSum": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_125_CheckSum", "ESP_125_AliveCounter": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_125_AliveCounter", "ESP_WhlOdoEdges_FL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_FL", "ESP_WhlOdoEdges_FR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_FR", "ESP_WhlOdoEdges_RL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_RL", "ESP_WhlOdoEdges_RR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdges_RR", "ESP_WhlOdoEdgesVld_FL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_FL", "ESP_WhlOdoEdgesVld_FR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_FR", "ESP_WhlOdoEdgesVld_RL": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_RL", "ESP_WhlOdoEdgesVld_RR": "Rte_C_SG_ESP_0x125_adt_C9C4B535BC0F04C406C70C4B5C600682.ESP_WhlOdoEdgesVld_RR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_125_CheckSum": 1, "ESP_125_AliveCounter": 0, "ESP_WhlOdoEdges_FL": 2, "ESP_WhlOdoEdges_FR": 3, "ESP_WhlOdoEdges_RL": 4, "ESP_WhlOdoEdges_RR": 5, "ESP_WhlOdoEdgesVld_FL": "Initializing", "ESP_WhlOdoEdgesVld_FR": "Initializing", "ESP_WhlOdoEdgesVld_RL": "Initializing", "ESP_WhlOdoEdgesVld_RR": "Initializing"}
    Validate TX Message With Expected Values    ESP_0x125    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_125_CheckSum": 100, "ESP_125_AliveCounter": 6, "ESP_WhlOdoEdges_FL": 100, "ESP_WhlOdoEdges_FR": 100, "ESP_WhlOdoEdges_RL": 100, "ESP_WhlOdoEdges_RR": 100, "ESP_WhlOdoEdgesVld_FL": 2, "ESP_WhlOdoEdgesVld_FR": 2, "ESP_WhlOdoEdgesVld_RL": 2, "ESP_WhlOdoEdgesVld_RR": 2}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_125_CheckSum": 100, "ESP_125_AliveCounter": 6, "ESP_WhlOdoEdges_FL": 100, "ESP_WhlOdoEdges_FR": 100, "ESP_WhlOdoEdges_RL": 100, "ESP_WhlOdoEdges_RR": 100, "ESP_WhlOdoEdgesVld_FL": "Invalid", "ESP_WhlOdoEdgesVld_FR": "Invalid", "ESP_WhlOdoEdgesVld_RL": "Invalid", "ESP_WhlOdoEdgesVld_RR": "Invalid"}
    Validate TX Message With Expected Values    ESP_0x125   ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_125_CheckSum": 255, "ESP_125_AliveCounter": 14, "ESP_WhlOdoEdges_FL": 255, "ESP_WhlOdoEdges_FR": 255, "ESP_WhlOdoEdges_RL": 255, "ESP_WhlOdoEdges_RR": 255, "ESP_WhlOdoEdgesVld_FL": 3, "ESP_WhlOdoEdgesVld_FR": 3, "ESP_WhlOdoEdgesVld_RL": 3, "ESP_WhlOdoEdgesVld_RR": 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_125_CheckSum": 255, "ESP_125_AliveCounter": 14, "ESP_WhlOdoEdges_FL": 255, "ESP_WhlOdoEdges_FR": 255, "ESP_WhlOdoEdges_RL": 255, "ESP_WhlOdoEdges_RR": 255, "ESP_WhlOdoEdgesVld_FL": "Reserved", "ESP_WhlOdoEdgesVld_FR": "Reserved", "ESP_WhlOdoEdgesVld_RL": "Reserved", "ESP_WhlOdoEdgesVld_RR": "Reserved"}
    Validate TX Message With Expected Values    ESP_0x125    ${expected_can_signals}    30



FCM-TX-0x318: Send Tx XCP variables and validating on CAN signals for message ESP_0x318
    [Documentation]    Validate TX message 'ESP_0x318' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_318_CheckSum": 1, "ESP_318_AliveCounter": 0, "ESP_BrkPedlStsVld": 0, "ESP_BrkPedlSts": 0, "ESP_VehSpdVld": 0, "ESP_SysActv": 0, "ESP_LampSwtOffIndcn": 0, "ESP_FltIndcn_EBD": 0, "ESP_FltIndcn_ABS": 0, "ESP_MilgRollgCntr_ODO": 0, "ESP_VehSpd": 0, "ESP_IninModSigIndcn": 0, "ESP_FltIndcn_TCS": 0, "ESP_CtrlSts_HDC": 0, "ESP_AvlIndcn_HDC": 1, "ESP_NoBrkP": 0, "ESP_RDAEnaFlg": 0}
    ${xcp_var_map}=    Evaluate    {"ESP_318_CheckSum" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_318_CheckSum", "ESP_318_AliveCounter" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_318_AliveCounter", "ESP_BrkPedlStsVld" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_BrkPedlStsVld", "ESP_BrkPedlSts" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_BrkPedlSts", "ESP_VehSpdVld" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_VehSpdVld", "ESP_SysActv" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_SysActv", "ESP_LampSwtOffIndcn" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_LampSwtOffIndcn", "ESP_FltIndcn_EBD" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_FltIndcn_EBD", "ESP_FltIndcn_ABS" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_FltIndcn_ABS", "ESP_MilgRollgCntr_ODO" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_MilgRollgCntr_ODO", "ESP_VehSpd" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_VehSpd", "ESP_IninModSigIndcn" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_IninModSigIndcn", "ESP_FltIndcn_TCS" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_FltIndcn_TCS", "ESP_CtrlSts_HDC" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_CtrlSts_HDC", "ESP_AvlIndcn_HDC" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_AvlIndcn_HDC", "ESP_NoBrkP" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_NoBrkP", "ESP_RDAEnaFlg" : "Rte_C_SG_ESP_0x318_adt_F02716FFB698CB3B9900E402CEFFAFE7.ESP_RDAEnaFlg"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_318_CheckSum": 1, "ESP_318_AliveCounter": 0, "ESP_BrkPedlStsVld": "Initializing", "ESP_BrkPedlSts": "Brake_Pedal_Not_Pressed", "ESP_VehSpdVld": "Initializing", "ESP_SysActv": "No_Telltale_Requested", "ESP_LampSwtOffIndcn": "No_Telltale_Requested", "ESP_FltIndcn_EBD": "No_Telltale_Requested", "ESP_FltIndcn_ABS": "No_Telltale_Requested", "ESP_MilgRollgCntr_ODO": 0, "ESP_VehSpd": 0, "ESP_IninModSigIndcn": "Not_In_Initialization_Mode", "ESP_FltIndcn_TCS": "No_Telltale_Requested", "ESP_CtrlSts_HDC": "Off", "ESP_AvlIndcn_HDC": "Not_Available", "ESP_NoBrkP": "Exist_Brk_Force", "ESP_RDAEnaFlg": "Inactive_not_enabled"}
    Validate TX Message With Expected Values    ESP_0x318    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_318_CheckSum": 100, "ESP_318_AliveCounter": 6, "ESP_BrkPedlStsVld": 2, "ESP_BrkPedlSts": 0, "ESP_VehSpdVld": 2, "ESP_SysActv": 0, "ESP_LampSwtOffIndcn": 0, "ESP_FltIndcn_EBD": 0, "ESP_FltIndcn_ABS": 0, "ESP_MilgRollgCntr_ODO": 200, "ESP_VehSpd": 300, "ESP_IninModSigIndcn": 0, "ESP_FltIndcn_TCS": 0, "ESP_CtrlSts_HDC": 1, "ESP_AvlIndcn_HDC": 1, "ESP_NoBrkP": 0, "ESP_RDAEnaFlg": 0}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_318_CheckSum": 100, "ESP_318_AliveCounter": 6, "ESP_BrkPedlStsVld": "Invalid", "ESP_BrkPedlSts": "Brake_Pedal_Not_Pressed", "ESP_VehSpdVld": "Invalid", "ESP_SysActv": "No_Telltale_Requested", "ESP_LampSwtOffIndcn": "No_Telltale_Requested", "ESP_FltIndcn_EBD": "No_Telltale_Requested", "ESP_FltIndcn_ABS": "No_Telltale_Requested", "ESP_MilgRollgCntr_ODO": 200, "ESP_VehSpd": 300, "ESP_IninModSigIndcn": "Not_In_Initialization_Mode", "ESP_FltIndcn_TCS": "No_Telltale_Requested", "ESP_CtrlSts_HDC": "On_Active_Braking", "ESP_AvlIndcn_HDC": "Not_Available", "ESP_NoBrkP": "Exist_Brk_Force", "ESP_RDAEnaFlg": "Inactive_not_enabled"}
    Validate TX Message With Expected Values    ESP_0x318    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_318_CheckSum": 255, "ESP_318_AliveCounter": 14, "ESP_BrkPedlStsVld": 3, "ESP_BrkPedlSts": 1, "ESP_VehSpdVld": 3, "ESP_SysActv": 1, "ESP_LampSwtOffIndcn": 1, "ESP_FltIndcn_EBD": 1, "ESP_FltIndcn_ABS": 1, "ESP_MilgRollgCntr_ODO": 65535, "ESP_VehSpd": 550, "ESP_IninModSigIndcn": 1, "ESP_FltIndcn_TCS": 1, "ESP_CtrlSts_HDC": 2, "ESP_AvlIndcn_HDC": 0, "ESP_NoBrkP": 1, "ESP_RDAEnaFlg": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_318_CheckSum": 255, "ESP_318_AliveCounter": 14, "ESP_BrkPedlStsVld": "Reserved", "ESP_BrkPedlSts": "Brake_Pedal_Pressed", "ESP_VehSpdVld": "Reserved", "ESP_SysActv": "Telltale_Requested", "ESP_LampSwtOffIndcn": "Telltale_Requested", "ESP_FltIndcn_EBD": "Telltale_Requested", "ESP_FltIndcn_ABS": "Telltale_Requested", "ESP_MilgRollgCntr_ODO": 65535, "ESP_VehSpd": 550, "ESP_IninModSigIndcn": "In_Intialization_Mode", "ESP_FltIndcn_TCS": "Telltale_Requested", "ESP_CtrlSts_HDC": "On_Not_Active_Braking", "ESP_AvlIndcn_HDC": "Available", "ESP_NoBrkP": "No_Brk_Force", "ESP_RDAEnaFlg": "Active_enable"}
    Validate TX Message With Expected Values    ESP_0x318    ${expected_can_signals}    30


FCM-TX-0x43E: Send Tx XCP variables and validating on CAN signals for message GW_NM_0x43E
    [Documentation]    Validate TX message 'GW_NM_0x43E' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"GW_SrcNodeId" : 0, "GW_CtrlBitVector_Bit0_RMR" : 0, "GW_CtrlBitVector_Bit1_Res" : 0, "GW_CtrlBitVector_Bit2_Res" : 0, "GW_CtrlBitVector_Bit3_NMCoord" : 0, "GW_CtrlBitVector_Bit4_ActWake" : 0, "GW_CtrlBitVector_Bit5_Res" : 0, "GW_CtrlBitVector_Bit6_PNI" : 0, "GW_CtrlBitVector_Bit7_Res" : 0, "GW_UsrData0" : 0, "GW_UsrData1_Bit0_IGN_WAKEUP" : 0, "GW_UsrData1_Bit1_RESET_WAKEUP" : 0, "GW_UsrData1_Bit2_NETWORK_WAKEUP" : 0, "GW_UsrData1_Bit3_ECUSPEC_WAKEUP" : 0, "GW_UsrData1_Bit4_NETWORK_AWAKE" : 0, "GW_UsrData1_Bit5_IGNITION_AWAKE" : 0, "GW_UsrData1_Bit6_DIAGN_AWAKE" : 0, "GW_UsrData1_Bit7_ECUSPEC_AWAKE" : 0, "GW_UsrData2" : 1, "GW_UsrData3" : 1, "GW_UsrData4_PN_Info1" : 1, "GW_UsrData5_PN_Info2" : 1}
    ${xcp_var_map}=    Evaluate    {"GW_SrcNodeId" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_SrcNodeID", "GW_CtrlBitVector_Bit0_RMR" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit0_RMR", "GW_CtrlBitVector_Bit1_Res" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit1_Res", "GW_CtrlBitVector_Bit2_Res" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit2_Res", "GW_CtrlBitVector_Bit3_NMCoord" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit3_NMCoord", "GW_CtrlBitVector_Bit4_ActWake" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit4_ActWake", "GW_CtrlBitVector_Bit5_Res" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit5_Res", "GW_CtrlBitVector_Bit6_PNI" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit6_PNI", "GW_CtrlBitVector_Bit7_Res" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_CtrlBitVector_Bit7_Res", "GW_UsrData0" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData0", "GW_UsrData1_Bit0_IGN_WAKEUP" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit0_IGN_WAKEUP", "GW_UsrData1_Bit1_RESET_WAKEUP" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit1_RESET_WAKEUP", "GW_UsrData1_Bit2_NETWORK_WAKEUP" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit2_NETWORK_WAKEUP", "GW_UsrData1_Bit3_ECUSPEC_WAKEUP" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit3_ECUSPEC_WAKEUP", "GW_UsrData1_Bit4_NETWORK_AWAKE" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit4_NETWORK_AWAKE", "GW_UsrData1_Bit5_IGNITION_AWAKE" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit5_IGNITION_AWAKE", "GW_UsrData1_Bit6_DIAGN_AWAKE" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit6_DIAGN_AWAKE", "GW_UsrData1_Bit7_ECUSPEC_AWAKE" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData1_Bit7_ECUSPEC_AWAKE", "GW_UsrData2" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData2", "GW_UsrData3" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData3", "GW_UsrData4_PN_Info1" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData4_PN_Info1", "GW_UsrData5_PN_Info2" : "Rte_C_SG_GW_NM_0x43E_adt_759336F4A41C3765C5686B2371FF03E1.GW_UsrData5_PN_Info2"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GW_SrcNodeID": 0, "GW_CtrlBitVector_Bit0_RMR": "Repeat_Message_State_not_requested", "GW_CtrlBitVector_Bit1_Res": 0, "GW_CtrlBitVector_Bit2_Res": 0, "GW_CtrlBitVector_Bit3_NMCoord": "Start_of_synchronized_shutdown_is_not_requested_by_main_coordinator", "GW_CtrlBitVector_Bit4_ActWake": "Node_has_not_woken_up_the_network_(passive_wakeup)", "GW_CtrlBitVector_Bit5_Res": 0, "GW_CtrlBitVector_Bit6_PNI": "NM_PDU_contains_no_Partial_Network_request_information", "GW_CtrlBitVector_Bit7_Res": 0, "GW_UsrData0": "User_data_for_current_vehicle_without_partial_networking", "GW_UsrData1_Bit0_IGN_WAKEUP": "inactive", "GW_UsrData1_Bit1_RESET_WAKEUP": "inactive", "GW_UsrData1_Bit2_NETWORK_WAKEUP": "inactive", "GW_UsrData1_Bit3_ECUSPEC_WAKEUP": "inactive", "GW_UsrData1_Bit4_NETWORK_AWAKE": "inactive", "GW_UsrData1_Bit5_IGNITION_AWAKE": "inactive", "GW_UsrData1_Bit6_DIAGN_AWAKE": "inactive", "GW_UsrData1_Bit7_ECUSPEC_AWAKE": "inactive", "GW_UsrData2": 1, "GW_UsrData3": 1, "GW_UsrData4_PN_Info1": 1, "GW_UsrData5_PN_Info2": 1}
    Validate TX Message With Expected Values    GW_NM_0x43E    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"GW_SrcNodeId" : 67, "GW_CtrlBitVector_Bit0_RMR" : 0, "GW_CtrlBitVector_Bit1_Res" : 0, "GW_CtrlBitVector_Bit2_Res" : 0, "GW_CtrlBitVector_Bit3_NMCoord" : 0, "GW_CtrlBitVector_Bit4_ActWake" : 0, "GW_CtrlBitVector_Bit5_Res" : 0, "GW_CtrlBitVector_Bit6_PNI" : 0, "GW_CtrlBitVector_Bit7_Res" : 0, "GW_UsrData0" : 1, "GW_UsrData1_Bit0_IGN_WAKEUP" : 0, "GW_UsrData1_Bit1_RESET_WAKEUP" : 0, "GW_UsrData1_Bit2_NETWORK_WAKEUP" : 0, "GW_UsrData1_Bit3_ECUSPEC_WAKEUP" : 0, "GW_UsrData1_Bit4_NETWORK_AWAKE" : 0, "GW_UsrData1_Bit5_IGNITION_AWAKE" : 0, "GW_UsrData1_Bit6_DIAGN_AWAKE" : 0, "GW_UsrData1_Bit7_ECUSPEC_AWAKE" : 0, "GW_UsrData2" : 237, "GW_UsrData3" : 245, "GW_UsrData4_PN_Info1" : 250, "GW_UsrData5_PN_Info2" : 250}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GW_SrcNodeID": 67, "GW_CtrlBitVector_Bit0_RMR": "Repeat_Message_State_not_requested", "GW_CtrlBitVector_Bit1_Res": 0, "GW_CtrlBitVector_Bit2_Res": 0, "GW_CtrlBitVector_Bit3_NMCoord": "Start_of_synchronized_shutdown_is_not_requested_by_main_coordinator", "GW_CtrlBitVector_Bit4_ActWake": "Node_has_not_woken_up_the_network_(passive_wakeup)", "GW_CtrlBitVector_Bit5_Res": 0, "GW_CtrlBitVector_Bit6_PNI": "NM_PDU_contains_no_Partial_Network_request_information", "GW_CtrlBitVector_Bit7_Res": 0, "GW_UsrData0": "User_data_for_current_vehicle_with_partial_networking", "GW_UsrData1_Bit0_IGN_WAKEUP": "inactive", "GW_UsrData1_Bit1_RESET_WAKEUP": "inactive", "GW_UsrData1_Bit2_NETWORK_WAKEUP": "inactive", "GW_UsrData1_Bit3_ECUSPEC_WAKEUP": "inactive", "GW_UsrData1_Bit4_NETWORK_AWAKE": "inactive", "GW_UsrData1_Bit5_IGNITION_AWAKE": "inactive", "GW_UsrData1_Bit6_DIAGN_AWAKE": "inactive", "GW_UsrData1_Bit7_ECUSPEC_AWAKE": "inactive", "GW_UsrData2": 237, "GW_UsrData3": 245, "GW_UsrData4_PN_Info1": 250, "GW_UsrData5_PN_Info2": 250}
    Validate TX Message With Expected Values    GW_NM_0x43E    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"GW_SrcNodeId" : 127, "GW_CtrlBitVector_Bit0_RMR" : 1, "GW_CtrlBitVector_Bit1_Res" : 1, "GW_CtrlBitVector_Bit2_Res" : 1, "GW_CtrlBitVector_Bit3_NMCoord" : 1, "GW_CtrlBitVector_Bit4_ActWake" : 1, "GW_CtrlBitVector_Bit5_Res" : 1, "GW_CtrlBitVector_Bit6_PNI" : 1, "GW_CtrlBitVector_Bit7_Res" : 1, "GW_UsrData0" : 2, "GW_UsrData1_Bit0_IGN_WAKEUP" : 1, "GW_UsrData1_Bit1_RESET_WAKEUP" : 1, "GW_UsrData1_Bit2_NETWORK_WAKEUP" : 1, "GW_UsrData1_Bit3_ECUSPEC_WAKEUP" : 1, "GW_UsrData1_Bit4_NETWORK_AWAKE" : 1, "GW_UsrData1_Bit5_IGNITION_AWAKE" : 1, "GW_UsrData1_Bit6_DIAGN_AWAKE" : 1, "GW_UsrData1_Bit7_ECUSPEC_AWAKE" : 1, "GW_UsrData2" : 255, "GW_UsrData3" : 255, "GW_UsrData4_PN_Info1" : 255, "GW_UsrData5_PN_Info2" : 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"GW_SrcNodeID": 127, "GW_CtrlBitVector_Bit0_RMR": "Repeat_Message_State_requested", "GW_CtrlBitVector_Bit1_Res": 1, "GW_CtrlBitVector_Bit2_Res": 1, "GW_CtrlBitVector_Bit3_NMCoord": "Start_of_synchronized_shutdown_is_requested_by_main_coordinator", "GW_CtrlBitVector_Bit4_ActWake": "Node_has_woken_up_the_network_(active_Wakeup)", "GW_CtrlBitVector_Bit5_Res": 1, "GW_CtrlBitVector_Bit6_PNI": "NM_PDU_contains_Partial_Network_request_information", "GW_CtrlBitVector_Bit7_Res": 1, "GW_UsrData0": "User_data_not_used", "GW_UsrData1_Bit0_IGN_WAKEUP": "active", "GW_UsrData1_Bit1_RESET_WAKEUP": "active", "GW_UsrData1_Bit2_NETWORK_WAKEUP": "active", "GW_UsrData1_Bit3_ECUSPEC_WAKEUP": "active", "GW_UsrData1_Bit4_NETWORK_AWAKE": "active", "GW_UsrData1_Bit5_IGNITION_AWAKE": "active", "GW_UsrData1_Bit6_DIAGN_AWAKE": "active", "GW_UsrData1_Bit7_ECUSPEC_AWAKE": "active", "GW_UsrData2": 255, "GW_UsrData3": 255, "GW_UsrData4_PN_Info1": 255, "GW_UsrData5_PN_Info2": 255}
    Validate TX Message With Expected Values    GW_NM_0x43E    ${expected_can_signals}    30

FCM-TX-0x336: Send Tx XCP variables and validating on CAN signals for message ICC_0x336
    [Documentation]    Validate TX message 'ICC_0x336' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_336_Checksum" : 0, "ICC_336_AliveCounter" : 0, "ICC_SetAtmLampBri" : 0, "ICC_SuspSet" : 0, "ICC_OTAInhbRdy" : 0, "ICC_AtmLampOpenCmd" : 0, "ICC_SteerAssiSet" : 0, "ICC_SetStorageBrilvl" : 0, "ICC_HDCSwtSig" : 0, "ICC_ESPSwtSig" : 0, "ICC_ReqCalifModHMIBtn" : 0, "ICC_SpdLimOffs" : 0, "ICC_iTPMSResetSig" : 0, "ICC_WIFIONOffSig" : 0, "ICC_LeMirrAlrmLampFlt" : 0, "ICC_RiMirrAlrmLampFlt" : 0, "ICC_PhoneSt" : 0, "ICC_SpeechSt" : 0, "ICC_RemReqFb" : 0, "ICC_SpdLimFdb" : 0, "ICC_OTARdy_Fb" : 0}
    ${xcp_var_map}=    Evaluate    {"ICC_336_Checksum" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_336_Checksum", "ICC_336_AliveCounter" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_336_AliveCounter", "ICC_SetAtmLampBri" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SetAtmLampBri", "ICC_SuspSet" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SuspSet", "ICC_OTAInhbRdy" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_OTAInhbRdy", "ICC_AtmLampOpenCmd" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_AtmLampOpenCmd", "ICC_SteerAssiSet" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SteerAssiSet", "ICC_SetStorageBrilvl" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SetStorageBriLvl", "ICC_HDCSwtSig" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_HDCSwtSig", "ICC_ESPSwtSig" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_ESPSwtSig", "ICC_ReqCalifModHMIBtn" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_ReqCalifModHMIBtn", "ICC_SpdLimOffs" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SpdLimOffs", "ICC_iTPMSResetSig" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_iTPMSResetSig", "ICC_WIFIONOffSig" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_WIFIOnOffSig", "ICC_LeMirrAlrmLampFlt" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_LeMirrAlrmLampFlt", "ICC_RiMirrAlrmLampFlt" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_RiMirrAlrmLampFlt", "ICC_PhoneSt" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_PhoneSt", "ICC_SpeechSt" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SpeechSt", "ICC_RemReqFb" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_RemReqFb", "ICC_SpdLimFdb" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_SpdLimFdb", "ICC_OTARdy_Fb" : "Rte_C_SG_ICC_0x336_adt_0C87F200C4D96261FE4B0C607CF01CF2.ICC_OTARdy_Fb"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_336_Checksum": 0, "ICC_336_AliveCounter": 0, "ICC_SetAtmLampBri": "Level_1", "ICC_SuspSet": "Normal", "ICC_OTAInhbRdy": "Initial", "ICC_AtmLampOpenCmd": "turn_off_ambient_light", "ICC_SteerAssiSet": "Initial_value", "ICC_SetStorageBriLvl": "Level_1", "ICC_HDCSwtSig": "No_Pressed", "ICC_ESPSwtSig": "Normal", "ICC_ReqCalifModHMIBtn": "Init,_No_request", "ICC_SpdLimOffs": 0, "ICC_iTPMSResetSig": "no_reset", "ICC_WIFIOnOffSig": "Invalid", "ICC_LeMirrAlrmLampFlt": "No_Failure", "ICC_RiMirrAlrmLampFlt": "No_Failure", "ICC_PhoneSt": "Init", "ICC_SpeechSt": "Init", "ICC_RemReqFb": "Idle", "ICC_SpdLimFdb": "Idle", "ICC_OTARdy_Fb": "Initial"}
    Validate TX Message With Expected Values    ICC_0x336    ${expected_can_signals}    30

#    Log  writing mid value to the xcp variables
#    ${xcp_values}=    Evaluate    {"ICC_336_Checksum" : 119, "ICC_336_AliveCounter" : 11, "ICC_SetAtmLampBri" : 1, "ICC_SuspSet" : 0, "ICC_OTAInhbRdy" : 1, "ICC_AtmLampOpenCmd" : 0, "ICC_SteerAssiSet" : 1, "ICC_SetStorageBrilvl" : 1, "ICC_HDCSwtSig" : 0, "ICC_ESPSwtSig" : 0, "ICC_ReqCalifModHMIBtn" : 1, "ICC_SpdLimOffs" : 11, "ICC_iTPMSResetSig" : 1, "ICC_WIFIONOffSig" : 1, "ICC_LeMirrAlrmLampFlt" : 1, "ICC_RiMirrAlrmLampFlt" : 1, "ICC_PhoneSt" : 1, "ICC_SpeechSt" : 1, "ICC_RemReqFb" : 1, "ICC_SpdLimFdb" : 1, "ICC_OTARdy_Fb" : 1}
#    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
#    ${expected_can_signals}=    Evaluate    {"ICC_336_Checksum": 0, "ICC_336_AliveCounter": 0, "ICC_SetAtmLampBri": "Level_1", "ICC_SuspSet": "Normal", "ICC_OTAInhbRdy": "Initial", "ICC_AtmLampOpenCmd": "turn_off_ambient_light", "ICC_SteerAssiSet": "Initial_value", "ICC_SetStorageBriLvl": "Level_1", "ICC_HDCSwtSig": "No_Pressed", "ICC_ESPSwtSig": "Normal", "ICC_ReqCalifModHMIBtn": "Init,_No_request", "ICC_SpdLimOffs": 0, "ICC_iTPMSResetSig": "no_reset", "ICC_WIFIOnOffSig": "Invalid", "ICC_LeMirrAlrmLampFlt": "No_Failure", "ICC_RiMirrAlrmLampFlt": "No_Failure", "ICC_PhoneSt": "Init", "ICC_SpeechSt": "Init", "ICC_RemReqFb": "Idle", "ICC_SpdLimFdb": "Idle", "ICC_OTARdy_Fb": "Initial"}
#    Validate TX Message With Expected Values    ICC_0x336   ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_336_Checksum" : 119, "ICC_336_AliveCounter" : 11, "ICC_SetAtmLampBri" : 2, "ICC_SuspSet" : 2, "ICC_OTAInhbRdy" : 2, "ICC_AtmLampOpenCmd" : 0, "ICC_SteerAssiSet" : 2, "ICC_SetStorageBrilvl" : 2, "ICC_HDCSwtSig" : 0, "ICC_ESPSwtSig" : 0, "ICC_ReqCalifModHMIBtn" : 2, "ICC_SpdLimOffs" : 11, "ICC_iTPMSResetSig" : 2, "ICC_WIFIONOffSig" : 2, "ICC_LeMirrAlrmLampFlt" : 2, "ICC_RiMirrAlrmLampFlt" : 2, "ICC_PhoneSt" : 2, "ICC_SpeechSt" : 2, "ICC_RemReqFb" : 2, "ICC_SpdLimFdb" : 2, "ICC_OTARdy_Fb" : 2}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_336_Checksum": 119, "ICC_336_AliveCounter": 11, "ICC_SetAtmLampBri": "Level_3", "ICC_SuspSet": "Off_Road", "ICC_OTAInhbRdy": "Not_Inhibit", "ICC_AtmLampOpenCmd": "turn_off_ambient_light", "ICC_SteerAssiSet": "ECO", "ICC_SetStorageBriLvl": "Level_3", "ICC_HDCSwtSig": "No_Pressed", "ICC_ESPSwtSig": "Normal", "ICC_ReqCalifModHMIBtn": "Request_California_Mode_ON", "ICC_SpdLimOffs": 11, "ICC_iTPMSResetSig": "Reserved", "ICC_WIFIOnOffSig": "OFF", "ICC_LeMirrAlrmLampFlt": "Reserved", "ICC_RiMirrAlrmLampFlt": "Reserved", "ICC_PhoneSt": "Active", "ICC_SpeechSt": "Active", "ICC_RemReqFb": "Failed", "ICC_SpdLimFdb": "Failed", "ICC_OTARdy_Fb": "Not_Ready"}
    Validate TX Message With Expected Values    ICC_0x336   ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_336_Checksum" : 255, "ICC_336_AliveCounter" : 14, "ICC_SetAtmLampBri" : 15, "ICC_SuspSet" : 3, "ICC_OTAInhbRdy" : 3, "ICC_AtmLampOpenCmd" : 1, "ICC_SteerAssiSet" : 7, "ICC_SetStorageBrilvl" : 15, "ICC_HDCSwtSig" : 1, "ICC_ESPSwtSig" : 1, "ICC_ReqCalifModHMIBtn" : 3, "ICC_SpdLimOffs" : 15, "ICC_iTPMSResetSig" : 3, "ICC_WIFIONOffSig" : 3, "ICC_LeMirrAlrmLampFlt" : 3, "ICC_RiMirrAlrmLampFlt" : 3, "ICC_PhoneSt" : 3, "ICC_SpeechSt" : 3, "ICC_RemReqFb" : 3, "ICC_SpdLimFdb" : 3, "ICC_OTARdy_Fb" : 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_336_Checksum": 255, "ICC_336_AliveCounter": 14, "ICC_SetAtmLampBri": "Reserved", "ICC_SuspSet": "Invalid", "ICC_OTAInhbRdy": "Invalid", "ICC_AtmLampOpenCmd": "turn_on_ambient_light", "ICC_SteerAssiSet": "Invalid", "ICC_SetStorageBriLvl": "Reserved", "ICC_HDCSwtSig": "Pressed", "ICC_ESPSwtSig": "Sport", "ICC_ReqCalifModHMIBtn": "Reserved", "ICC_SpdLimOffs": 15, "ICC_iTPMSResetSig": "Invalid", "ICC_WIFIOnOffSig": "Reserved", "ICC_LeMirrAlrmLampFlt": "Reserved", "ICC_RiMirrAlrmLampFlt": "Reserved", "ICC_PhoneSt": "Error", "ICC_SpeechSt": "Error", "ICC_RemReqFb": "Processing", "ICC_SpdLimFdb": "Processing", "ICC_OTARdy_Fb": "Invalid"}
    Validate TX Message With Expected Values    ICC_0x336    ${expected_can_signals}    30


FCM-TX-0x362: Send Tx XCP variables and validating on CAN signals for message ICC_0x362
    [Documentation]    Validate TX message 'ICC_0x362' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_MetaMapProvider": 0, "ICC_MetaMsgType": 0, "ICC_MetaCountryCode": 0, "ICC_MetaProtVerMinorSub": 0, "ICC_MetaProtVerMajor": 0, "ICC_MetaCycCnt": 0, "ICC_MetaHwVer": 0, "ICC_MetaDrvSide": 0, "ICC_MetaRegionCode": 0, "ICC_MetaMapVerYear": 2000, "ICC_MetaMapVerQtr": 1, "ICC_MetaProtVerMinor": 0, "ICC_MetaSpdUnits": 0, "ICC_Reserved": 0}
    ${xcp_var_map}=    Evaluate    {"ICC_MetaMapProvider": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaMapProvider", "ICC_MetaMsgType": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaMsgType", "ICC_MetaCountryCode": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaCountryCode", "ICC_MetaProtVerMinorSub": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaProtVerMinorSub", "ICC_MetaProtVerMajor": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaProtVerMajor", "ICC_MetaCycCnt": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaCycCnt", "ICC_MetaHwVer": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaHwVer", "ICC_MetaDrvSide": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaDrvSide", "ICC_MetaRegionCode": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaRegionCode", "ICC_MetaMapVerYear": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaMapVerYear", "ICC_MetaMapVerQtr": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaMapVerQtr", "ICC_MetaProtVerMinor": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaProtVerMinor", "ICC_MetaSpdUnits": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_MetaSpdUnits", "ICC_Reserved": "Rte_C_SG_ICC_0x362_adt_62C55F79D8175321974B2FDBB337E593.ICC_Reserved"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_MetaMapProvider": "Unknown", "ICC_MetaMsgType": "System_Specific", "ICC_MetaCountryCode": 0, "ICC_MetaProtVerMinorSub": 0, "ICC_MetaProtVerMajor": 0, "ICC_MetaCycCnt": 0, "ICC_MetaHwVer": "Unknown", "ICC_MetaDrvSide": "Driving_Side_Left", "ICC_MetaRegionCode": 0, "ICC_MetaMapVerYear": 2000, "ICC_MetaMapVerQtr": 1, "ICC_MetaProtVerMinor": 0, "ICC_MetaSpdUnits": "Kilometers_Per_Hour_(km/h)", "ICC_Reserved": 0}
    Run Keyword And Continue On Failure    Validate Tx Message With Expected Values    ICC_0x362    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_MetaMapProvider": 1, "ICC_MetaMsgType": 1, "ICC_MetaCountryCode": 546, "ICC_MetaProtVerMinorSub": 5, "ICC_MetaProtVerMajor": 2, "ICC_MetaCycCnt": 1, "ICC_MetaHwVer": 345, "ICC_MetaDrvSide": 0, "ICC_MetaRegionCode": 20000, "ICC_MetaMapVerYear": 2030, "ICC_MetaMapVerQtr": 2, "ICC_MetaProtVerMinor": 11, "ICC_MetaSpdUnits": 0, "ICC_Reserved": 5}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_MetaMapProvider": "Nokia_HERE_(NAVTEQ)", "ICC_MetaMsgType": "Position", "ICC_MetaCountryCode": 546, "ICC_MetaProtVerMinorSub": 5, "ICC_MetaProtVerMajor": 2, "ICC_MetaCycCnt": 1, "ICC_MetaHwVer": 345, "ICC_MetaDrvSide": "Driving_Side_Left", "ICC_MetaRegionCode": 20000, "ICC_MetaMapVerYear": 2030, "ICC_MetaMapVerQtr": 2, "ICC_MetaProtVerMinor": 11, "ICC_MetaSpdUnits": "Kilometers_Per_Hour_(km/h)", "ICC_Reserved": 5}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ICC_0x362   ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ICC_MetaMapProvider": 4, "ICC_MetaMsgType": 3, "ICC_MetaCountryCode": 1023, "ICC_MetaProtVerMinorSub": 7, "ICC_MetaProtVerMajor": 3, "ICC_MetaCycCnt": 3, "ICC_MetaHwVer": 511, "ICC_MetaDrvSide": 1, "ICC_MetaRegionCode": 32767, "ICC_MetaMapVerYear": 2063, "ICC_MetaMapVerQtr": 3, "ICC_MetaProtVerMinor": 15, "ICC_MetaSpdUnits": 1, "ICC_Reserved": 7}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ICC_MetaMapProvider": "IPC", "ICC_MetaMsgType": "Stub", "ICC_MetaCountryCode": 1023, "ICC_MetaProtVerMinorSub": 7, "ICC_MetaProtVerMajor": 3, "ICC_MetaCycCnt": 3, "ICC_MetaHwVer": 511, "ICC_MetaDrvSide": "Driving_Side_Right_Default_is_0x1", "ICC_MetaRegionCode": 32767, "ICC_MetaMapVerYear": 2063, "ICC_MetaMapVerQtr": 3, "ICC_MetaProtVerMinor": 15, "ICC_MetaSpdUnits": "Miles_Per_Hour_(mph)_Default_is_0", "ICC_Reserved": 7}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ICC_0x362    ${expected_can_signals}    30


FCM-TX-0x119: Send Tx XCP variables and validating on CAN signals for message iBooster_0x119
    [Documentation]    Validate TX message 'iBooster_0x119' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"iBooster_119_CheckSum": 0, "iBooster_119_AliveCounter": 0, "iBooster_OTARdy_Fb": 0, "iBooster_WarnOn": 0, "iBooster_BrkPedlAppIdFlg": 0, "iBooster_BrkPedlAppIdVld": 0}
    ${xcp_var_map}=    Evaluate    {"iBooster_119_CheckSum": "Rte_C_SG_iBooster_0x119_adt_8F045E2168C010783C326F17733E4F5F.iBooster_119_CheckSum", "iBooster_119_AliveCounter": "Rte_C_SG_iBooster_0x119_adt_8F045E2168C010783C326F17733E4F5F.iBooster_119_AliveCounter", "iBooster_OTARdy_Fb": "Rte_C_SG_iBooster_0x119_adt_8F045E2168C010783C326F17733E4F5F.iBooster_OTARdy_Fb", "iBooster_WarnOn": "Rte_C_SG_iBooster_0x119_adt_8F045E2168C010783C326F17733E4F5F.iBooster_WarnOn", "iBooster_BrkPedlAppIdFlg": "Rte_C_SG_iBooster_0x119_adt_8F045E2168C010783C326F17733E4F5F.iBooster_BrkPedlAppldFlg", "iBooster_BrkPedlAppIdVld": "Rte_C_SG_iBooster_0x119_adt_8F045E2168C010783C326F17733E4F5F.iBooster_BrkPedlAppldVld"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"iBooster_119_CheckSum": 0, "iBooster_119_AliveCounter": 0, "iBooster_OTARdy_Fb": "Initial", "iBooster_WarnOn": "No_Request_To_The_Warning_Lamp", "iBooster_BrkPedlAppldFlg": "Brake_Pedal_Not_Applied", "iBooster_BrkPedlAppldVld": "Initializing"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    iBooster_0x119    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"iBooster_119_CheckSum": 119, "iBooster_119_AliveCounter": 11, "iBooster_OTARdy_Fb": 1, "iBooster_WarnOn": 0, "iBooster_BrkPedlAppIdFlg": 0, "iBooster_BrkPedlAppIdVld": 1}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"iBooster_119_CheckSum": 119, "iBooster_119_AliveCounter": 11, "iBooster_OTARdy_Fb": "Ready", "iBooster_WarnOn": "No_Request_To_The_Warning_Lamp", "iBooster_BrkPedlAppldFlg": "Brake_Pedal_Not_Applied", "iBooster_BrkPedlAppldVld": "Valid"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    iBooster_0x119   ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"iBooster_119_CheckSum": 119, "iBooster_119_AliveCounter": 11, "iBooster_OTARdy_Fb": 2, "iBooster_WarnOn": 0, "iBooster_BrkPedlAppIdFlg": 0, "iBooster_BrkPedlAppIdVld": 2}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"iBooster_119_CheckSum": 119, "iBooster_119_AliveCounter": 11, "iBooster_OTARdy_Fb": "Not_Ready", "iBooster_WarnOn": "No_Request_To_The_Warning_Lamp", "iBooster_BrkPedlAppldFlg": "Brake_Pedal_Not_Applied", "iBooster_BrkPedlAppldVld": "Invalid"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    iBooster_0x119   ${expected_can_signals}    30
    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"iBooster_119_CheckSum": 255, "iBooster_119_AliveCounter": 14, "iBooster_OTARdy_Fb": 3, "iBooster_WarnOn": 1, "iBooster_BrkPedlAppIdFlg": 1, "iBooster_BrkPedlAppIdVld": 3}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"iBooster_119_CheckSum": 255, "iBooster_119_AliveCounter": 14, "iBooster_OTARdy_Fb": "Invalid", "iBooster_WarnOn": "Warning_Lamp_Requested", "iBooster_BrkPedlAppldFlg": "Brake_Pedal_Applied", "iBooster_BrkPedlAppldVld": "Reserved"}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    iBooster_0x119    ${expected_can_signals}    30

FCM-TX-0x12A: Send Tx XCP variables and validating on CAN signals for message ESP_0x12A
    [Documentation]    Validate TX message 'ESP_0x12A' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables

    ${xcp_values}=    Evaluate    {"ESP_12A_CheckSum": 1, "ESP_12A_AliveCounter": 0, "ESP_ExtBrkReqFlg": 0, "ESP_FBldgCtrlSts": 0, "ESP_ExtBrkReq": -252, "ESP_MstCylVirtPTarValVld": 0, "ESP_MstCylTarPVld": 0, "ESP_VirtP": 1, "ESP_StopMain2BackupState": 0, "ESP_MstCylTarP": 1}
    ${xcp_var_map}=    Evaluate    {"ESP_12A_CheckSum": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_12A_CheckSum", "ESP_12A_AliveCounter": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_12A_AliveCounter", "ESP_ExtBrkReqFlg": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_ExtBrkReqFlg", "ESP_FBldgCtrlSts": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_FBldgCtrlSts", "ESP_ExtBrkReq": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_ExtBrkReq", "ESP_MstCylVirtPTarValVld": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_MstCylVirtPTarValVld", "ESP_MstCylTarPVld": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_MstCylTarPVld", "ESP_VirtP": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_VirtP", "ESP_StopMain2BackupState": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_StopMain2BackupState", "ESP_MstCylTarP": "Rte_C_SG_ESP_0x12A_adt_54D3E83A4B950AB0CE5101D5CB2DA1EC.ESP_MstCylTarP"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_12A_CheckSum": 1, "ESP_12A_AliveCounter": 0, "ESP_ExtBrkReqFlg": "QTarget_Off", "ESP_FBldgCtrlSts": "PFC_Inactive", "ESP_ExtBrkReq": -252, "ESP_MstCylVirtPTarValVld": "Initializing", "ESP_MstCylTarPVld": "Initializing", "ESP_VirtP": 1, "ESP_StopMain2BackupState": "NotAvailable_Temporary", "ESP_MstCylTarP": 1}
    Validate TX Message With Expected Values    ESP_0x12A    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_12A_CheckSum": 100, "ESP_12A_AliveCounter": 6, "ESP_ExtBrkReqFlg": 1, "ESP_FBldgCtrlSts": 2, "ESP_ExtBrkReq": 100, "ESP_MstCylVirtPTarValVld": 2, "ESP_MstCylTarPVld": 2, "ESP_VirtP": 100, "ESP_StopMain2BackupState": 5, "ESP_MstCylTarP": 100}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_12A_CheckSum": 100, "ESP_12A_AliveCounter": 6, "ESP_ExtBrkReqFlg": "Qtarget_EBR", "ESP_FBldgCtrlSts": "PFC_Hold", "ESP_ExtBrkReq": 100, "ESP_MstCylVirtPTarValVld": "Invalid", "ESP_MstCylTarPVld": "Invalid", "ESP_VirtP": 100, "ESP_StopMain2BackupState": "Activation_Pending", "ESP_MstCylTarP": 100}
    Validate TX Message With Expected Values    ESP_0x12A   ${expected_can_signals}    60

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_12A_CheckSum": 255, "ESP_12A_AliveCounter": 14, "ESP_ExtBrkReqFlg": 3, "ESP_FBldgCtrlSts": PFC_Active, "ESP_ExtBrkReq": 252, "ESP_MstCylVirtPTarValVld": 3, "ESP_MstCylTarPVld": 3, "ESP_VirtP": 255, "ESP_StopMain2BackupState": 9, "ESP_MstCylTarP": 255}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_12A_CheckSum": 255, "ESP_12A_AliveCounter": 14, "ESP_ExtBrkReqFlg": "Undefined", "ESP_FBldgCtrlSts": PFC_Active, "ESP_ExtBrkReq": 252, "ESP_MstCylVirtPTarValVld": "Reserved", "ESP_MstCylTarPVld": "Reserved", "ESP_VirtP": 255, "ESP_StopMain2BackupState": "Activated_FailOperation", "ESP_MstCylTarP": 255}
    Validate TX Message With Expected Values    ESP_0x12A    ${expected_can_signals}    60


FCM-TX-0x1B8: Send Tx XCP variables and validating on CAN signals for message ESP_0x1B8
    [Documentation]    Validate TX message 'ESP_0x1B8' by writing XCP variables and reading CAN signals
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"ESP_1B8_CheckSum": 1, "ESP_1B8_AliveCounter": 0, "ESP_ModFbSig": 0, "ESP_ModSwtAllw": 0, "ESP_ActvVehHldFlg": 0, "ESP_VehSecuCdn": 0, "ESP_BrkFStsFlg": 0, "ESP_CddApOpsDirMovmt": 0, "ESP_VehStopSts": 0, "ESP_VehStandstillSts": 0, "ESP_EPB_BenchMode": 0, "ESP_RoadSlopVld": 0, "ESP_AEBRdy": 0, "ESP_ACCRdy": 0, "ESP_ParkRdy": 0, "ESP_ReAEBRdy": 0, "ESP_SpclTerrainModFltIndcn": 0, "ESP_DrvOffStRdy": 0, "ESP_TarLSMSts": 0, "ESP_RoadSlop": -10}
    ${xcp_var_map}=    Evaluate    {"ESP_1B8_CheckSum": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ModSwtAllw", "ESP_ActvVehHldFlg": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ActvVehHldFlg", "ESP_VehSecuCdn": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_VehSecuCdn", "ESP_BrkFStsFlg": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_BrkFStsFlg", "ESP_CddApOpsDirMovmt": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_CddApOpsDirMovmt", "ESP_VehStopSts": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_VehStopSts", "ESP_VehStandstillSts": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_VehStandstillSts", "ESP_EPB_BenchMode": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_EPB_BenchMode", "ESP_RoadSlopVld": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_RoadSlopVld", "ESP_AEBRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_AEBRdy", "ESP_ACCRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESPACCRdy", "ESP_ParkRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ParkRdy", "ESP_ReAEBRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_ReAEBRdy", "ESP_SpclTerrainModFltIndcn": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_SpclTerrainModFltIndcn", "ESP_DrvOffStRdy": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_DrvOffStRdy", "ESP_TarLSMSts": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_TarLSMSts", "ESP_RoadSlop": "Rte_C_SG_ESP_0x1B8_adt_546AEC1EC6D31F6875D913A8D076317C.ESP_RoadSlop"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_1B8_CheckSum": 1, "ESP_1B8_AliveCounter": 0, "ESP_ModFbSig": "Init", "ESP_ModSwtAllw": "Not_Allowed", "ESP_ActvVehHldFlg": "False", "ESP_VehSecuCdn": "ParkSt_Other", "ESP_BrkFStsFlg": "False", "ESP_CddApOpsDirMovmt": "False", "ESP_VehStopSts": "Not_Stop", "ESP_VehStandstillSts": "Not_Standstill", "ESP_EPB_BenchMode": "Not_Active", "ESP_RoadSlopVld": "Initializing", "ESP_AEBRdy": "Not_ready", "ESPACCRdy": "Not_ready", "ESP_ParkRdy": "Not_ready", "ESP_ReAEBRdy": "Not_ready", "ESP_SpclTerrainModFltIndcn": "Not_Available", "ESP_DrvOffStRdy": "False", "ESP_TarLSMSts": "LSM_Off", "ESP_RoadSlop": -10}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ESP_0x1B8    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables

    ${xcp_values}=    Evaluate    {"ESP_1B8_CheckSum": 100, "ESP_1B8_AliveCounter": 6, "ESP_ModFbSig": 2, "ESP_ModSwtAllw": 0, "ESP_ActvVehHldFlg": 0, "ESP_VehSecuCdn": 1, "ESP_BrkFStsFlg": 0, "ESP_CddApOpsDirMovmt": 0, "ESP_VehStopSts": 0, "ESP_VehStandstillSts": 0, "ESP_EPB_BenchMode": 1, "ESP_RoadSlopVld": 2, "ESP_AEBRdy": 2, "ESP_ACCRdy": 2, "ESP_ParkRdy": 2, "ESP_ReAEBRdy": 2, "ESP_SpclTerrainModFltIndcn": 0, "ESP_DrvOffStRdy": 0, "ESP_TarLSMSts": 0, "ESP_RoadSlop": 5}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_1B8_CheckSum": 100, "ESP_1B8_AliveCounter": 6, "ESP_ModFbSig": "Sport", "ESP_ModSwtAllw": "Not_Allowed", "ESP_ActvVehHldFlg": "False", "ESP_VehSecuCdn": "ParkSt_Reld", "ESP_BrkFStsFlg": "False", "ESP_CddApOpsDirMovmt": "False", "ESP_VehStopSts": "Not_Stop", "ESP_VehStandstillSts": "Not_Standstill", "ESP_EPB_BenchMode": "Active", "ESP_RoadSlopVld": "Invalid", "ESP_AEBRdy": "Reserved", "ESPACCRdy": "Ready", "ESP_ParkRdy": "Reserved", "ESP_ReAEBRdy": "Reserved", "ESP_SpclTerrainModFltIndcn": "Not_Available", "ESP_DrvOffStRdy": "False", "ESP_TarLSMSts": "LSM_Off", "ESP_RoadSlop": 5}

    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ESP_0x1B8   ${expected_can_signals}    30

    Log  writing max value to the xcp variables

    ${xcp_values}=    Evaluate    {"ESP_1B8_CheckSum": 255, "ESP_1B8_AliveCounter": 14, "ESP_ModFbSig": 7, "ESP_ModSwtAllw": 1, "ESP_ActvVehHldFlg": 1, "ESP_VehSecuCdn": 4, "ESP_BrkFStsFlg": 1, "ESP_CddApOpsDirMovmt": 1, "ESP_VehStopSts": 1, "ESP_VehStandstillSts": 1, "ESP_EPB_BenchMode": 3, "ESP_RoadSlopVld": 3, "ESP_AEBRdy": 3, "ESP_ACCRdy": 3, "ESP_ParkRdy": 3, "ESP_ReAEBRdy": 3, "ESP_SpclTerrainModFltIndcn": 1, "ESP_DrvOffStRdy": 1, "ESP_TarLSMSts": 1, "ESP_RoadSlop": 10}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ESP_1B8_CheckSum": 255, "ESP_1B8_AliveCounter": 14, "ESP_ModFbSig": "Invalid", "ESP_ModSwtAllw": "Allowed", "ESP_ActvVehHldFlg": "True", "ESP_VehSecuCdn": "ParkSt_ReqToutorOvrdn", "ESP_BrkFStsFlg": "True", "ESP_CddApOpsDirMovmt": "True", "ESP_VehStopSts": "Stop", "ESP_VehStandstillSts": "Standstill", "ESP_EPB_BenchMode": "Invalid", "ESP_RoadSlopVld": "Reserved", "ESP_AEBRdy": "Invalid", "ESPACCRdy": "Invalid", "ESP_ParkRdy": "Invalid", "ESP_ReAEBRdy": "Invalid", "ESP_SpclTerrainModFltIndcn": "Available", "ESP_DrvOffStRdy": "True", "ESP_TarLSMSts": "LSM_On", "ESP_RoadSlop": 10}
    Run Keyword And Continue On Failure    Validate TX Message With Expected Values    ESP_0x1B8    ${expected_can_signals}    30

