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

