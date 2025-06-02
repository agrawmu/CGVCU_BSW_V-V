*** Settings ***
Library    ../can_tx_validation_interface.py
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

AD-TX-0x7B: Send Tx XCP variables and validating on CAN signals for message mEbcm2L_Stat2
    [Documentation]    Validate TX message 'mEbcm2L_Stat2' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"AbsActv": 0, "AbsAvail": 0, "AebRdy": 0, "EbdActv": 0, "EscActv": 0, "EscAvail": 0, "HoldStat": 1, "LvVolt": 0.1, "MsgCntr": 0, "MsgCrc": 1, "MtrCurrEst": 10, "TcsActv": 0, "TcsAvail": 0, "ToShtdwn": 0, "VehSpdEbcm": -15}
    ${xcp_var_map}=    Evaluate    {"AbsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsActv", "AbsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsAvail", "AebRdy": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AebRdy", "EbdActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EbdActv", "EscActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscActv", "EscAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscAvail", "HoldStat": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.HoldStat", "LvVolt": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.LvVolt", "MsgCntr": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCrc", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "TcsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsActv", "TcsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsAvail", "ToShtdwn": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.ToShtdwn", "VehSpdEbcm": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.VehSpdEbcm"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AbsActv": 0, "AbsAvail": 0, "AebRdy": 0, "EbdActv": 0, "EscActv": 0, "EscAvail": Not Avail, "HoldStat": Controlled, "LvVolt": 0.1, "MsgCntr": 0, "MsgCrc": 1, "MtrCurrEst": 10, "TcsActv": 0, "TcsAvail": 0, "ToShtdwn": False, "VehSpdEbcm": -15}
    Validate TX Message With Expected Values    mEbcm2L_Stat2    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"AbsActv": 0, "AbsAvail": 0, "AebRdy": 0, "EbdActv": 0, "EscActv": 0, "EscAvail": 1, "HoldStat": 2, "LvVolt": 19, "MsgCntr": 4, "MsgCrc": 89, "MtrCurrEst": 90, "TcsActv": 0, "TcsAvail": 0, "ToShtdwn": 1, "VehSpdEbcm": 0.5}
    ${xcp_var_map}=    Evaluate    {"AbsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsActv", "AbsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsAvail", "AebRdy": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AebRdy", "EbdActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EbdActv", "EscActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscActv", "EscAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscAvail", "HoldStat": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.HoldStat", "LvVolt": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.LvVolt", "MsgCntr": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCrc", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "TcsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsActv", "TcsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsAvail", "ToShtdwn": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.ToShtdwn", "VehSpdEbcm": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.VehSpdEbcm"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"EscAvail":  Level_1, "HoldStat": Release, "LvVolt": 19, "MsgCntr": 4, "MsgCrc": 89, "MtrCurrEst": 90, "ToShtdwn": Pend_1s, "VehSpdEbcm": 0.5}
    Validate TX Message With Expected Values    mEbcm2L_Stat2    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"AbsActv": 1, "AbsAvail": 1, "AebRdy": 1, "EbdActv": 1, "EscActv": 1, "EscAvail": 2, "HoldStat": 3, "LvVolt": 20.5, "MsgCntr": 9, "MsgCrc": 230, "MtrCurrEst": 55, "TcsActv": 1, "TcsAvail": 1, "ToShtdwn": 4, "VehSpdEbcm": 20}
    ${xcp_var_map}=    Evaluate    {"AbsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsActv", "AbsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AbsAvail", "AebRdy": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.AebRdy", "EbdActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EbdActv", "EscActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscActv", "EscAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.EscAvail", "HoldStat": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.HoldStat", "LvVolt": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.LvVolt", "MsgCntr": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MsgCrc", "MtrCurrEst": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.MtrCurrEst", "TcsActv": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsActv", "TcsAvail": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.TcsAvail", "ToShtdwn": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.ToShtdwn", "VehSpdEbcm": "Rte_C_SG_mEbcm2L_Stat2_adt_8E623BA1DB830D4B137AA32518CB0D39.VehSpdEbcm"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"AbsActv": 1, "AbsAvail": 1, "AebRdy": 1, "EbdActv": 1, "EscActv": 1, "EscAvail": Level_2, "HoldStat": PlusControl, "LvVolt": 20.5, "MsgCntr": 9, "MsgCrc": 230, "MtrCurrEst": 55, "TcsActv": 1, "TcsAvail": 1, "ToShtdwn": True, "VehSpdEbcm": 20}
    Validate TX Message With Expected Values    mEbcm2L_Stat2    ${expected_can_signals}    30
	
