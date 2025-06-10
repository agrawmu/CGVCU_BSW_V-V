*** Settings ***
Library           HSLS_canape_interface.py
Suite Setup       Open Canape And Load IMU Configuration
Suite Teardown    Close Canape

*** Variables ***
${set_value}    1
${reset_value}    0

# HSLS Module Test Case
*** Test Cases ***
CGMN-XXXX: Verify signal OUT_HSLS_0 under Normal voltage Operation
    [Documentation]    Verify OUT_HSLS_0 signal under normal voltage conditions
    Log    Verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_00
    Log    Initial value of HSLSOut_00: ${initial_val}

    ${set_val}=    Convert To Number    ${set_value}
    Write Xcp Variable    HSLSOut_00    ${set_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._0_
    Verify LED    HSLSOut_00    ${set_val}    OUT_HSLS_0    ${observed_val}

    ${reset_val}=    Convert To Number    ${reset_value}
    Write Xcp Variable    HSLSOut_00    ${reset_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._0_
    Verify LED    HSLSOut_00    ${reset_val}    OUT_HSLS_0    ${observed_val}



CGMN-XXXX: Verify signal OUT_HSLS_1 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_1 under normal voltage operation to validate signal response.
    Log    Verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_01
    Log    Initial value of HSLSOut_01: ${initial_val}

    ${set_val}=    Convert To Number    ${set_value}
    Write Xcp Variable    HSLSOut_01    ${set_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._1_
    Verify LED    HSLSOut_01    ${set_val}    OUT_HSLS_1    ${observed_val}

    ${reset_val}=    Convert To Number    ${reset_value}
    Write Xcp Variable    HSLSOut_01    ${reset_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._1_
    Verify LED    HSLSOut_01    ${reset_val}    OUT_HSLS_1    ${observed_val}

CGMN-XXXX: Verify signal OUT_HSLS_2 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_2 under normal voltage operation to validate signal response.
    Log    Verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_02
    Log    Initial value of HSLSOut_02: ${initial_val}

    ${set_val}=    Convert To Number    ${set_value}
    Write Xcp Variable    HSLSOut_02    ${set_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._2_
    Verify LED    HSLSOut_02    ${set_val}    OUT_HSLS_2    ${observed_val}

    ${reset_val}=    Convert To Number    ${reset_value}
    Write Xcp Variable    HSLSOut_02    ${reset_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._2_
    Verify LED    HSLSOut_02    ${reset_val}    OUT_HSLS_2    ${observed_val}


CGMN-XXXX: Verify signal OUT_HSLS_3 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_3 under normal voltage operation to validate signal response.
    Log    Verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_03
    Log    Initial value of HSLSOut_03: ${initial_val}

    ${set_val}=    Convert To Number    ${set_value}
    Write Xcp Variable    HSLSOut_03    ${set_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._3_
    Verify LED    HSLSOut_03    ${set_val}    OUT_HSLS_3    ${observed_val}

    ${reset_val}=    Convert To Number    ${reset_value}
    Write Xcp Variable    HSLSOut_03    ${reset_val}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._3_
    Verify LED    HSLSOut_03    ${reset_val}    OUT_HSLS_3    ${observed_val}


*** Test Cases ***
CGMN-XXXX: Verify signal OUT_HSLS_4 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_4 under normal voltage operation to validate signal response.
    Log    verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_04
    Log    Initial value: ${initial_val}

    Write Xcp Variable    HSLSOut_04    ${set_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._4_
    Verify LED    HSLSOut_04    ${set_value}    OUT_HSLS_4    ${observed_val}

    Write Xcp Variable    HSLSOut_04    ${reset_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._4_
    Verify LED    HSLSOut_04    ${reset_value}    OUT_HSLS_4    ${observed_val}

CGMN-XXXX: Verify signal OUT_HSLS_5 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_5 under normal voltage operation to validate signal response.
    Log    verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_05
    Log    Initial value: ${initial_val}

    Write Xcp Variable    HSLSOut_05    ${set_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._5_
    Verify LED    HSLSOut_05    ${set_value}    OUT_HSLS_5    ${observed_val}

    Write Xcp Variable    HSLSOut_05    ${reset_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._5_
    Verify LED    HSLSOut_05    ${reset_value}    OUT_HSLS_5    ${observed_val}

CGMN-XXXX: Verify signal OUT_HSLS_6 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_6 under normal voltage operation to validate signal response.
    Log    verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_06
    Log    Initial value: ${initial_val}

    Write Xcp Variable    HSLSOut_06    ${set_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._6_
    Verify LED    HSLSOut_06    ${set_value}    OUT_HSLS_6    ${observed_val}

    Write Xcp Variable    HSLSOut_06    ${reset_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._6_
    Verify LED    HSLSOut_06    ${reset_value}    OUT_HSLS_6    ${observed_val}

CGMN-XXXX: Verify signal OUT_HSLS_7 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_7 under normal voltage operation to validate signal response.
    Log    verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_07
    Log    Initial value: ${initial_val}

    Write Xcp Variable    HSLSOut_07    ${set_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._7_
    Verify LED    HSLSOut_07    ${set_value}    OUT_HSLS_7    ${observed_val}

    Write Xcp Variable    HSLSOut_07    ${reset_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._7_
    Verify LED    HSLSOut_07    ${reset_value}    OUT_HSLS_7    ${observed_val}

CGMN-XXXX: Verify signal OUT_HSLS_8 under Normal voltage Operation
    [Documentation]    Verify the functionality of OUT_HSLS_8 under normal voltage operation to validate signal response.
    Log    verifies from SWE.1 Requirement: XXXX

    ${initial_val}=    Read XCP Variable    HSLSOut_08
    Log    Initial value: ${initial_val}

    Write Xcp Variable    HSLSOut_08    ${set_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._8_
    Verify LED    HSLSOut_08    ${set_value}    OUT_HSLS_8    ${observed_val}

    Write Xcp Variable    HSLSOut_08    ${reset_value}
    Sleep    1s
    ${observed_val}=    Read XCP Variable    Prev_HSLS_State._8_
    Verify LED    HSLSOut_08    ${reset_value}    OUT_HSLS_8    ${observed_val}