AD-TX-0x7C: Send Tx XCP variables and validating on CAN signals for message mEbcm2L_WhlCnt
    [Documentation]    Validate TX message 'mEbcm2L_WhlCnt' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlCntFL": 0, "WhlCntFR": 0, "WhlCntR": 0}
    ${xcp_var_map}=    Evaluate    {"WhlCntFL": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntFL", "WhlCntFR": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntFR", "WhlCntR": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlCntFL": 0, "WhlCntFR": 0, "WhlCntR": 0}
    Validate TX Message With Expected Values    mEbcm2L_WhlCnt    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlCntFL": 100, "WhlCntFR": 100, "WhlCntR": 100}
    ${xcp_var_map}=    Evaluate    {"WhlCntFL": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntFL", "WhlCntFR": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntFR", "WhlCntR": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlCntFL": 100, "WhlCntFR": 100, "WhlCntR": 100}
    Validate TX Message With Expected Values    mEbcm2L_WhlCnt    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"WhlCntFL": 2100, "WhlCntFR": 2100, "WhlCntR": 2100}
    ${xcp_var_map}=    Evaluate    {"WhlCntFL": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntFL", "WhlCntFR": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntFR", "WhlCntR": "Rte_C_SG_mEbcm2L_WhlCnt_adt_2CC658CC7C9122D86B77ECEE35C53918.WhlCntR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"WhlCntFL": 2100, "WhlCntFR": 2100, "WhlCntR": 2100}
    Validate TX Message With Expected Values    mEbcm2L_WhlCnt    ${expected_can_signals}    30
	
AD-TX-0x81: Send Tx XCP variables and validating on CAN signals for message mEbcm2L_WhlSlip
    [Documentation]    Validate TX message 'mEbcm2L_WhlSlip' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 10, "WhlSlipFL": -50, "WhlSlipFR": -77.7, "WhlSlipR": -90}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.MsgCrc", "WhlSlipFL": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipFL", "WhlSlipFR": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipFR", "WhlSlipR": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 10, "WhlSlipFL": -50, "WhlSlipFR": -77.7, "WhlSlipR": -90}
    Validate TX Message With Expected Values    mEbcm2L_WhlSlip    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 5, "MsgCrc": 109, "WhlSlipFL": 0, "WhlSlipFR": 10, "WhlSlipR": 0.1}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.MsgCrc", "WhlSlipFL": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipFL", "WhlSlipFR": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipFR", "WhlSlipR": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 5, "MsgCrc": 109, "WhlSlipFL": 0, "WhlSlipFR": 10, "WhlSlipR": 0.1}
    Validate TX Message With Expected Values    mEbcm2L_WhlSlip    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 10, "MsgCrc": 200, "WhlSlipFL": 300, "WhlSlipFR": 310, "WhlSlipR": 150}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.MsgCrc", "WhlSlipFL": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipFL", "WhlSlipFR": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipFR", "WhlSlipR": "Rte_C_SG_mEbcm2L_WhlSlip_adt_0927FED5C94051126737133C75E45A14.WhlSlipR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 10, "MsgCrc": 200, "WhlSlipFL": 300, "WhlSlipFR": 310, "WhlSlipR": 150}
    Validate TX Message With Expected Values    mEbcm2L_WhlSlip    ${expected_can_signals}    30
	
AD-TX-0x7F: Send Tx XCP variables and validating on CAN signals for message mEbcm2L_WhlSpd
    [Documentation]    Validate TX message 'mEbcm2L_WhlSpd' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 10, "WhlSpdFL": -15, "WhlSpdFR": -20, "WhlSpdR": -2.2}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCrc", "WhlSpdFL": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFL", "WhlSpdFR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFR", "WhlSpdR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 10, "WhlSpdFL": -15, "WhlSpdFR": -20, "WhlSpdR": -2.2}
    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 5, "MsgCrc": 109, "WhlSpdFL": 0.01, "WhlSpdFR": 0, "WhlSpdR": 9}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCrc", "WhlSpdFL": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFL", "WhlSpdFR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFR", "WhlSpdR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 5, "MsgCrc": 109, "WhlSpdFL": 0.01, "WhlSpdFR": 0, "WhlSpdR": 9}
    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 10, "MsgCrc": 200, "WhlSpdFL": 20, "WhlSpdFR": 10, "WhlSpdR": 8.8}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCntr", "MsgCrc": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.MsgCrc", "WhlSpdFL": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFL", "WhlSpdFR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdFR", "WhlSpdR": "Rte_C_SG_mEbcm2L_WhlSpd_adt_EF8F6DF2EAF09809D17368789179D7AD.WhlSpdR"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {{"MsgCntr": 10, "MsgCrc": 200, "WhlSpdFL": 20, "WhlSpdFR": 10, "WhlSpdR": 8.8}
    Validate TX Message With Expected Values    mEbcm2L_WhlSpd    ${expected_can_signals}    30
	
AD-TX-0x200: Send Tx XCP variables and validating on CAN signals for message mExtLightStat
    [Documentation]    Validate TX message 'mExtLightStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"HornStat": 0, "LightChmslStat": 0, "LightDRLStat": 0, "LightHighStat": 0, "LightLow_TailStat": 0, "LightRevStat": 0, "LightStopStat": 0, "LightTurnFrontLStat": 0, "LightTurnFrontRStat": 0, "LightTurnRearLStat": 0, "LightTurnRearRStat": 0, "MsgCntr": 0}
    ${xcp_var_map}=    Evaluate    {"HornStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.HornStat", "LightChmslStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightChmslStat", "LightDRLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightDRLStat", "LightHighStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightHighStat", "LightLow_TailStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightLow_TailStat", "LightRevStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightRevStat", "LightStopStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightStopStat", "LightTurnFrontLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnFrontLStat", "LightTurnFrontRStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnFrontRStat", "LightTurnRearLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnRearLStat", "LightTurnRearRStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnRearRStat", "MsgCntr": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.MsgCntr"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"HornStat": 0, "LightChmslStat": 0, "LightDRLStat": 0, "LightHighStat": 0, "LightRevStat": 0, "LightStopStat": 0, "LightTurnFrontLStat": 0, "LightTurnFrontRStat": 0, "LightTurnRearLStat": 0, "LightTurnRearRStat": 0, "MsgCntr": 0}
    Validate TX Message With Expected Values    mExtLightStat    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"HornStat": 1, "LightChmslStat": 1, "LightDRLStat": 1, "LightHighStat": 1, "LightLow_TailStat": 0, "LightRevStat": 1, "LightStopStat": 1, "LightTurnFrontLStat": 1, "LightTurnFrontRStat": 1, "LightTurnRearLStat": 1, "LightTurnRearRStat": 1, "MsgCntr": 5}
    ${xcp_var_map}=    Evaluate    {"HornStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.HornStat", "LightChmslStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightChmslStat", "LightDRLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightDRLStat", "LightHighStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightHighStat", "LightLow_TailStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightLow_TailStat", "LightRevStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightRevStat", "LightStopStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightStopStat", "LightTurnFrontLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnFrontLStat", "LightTurnFrontRStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnFrontRStat", "LightTurnRearLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnRearLStat", "LightTurnRearRStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnRearRStat", "MsgCntr": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.MsgCntr"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"HornStat": 1, "LightChmslStat": 1, "LightDRLStat": 1, "LightHighStat": 1, "LightRevStat": 1, "LightStopStat": 1, "LightTurnFrontLStat": 1, "LightTurnFrontRStat": 1, "LightTurnRearLStat": 1, "LightTurnRearRStat": 1, "MsgCntr": 5}
    Validate TX Message With Expected Values    mExtLightStat    ${expected_can_signals}    30

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"HornStat": 2, "LightChmslStat": 2, "LightDRLStat": 2, "LightHighStat": 2, "LightLow_TailStat": 0, "LightRevStat": 2, "LightStopStat": 2, "LightTurnFrontLStat": 2, "LightTurnFrontRStat": 2, "LightTurnRearLStat": 2, "LightTurnRearRStat": 2, "MsgCntr": 10}
    ${xcp_var_map}=    Evaluate    {"HornStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.HornStat", "LightChmslStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightChmslStat", "LightDRLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightDRLStat", "LightHighStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightHighStat", "LightLow_TailStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightLow_TailStat", "LightRevStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightRevStat", "LightStopStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightStopStat", "LightTurnFrontLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnFrontLStat", "LightTurnFrontRStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnFrontRStat", "LightTurnRearLStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnRearLStat", "LightTurnRearRStat": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.LightTurnRearRStat", "MsgCntr": "Rte_C_SG_mExtLightStat_adt_D028060D886A987B8CCBFC6420D1C36B.MsgCntr"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"HornStat": Short to Battery, "LightChmslStat": Short to Battery, "LightDRLStat": Short to Battery, "LightHighStat": Short to Battery, "LightRevStat": Short to Battery, "LightStopStat": Short to Battery, "LightTurnFrontLStat": Short to Battery, "LightTurnFrontRStat": Short to Battery, "LightTurnRearLStat": Short to Battery, "LightTurnRearRStat": Short to Battery, "MsgCntr": 10}
    Validate TX Message With Expected Values    mExtLightStat    ${expected_can_signals}    30
	
AD-TX-0xCFDD633: Send Tx XCP variables and validating on CAN signals for message mLeftJoyStat
    [Documentation]    Validate TX message 'mLeftJoyStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_Dwn": 0, "Btn_Left": 0, "Btn_Right": 0, "Btn_Up": 0, "LeftX_Neg": 0, "LeftX_Ntrl": 0, "LeftX_Pos": 0, "LeftX_Value": 0, "LeftY_Neg": 0, "LeftY_Ntrl": 0, "LeftY_Pos": 0, "LeftY_Value": 0}
    ${xcp_var_map}=    Evaluate    {"Btn_Dwn": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Dwn", "Btn_Left": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Left", "Btn_Right": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Right", "Btn_Up": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Up", "LeftX_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Neg", "LeftX_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Ntrl", "LeftX_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Pos", "LeftX_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Value", "LeftY_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Neg", "LeftY_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Ntrl", "LeftY_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Pos", "LeftY_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_Dwn": Not Set, "Btn_Left": Not Set, "Btn_Right": Not Set, "Btn_Up": Not Set, "LeftX_Neg": Not Set, "LeftX_Ntrl": Not Set, "LeftX_Pos": Not Set, "LeftX_Value": 0, "LeftY_Neg": Not Set, "LeftY_Ntrl": Not Set, "LeftY_Pos": Not Set, "LeftY_Value": 0}
    Validate TX Message With Expected Values    mLeftJoyStat    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_Dwn": 1, "Btn_Left": 1, "Btn_Right": 1, "Btn_Up": 1, "LeftX_Neg": 1, "LeftX_Ntrl": 1, "LeftX_Pos": 1, "LeftX_Value": 557, "LeftY_Neg": 1, "LeftY_Ntrl": 1, "LeftY_Pos": 1, "LeftY_Value": 557}
    ${xcp_var_map}=    Evaluate    {"Btn_Dwn": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Dwn", "Btn_Left": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Left", "Btn_Right": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Right", "Btn_Up": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Up", "LeftX_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Neg", "LeftX_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Ntrl", "LeftX_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Pos", "LeftX_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Value", "LeftY_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Neg", "LeftY_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Ntrl", "LeftY_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Pos", "LeftY_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_Dwn": Set, "Btn_Left": Set, "Btn_Right": Set, "Btn_Up": Set, "LeftX_Neg": Set, "LeftX_Ntrl": Set, "LeftX_Pos": Set, "LeftX_Value": 557, "LeftY_Neg": Set, "LeftY_Ntrl": Set, "LeftY_Pos": Set, "LeftY_Value": 557}
    Validate TX Message With Expected Values    mLeftJoyStat    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_Dwn": 2, "Btn_Left": 2, "Btn_Right": 2, "Btn_Up": 2, "LeftX_Neg": 2, "LeftX_Ntrl": 2, "LeftX_Pos": 2, "LeftX_Value": 557, "LeftY_Neg": 2, "LeftY_Ntrl": 2, "LeftY_Pos": 2, "LeftY_Value": 557}
    ${xcp_var_map}=    Evaluate    {"Btn_Dwn": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Dwn", "Btn_Left": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Left", "Btn_Right": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Right", "Btn_Up": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Up", "LeftX_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Neg", "LeftX_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Ntrl", "LeftX_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Pos", "LeftX_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Value", "LeftY_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Neg", "LeftY_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Ntrl", "LeftY_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Pos", "LeftY_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_Dwn": Fault, "Btn_Left": Fault, "Btn_Right": Fault, "Btn_Up": Fault, "LeftX_Neg": Fault, "LeftX_Ntrl": Fault, "LeftX_Pos": Fault, "LeftY_Neg": Fault, "LeftY_Ntrl": Fault, "LeftY_Pos": Fault}
    Validate TX Message With Expected Values    mLeftJoyStat    ${expected_can_signals}    60
	
	Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_Dwn": 3, "Btn_Left": 3, "Btn_Right": 3, "Btn_Up": 3, "LeftX_Neg": 3, "LeftX_Ntrl": 3, "LeftX_Pos": 3, "LeftX_Value": 1023, "LeftY_Neg": 3, "LeftY_Ntrl": 3, "LeftY_Pos": 3, "LeftY_Value": 1023}
    ${xcp_var_map}=    Evaluate    {"Btn_Dwn": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Dwn", "Btn_Left": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Left", "Btn_Right": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Right", "Btn_Up": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.Btn_Up", "LeftX_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Neg", "LeftX_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Ntrl", "LeftX_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Pos", "LeftX_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftX_Value", "LeftY_Neg": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Neg", "LeftY_Ntrl": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Ntrl", "LeftY_Pos": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Pos", "LeftY_Value": "Rte_C_SG_mLeftJoyStat_adt_5AB9C8E6E4374C7719A388732B7966AC.LeftY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_Dwn": SNA, "Btn_Left": SNA, "Btn_Right": SNA, "Btn_Up": SNA, "LeftX_Neg": SNA, "LeftX_Ntrl": SNA, "LeftX_Pos": SNA, "LeftX_Value": 1023, "LeftY_Neg": SNA, "LeftY_Ntrl": SNA, "LeftY_Pos": SNA, "LeftY_Value": 1023}
    Validate TX Message With Expected Values    mLeftJoyStat    ${expected_can_signals}    60
	
AD-TX-0xCFDD733: Send Tx XCP variables and validating on CAN signals for message mLeftJoyStat2
    [Documentation]    Validate TX message 'mLeftJoyStat2' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftZ_Neg": 0, "LeftZ_Ntrl": 0, "LeftZ_Pos": 0, "LeftZ_Value": 0}
    ${xcp_var_map}=    Evaluate    {"LeftZ_Neg": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Neg", "LeftZ_Ntrl": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Ntrl", "LeftZ_Pos": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Pos", "LeftZ_Value": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"LeftZ_Neg": Not Set, "LeftZ_Ntrl": Not Set, "LeftZ_Pos": Not Set, "LeftZ_Value": 0}
    Validate TX Message With Expected Values    mLeftJoyStat2    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftZ_Neg": 1, "LeftZ_Ntrl": 1, "LeftZ_Pos": 1, "LeftZ_Value": 557}
    ${xcp_var_map}=    Evaluate    {"LeftZ_Neg": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Neg", "LeftZ_Ntrl": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Ntrl", "LeftZ_Pos": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Pos", "LeftZ_Value": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"LeftZ_Neg": Set, "LeftZ_Ntrl": Set, "LeftZ_Pos": Set, "LeftZ_Value": 557}
    Validate TX Message With Expected Values    mLeftJoyStat2    ${expected_can_signals}    60
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftZ_Neg": 2, "LeftZ_Ntrl": 2, "LeftZ_Pos": 2, "LeftZ_Value": 557}
    ${xcp_var_map}=    Evaluate    {"LeftZ_Neg": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Neg", "LeftZ_Ntrl": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Ntrl", "LeftZ_Pos": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Pos", "LeftZ_Value": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"LeftZ_Neg": Fault, "LeftZ_Ntrl": Fault, "LeftZ_Pos": Fault}
    Validate TX Message With Expected Values    mLeftJoyStat2    ${expected_can_signals}    60

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftZ_Neg": 3, "LeftZ_Ntrl": 3, "LeftZ_Pos": 3, "LeftZ_Value": 1023}
    ${xcp_var_map}=    Evaluate    {"LeftZ_Neg": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Neg", "LeftZ_Ntrl": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Ntrl", "LeftZ_Pos": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Pos", "LeftZ_Value": "Rte_C_SG_mLeftJoyStat2_adt_97C40643527EB85A36D0891274D77D4E.LeftZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"LeftZ_Neg": SNA, "LeftZ_Ntrl": SNA, "LeftZ_Pos": SNA, "LeftZ_Value": 1023}
    Validate TX Message With Expected Values    mLeftJoyStat2    ${expected_can_signals}    60
	
AD-TX-0xCFDD834: Send Tx XCP variables and validating on CAN signals for message mRightJoyStat
    [Documentation]    Validate TX message 'mRightJoyStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_1": 0, "Btn_2": 0, "Btn_3": 0, "Btn_4": 0, "RightX_Neg": 0, "RightX_Ntrl": 0, "RightX_Pos": 0, "RightX_Value": 0, "RightY_Neg": 0, "RightY_Ntrl": 0, "RightY_Pos": 0, "RightY_Value": 0}
    ${xcp_var_map}=    Evaluate    {"Btn_1": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_1", "Btn_2": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_2", "Btn_3": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_3", "Btn_4": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_4", "RightX_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Neg", "RightX_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Ntrl", "RightX_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Pos", "RightX_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Value", "RightY_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Neg", "RightY_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Ntrl", "RightY_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Pos", "RightY_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_1": 0, "Btn_2": 0, "Btn_3": 0, "Btn_4": 0, "RightX_Neg": 0, "RightX_Ntrl": 0, "RightX_Pos": 0, "RightX_Value": 0, "RightY_Neg": 0, "RightY_Ntrl": 0, "RightY_Pos": 0, "RightY_Value": 0}
    Validate TX Message With Expected Values    mRightJoyStat    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_1": 1, "Btn_2": 1, "Btn_3": 1, "Btn_4": 1, "RightX_Neg": 1, "RightX_Ntrl": 1, "RightX_Pos": 1, "RightX_Value": 557, "RightY_Neg": 1, "RightY_Ntrl": 1, "RightY_Pos": 1, "RightY_Value": 557}
    ${xcp_var_map}=    Evaluate    {"Btn_1": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_1", "Btn_2": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_2", "Btn_3": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_3", "Btn_4": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_4", "RightX_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Neg", "RightX_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Ntrl", "RightX_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Pos", "RightX_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Value", "RightY_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Neg", "RightY_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Ntrl", "RightY_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Pos", "RightY_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_1": 1, "Btn_2": 1, "Btn_3": 1, "Btn_4": 1, "RightX_Neg": 1, "RightX_Ntrl": 1, "RightX_Pos": 1, "RightX_Value": 557, "RightY_Neg": 1, "RightY_Ntrl": 1, "RightY_Pos": 1, "RightY_Value": 557}
    Validate TX Message With Expected Values    mRightJoyStat    ${expected_can_signals}    60
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_1": 2, "Btn_2": 2, "Btn_3": 2, "Btn_4": 2, "RightX_Neg": 2, "RightX_Ntrl": 2, "RightX_Pos": 2, "RightX_Value": 557, "RightY_Neg": 2, "RightY_Ntrl": 2, "RightY_Pos": 2, "RightY_Value": 557}
    ${xcp_var_map}=    Evaluate    {"Btn_1": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_1", "Btn_2": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_2", "Btn_3": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_3", "Btn_4": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_4", "RightX_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Neg", "RightX_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Ntrl", "RightX_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Pos", "RightX_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Value", "RightY_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Neg", "RightY_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Ntrl", "RightY_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Pos", "RightY_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_1": 2, "Btn_2": 2, "Btn_3": 2, "Btn_4": 2, "RightX_Neg": 2, "RightX_Ntrl": 2, "RightX_Pos": 2, "RightY_Neg": 2, "RightY_Ntrl": 2, "RightY_Pos": 2}
    Validate TX Message With Expected Values    mRightJoyStat    ${expected_can_signals}    60

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"Btn_1": 3, "Btn_2": 3, "Btn_3": 3, "Btn_4": 3, "RightX_Neg": 3, "RightX_Ntrl": 3, "RightX_Pos": 3, "RightX_Value": 1023, "RightY_Neg": 3, "RightY_Ntrl": 3, "RightY_Pos": 3, "RightY_Value": 1023}
    ${xcp_var_map}=    Evaluate    {"Btn_1": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_1", "Btn_2": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_2", "Btn_3": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_3", "Btn_4": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.Btn_4", "RightX_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Neg", "RightX_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Ntrl", "RightX_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Pos", "RightX_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightX_Value", "RightY_Neg": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Neg", "RightY_Ntrl": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Ntrl", "RightY_Pos": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Pos", "RightY_Value": "Rte_C_SG_mRightJoyStat_adt_019A5B5EB044A293131A2907275C12C5.RightY_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"Btn_1": 3, "Btn_2": 3, "Btn_3": 3, "Btn_4": 3, "RightX_Neg": 3, "RightX_Ntrl": 3, "RightX_Pos": 3, "RightX_Value": 1023, "RightY_Neg": 3, "RightY_Ntrl": 3, "RightY_Pos": 3, "RightY_Value": 1023}
    Validate TX Message With Expected Values    mRightJoyStat    ${expected_can_signals}    60
	
AD-TX-0xCFDD934: Send Tx XCP variables and validating on CAN signals for message mRightJoyStat2
    [Documentation]    Validate TX message 'mRightJoyStat2' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"RightZ_Neg": 0, "RightZ_Ntrl": 0, "RightZ_Pos": 0, "RightZ_Value": 0}
    ${xcp_var_map}=    Evaluate    {"RightZ_Neg": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Neg", "RightZ_Ntrl": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Ntrl", "RightZ_Pos": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Pos", "RightZ_Value": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"RightZ_Neg": 0, "RightZ_Ntrl": 0, "RightZ_Pos": 0, "RightZ_Value": 0}
    Validate TX Message With Expected Values    mRightJoyStat2    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"RightZ_Neg": 1, "RightZ_Ntrl": 1, "RightZ_Pos": 1, "RightZ_Value": 557}
    ${xcp_var_map}=    Evaluate    {"RightZ_Neg": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Neg", "RightZ_Ntrl": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Ntrl", "RightZ_Pos": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Pos", "RightZ_Value": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"RightZ_Neg": 1, "RightZ_Ntrl": 1, "RightZ_Pos": 1, "RightZ_Value": 557}
    Validate TX Message With Expected Values    mRightJoyStat2    ${expected_can_signals}    60
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"RightZ_Neg": 2, "RightZ_Ntrl": 2, "RightZ_Pos": 2, "RightZ_Value": 557}
    ${xcp_var_map}=    Evaluate    {"RightZ_Neg": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Neg", "RightZ_Ntrl": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Ntrl", "RightZ_Pos": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Pos", "RightZ_Value": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"RightZ_Neg": 2, "RightZ_Ntrl": 2, "RightZ_Pos": 2}
    Validate TX Message With Expected Values    mRightJoyStat2    ${expected_can_signals}    60

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"RightZ_Neg": 3, "RightZ_Ntrl": 3, "RightZ_Pos": 3, "RightZ_Value": 1023}
    ${xcp_var_map}=    Evaluate    {"RightZ_Neg": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Neg", "RightZ_Ntrl": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Ntrl", "RightZ_Pos": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Pos", "RightZ_Value": "Rte_C_SG_mRightJoyStat2_adt_5090D40555F0B87C7006AED5A17F5B7D.RightZ_Value"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"RightZ_Neg": 3, "RightZ_Ntrl": 3, "RightZ_Pos": 3, "RightZ_Value": 1023}
    Validate TX Message With Expected Values    mRightJoyStat2    ${expected_can_signals}    60
	
AD-TX-0x29C: Send Tx XCP variables and validating on CAN signals for message mSbwCals
    [Documentation]    Validate TX message 'mSbwCals' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"CenterBit": 0, "LeftEndStopVal": 0, "MsgCntr": 0, "MsgCrc": 0, "RightEndStopVal": 0}
    ${xcp_var_map}=    Evaluate    {"CenterBit": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.CenterBit", "LeftEndStopVal": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.LeftEndStopVal", "MsgCntr": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.MsgCrc", "RightEndStopVal": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.RightEndStopVal"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CenterBit": 0, "LeftEndStopVal": 0, "MsgCntr": 0, "MsgCrc": 0, "RightEndStopVal": 0}
    Validate TX Message With Expected Values    mSbwCals    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"CenterBit": 557, "LeftEndStopVal": 557, "MsgCntr": 65, "MsgCrc": 65, "RightEndStopVal": 557}
    ${xcp_var_map}=    Evaluate    {"CenterBit": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.CenterBit", "LeftEndStopVal": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.LeftEndStopVal", "MsgCntr": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.MsgCrc", "RightEndStopVal": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.RightEndStopVal"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CenterBit": 557, "LeftEndStopVal": 557, "MsgCntr": 65, "MsgCrc": 65, "RightEndStopVal": 557}
    Validate TX Message With Expected Values    mSbwCals    ${expected_can_signals}    60	

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"CenterBit": 1023, "LeftEndStopVal": 1023, "MsgCntr": 255, "MsgCrc": 255, "RightEndStopVal": 1023}
    ${xcp_var_map}=    Evaluate    {"CenterBit": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.CenterBit", "LeftEndStopVal": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.LeftEndStopVal", "MsgCntr": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.MsgCrc", "RightEndStopVal": "Rte_C_SG_mSbwCals_adt_C5C799796E02D597EC1C445F0053F926.RightEndStopVal"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"CenterBit": 1023, "LeftEndStopVal": 1023, "MsgCntr": 255, "MsgCrc": 255, "RightEndStopVal": 1023}
    Validate TX Message With Expected Values    mSbwCals    ${expected_can_signals}    60
	
AD-TX-0x292: Send Tx XCP variables and validating on CAN signals for message mSbwStat2
    [Documentation]    Validate TX message 'mSbwStat2' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"FaultLight": 0, "FltCode": 0, "HostMode": 0, "LeftStopLmt": 0, "MtrAdjust": 0, "OverTemp": 0, "ProtectActive": 0, "RemModeActive": 0, "RightStopLmt": 0, "RS232Mode": 0, "SelectedMap": 0, "SteerAngle": 0, "SteerAngle8b": 0}
    ${xcp_var_map}=    Evaluate    {"FaultLight": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FaultLight", "FltCode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FltCode", "HostMode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.HostMode", "LeftStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.LeftStopLmt", "MtrAdjust": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.MtrAdjust", "OverTemp": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.OverTemp", "ProtectActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.ProtectActive", "RemModeActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RemModeActive", "RightStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RightStopLmt", "RS232Mode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RS232Mode", "SelectedMap": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SelectedMap", "SteerAngle": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle", "SteerAngle8b": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle8b"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"FaultLight": 0, "FltCode": 0, "HostMode": 0, "LeftStopLmt": 0, "MtrAdjust": 0, "OverTemp": 0, "ProtectActive": 0, "RemModeActive": 0, "RightStopLmt": 0, "RS232Mode": 0, "SelectedMap": 0, "SteerAngle": 0, "SteerAngle8b": 0}
    Validate TX Message With Expected Values    mSbwStat2    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"FaultLight": 0, "FltCode": 100, "HostMode": 0, "LeftStopLmt": 0, "MtrAdjust": 1, "OverTemp": 0, "ProtectActive": 0, "RemModeActive": 0, "RightStopLmt": 0, "RS232Mode": 0, "SelectedMap": 4, "SteerAngle": 457, "SteerAngle8b": 157}
    ${xcp_var_map}=    Evaluate    {"FaultLight": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FaultLight", "FltCode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FltCode", "HostMode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.HostMode", "LeftStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.LeftStopLmt", "MtrAdjust": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.MtrAdjust", "OverTemp": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.OverTemp", "ProtectActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.ProtectActive", "RemModeActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RemModeActive", "RightStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RightStopLmt", "RS232Mode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RS232Mode", "SelectedMap": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SelectedMap", "SteerAngle": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle", "SteerAngle8b": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle8b"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"FltCode": 100, "MtrAdjust": 1, "SelectedMap": 4, "SteerAngle": 457, "SteerAngle8b": 157}
    Validate TX Message With Expected Values    mSbwStat2    ${expected_can_signals}    30	
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"FaultLight": 0, "FltCode": 100, "HostMode": 0, "LeftStopLmt": 0, "MtrAdjust": 2, "OverTemp": 0, "ProtectActive": 0, "RemModeActive": 0, "RightStopLmt": 0, "RS232Mode": 0, "SelectedMap": 4, "SteerAngle": 457, "SteerAngle8b": 157}
    ${xcp_var_map}=    Evaluate    {"FaultLight": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FaultLight", "FltCode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FltCode", "HostMode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.HostMode", "LeftStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.LeftStopLmt", "MtrAdjust": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.MtrAdjust", "OverTemp": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.OverTemp", "ProtectActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.ProtectActive", "RemModeActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RemModeActive", "RightStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RightStopLmt", "RS232Mode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RS232Mode", "SelectedMap": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SelectedMap", "SteerAngle": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle", "SteerAngle8b": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle8b"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MtrAdjust": 2}
    Validate TX Message With Expected Values    mSbwStat2    ${expected_can_signals}    30	

    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"FaultLight": 0, "FltCode": 109, "HostMode": 0, "LeftStopLmt": 0, "MtrAdjust": 3, "OverTemp": 0, "ProtectActive": 0, "RemModeActive": 0, "RightStopLmt": 0, "RS232Mode": 0, "SelectedMap": 7, "SteerAngle": 1023, "SteerAngle8b": 255}
    ${xcp_var_map}=    Evaluate    {"FaultLight": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FaultLight", "FltCode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.FltCode", "HostMode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.HostMode", "LeftStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.LeftStopLmt", "MtrAdjust": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.MtrAdjust", "OverTemp": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.OverTemp", "ProtectActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.ProtectActive", "RemModeActive": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RemModeActive", "RightStopLmt": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RightStopLmt", "RS232Mode": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.RS232Mode", "SelectedMap": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SelectedMap", "SteerAngle": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle", "SteerAngle8b": "Rte_C_SG_mSbwStat2_adt_4E93F951A6AF28CFAE8E762B408EECB3.SteerAngle8b"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"FaultLight": 0, "FltCode": 109, "HostMode": 0, "LeftStopLmt": 0, "MtrAdjust": 3, "OverTemp": 0, "ProtectActive": 0, "RemModeActive": 0, "RightStopLmt": 0, "RS232Mode": 0, "SelectedMap": 7, "SteerAngle": 1023, "SteerAngle8b": 255}
    Validate TX Message With Expected Values    mSbwStat2    ${expected_can_signals}    30
	
AD-TX-0x294: Send Tx XCP variables and validating on CAN signals for message mSbwSys_Allied
    [Documentation]    Validate TX message 'mSbwSys_Allied' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftEndStopValue": 0, "MsgCntr": 0, "MsgCrc": 0, "ProgOffset": -327.68, "SwVerMaj": 0, "SwVerMin": 0, "SwVerRev": 0}
    ${xcp_var_map}=    Evaluate    {"LeftEndStopValue": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.LeftEndStopValue", "MsgCntr": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCrc", "ProgOffset": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.ProgOffset", "SwVerMaj": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMaj", "SwVerMin": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMin", "SwVerRev": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerRev"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"LeftEndStopValue": 0, "MsgCntr": 0, "MsgCrc": 0, "ProgOffset": -327.68, "SwVerMaj": 0, "SwVerMin": 0, "SwVerRev": 0}
    Validate TX Message With Expected Values    mSbwSys_Allied    ${expected_can_signals}    60

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftEndStopValue": 0, "MsgCntr": 65, "MsgCrc": 65, "ProgOffset": -200, "SwVerMaj": 11, "SwVerMin": 11, "SwVerRev": 11}
    ${xcp_var_map}=    Evaluate    {"LeftEndStopValue": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.LeftEndStopValue", "MsgCntr": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCrc", "ProgOffset": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.ProgOffset", "SwVerMaj": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMaj", "SwVerMin": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMin", "SwVerRev": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerRev"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 65, "MsgCrc": 65, "ProgOffset": -200, "SwVerMaj": 11, "SwVerMin": 11, "SwVerRev": 11}
    Validate TX Message With Expected Values    mSbwSys_Allied    ${expected_can_signals}    60
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftEndStopValue": 0, "MsgCntr": 65, "MsgCrc": 65, "ProgOffset": 400, "SwVerMaj": 11, "SwVerMin": 11, "SwVerRev": 11}
    ${xcp_var_map}=    Evaluate    {"LeftEndStopValue": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.LeftEndStopValue", "MsgCntr": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCrc", "ProgOffset": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.ProgOffset", "SwVerMaj": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMaj", "SwVerMin": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMin", "SwVerRev": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerRev"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"ProgOffset": 400}
    Validate TX Message With Expected Values    mSbwSys_Allied    ${expected_can_signals}    60
	
    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"LeftEndStopValue": 0, "MsgCntr": 255, "MsgCrc": 255, "ProgOffset": 327.67, "SwVerMaj": 15, "SwVerMin": 15, "SwVerRev": 15}
    ${xcp_var_map}=    Evaluate    {"LeftEndStopValue": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.LeftEndStopValue", "MsgCntr": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCntr", "MsgCrc": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.MsgCrc", "ProgOffset": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.ProgOffset", "SwVerMaj": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMaj", "SwVerMin": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerMin", "SwVerRev": "Rte_C_SG_mSbwSys_Allied_adt_64C2C0B7A07F477F63C1DAE2C67264ED.SwVerRev"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 255, "MsgCrc": 255, "ProgOffset": 327.67, "SwVerMaj": 15, "SwVerMin": 15, "SwVerRev": 15}
    Validate TX Message With Expected Values    mSbwSys_Allied    ${expected_can_signals}    60
	
AD-TX-0x120: Send Tx XCP variables and validating on CAN signals for message mTOStat
    [Documentation]    Validate TX message 'mTOStat' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 0, "TO_cmd_veh_mode": 0, "TO_ConnectionStat": 0, "TO_dlg_resp_code": 0, "TO_dlg_resp_id": 0, "VehDirCmd": 0}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCntr", "MsgCrc": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCrc", "TO_cmd_veh_mode": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_cmd_veh_mode", "TO_ConnectionStat": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_ConnectionStat", "TO_dlg_resp_code": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_code", "TO_dlg_resp_id": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_id", "VehDirCmd": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.VehDirCmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 0, "TO_cmd_veh_mode": 0, "TO_ConnectionStat": 0, "TO_dlg_resp_code": 0, "TO_dlg_resp_id": 0, "VehDirCmd": 0}
    Validate TX Message With Expected Values    mTOStat    ${expected_can_signals}    50

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 65, "MsgCrc": 65, "TO_cmd_veh_mode": 3, "TO_ConnectionStat": 1, "TO_dlg_resp_code": 1, "TO_dlg_resp_id": 1, "VehDirCmd": 1}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCntr", "MsgCrc": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCrc", "TO_cmd_veh_mode": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_cmd_veh_mode", "TO_ConnectionStat": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_ConnectionStat", "TO_dlg_resp_code": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_code", "TO_dlg_resp_id": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_id", "VehDirCmd": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.VehDirCmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 65, "MsgCrc": 65, "TO_cmd_veh_mode": 3, "TO_ConnectionStat": 1, "TO_dlg_resp_code": 1, "TO_dlg_resp_id": 1, "VehDirCmd": 1}
    Validate TX Message With Expected Values    mTOStat    ${expected_can_signals}    50
	
	Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 65, "MsgCrc": 65, "TO_cmd_veh_mode": 3, "TO_ConnectionStat": 1, "TO_dlg_resp_code": 1, "TO_dlg_resp_id": 1, "VehDirCmd": 2}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCntr", "MsgCrc": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCrc", "TO_cmd_veh_mode": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_cmd_veh_mode", "TO_ConnectionStat": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_ConnectionStat", "TO_dlg_resp_code": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_code", "TO_dlg_resp_id": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_id", "VehDirCmd": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.VehDirCmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"VehDirCmd": 2}
    Validate TX Message With Expected Values    mTOStat    ${expected_can_signals}    50
	
    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 255, "MsgCrc": 255, "TO_cmd_veh_mode": 4, "TO_ConnectionStat": 2, "TO_dlg_resp_code": 3, "TO_dlg_resp_id": 2, "VehDirCmd": 3}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCntr", "MsgCrc": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.MsgCrc", "TO_cmd_veh_mode": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_cmd_veh_mode", "TO_ConnectionStat": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_ConnectionStat", "TO_dlg_resp_code": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_code", "TO_dlg_resp_id": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.TO_dlg_resp_id", "VehDirCmd": "Rte_C_SG_mTOStat_adt_72A4F7982583CB56A92F5A6C46AFDFD7.VehDirCmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 255, "MsgCrc": 255, "TO_cmd_veh_mode": 4, "TO_ConnectionStat": 2, "TO_dlg_resp_code": 3, "TO_dlg_resp_id": 2, "VehDirCmd": 3}
    Validate TX Message With Expected Values    mTOStat    ${expected_can_signals}    50
	
AD-TX-0x121: Send Tx XCP variables and validating on CAN signals for message mVehCtrlTORq
    [Documentation]    Validate TX message 'mVehCtrlTORq' by writing XCP variables and reading CAN signals
    
    Log  writing min value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 0, "TO_Accel_Cmd": -1, "TO_EstopRq": 0, "TO_Steer_Cmd": -1}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.MsgCntr", "MsgCrc": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.MsgCrc", "TO_Accel_Cmd": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_Accel_Cmd", "TO_EstopRq": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_EstopRq", "TO_Steer_Cmd": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_Steer_Cmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 0, "MsgCrc": 0, "TO_Accel_Cmd": -1, "TO_EstopRq": 0, "TO_Steer_Cmd": -1}
    Validate TX Message With Expected Values    mVehCtrlTORq    ${expected_can_signals}    30

    Log  writing mid value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 10, "MsgCrc": 150, "TO_Accel_Cmd": 0.5, "TO_EstopRq": 0, "TO_Steer_Cmd": 0.5}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.MsgCntr", "MsgCrc": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.MsgCrc", "TO_Accel_Cmd": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_Accel_Cmd", "TO_EstopRq": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_EstopRq", "TO_Steer_Cmd": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_Steer_Cmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 10, "MsgCrc": 150, "TO_Accel_Cmd": 0.5, "TO_Steer_Cmd": 0.5}
    Validate TX Message With Expected Values    mVehCtrlTORq    ${expected_can_signals}    30
	
    Log  writing max value to the xcp variables
    ${xcp_values}=    Evaluate    {"MsgCntr": 15, "MsgCrc": 255, "TO_Accel_Cmd": 1, "TO_EstopRq": 1, "TO_Steer_Cmd": 1}
    ${xcp_var_map}=    Evaluate    {"MsgCntr": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.MsgCntr", "MsgCrc": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.MsgCrc", "TO_Accel_Cmd": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_Accel_Cmd", "TO_EstopRq": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_EstopRq", "TO_Steer_Cmd": "Rte_C_SG_mVehCtrlTORq_adt_F75C037B34B1950B84945CE7E091120D.TO_Steer_Cmd"}
    Write Multiple XCP Variables    ${xcp_var_map}    ${xcp_values}
    ${expected_can_signals}=    Evaluate    {"MsgCntr": 15, "MsgCrc": 255, "TO_Accel_Cmd": 1, "TO_EstopRq": 1, "TO_Steer_Cmd": 1}
    Validate TX Message With Expected Values    mVehCtrlTORq    ${expected_can_signals}    30
	
	
	
	