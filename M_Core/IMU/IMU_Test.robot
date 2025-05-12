*** Settings ***
Library    IMU_Library.py


*** Variables ***
${tolerance}    1e-1

*** Test Cases ***

Test 1: Verify the CGVCU software shall configure the gyroscope’s full-scale value to ±250 DPS.
    [Documentation]    Verifying the CGVCU software shall configure the gyroscope’s full-scale value to ±250 DPS.

    Connect To Canape
    ${xcp_var}=    Set Variable    gyroFsValue
    ${value}=      Read Validate    ${xcp_var}
    Log     ${value}
    Should Be Equal As Numbers    ${value}    0
    Log    Observation: Gyroscope full-scale value read as ${value}. It matches the expected value (0 => ±250 DPS).

Test TC1_1: Verify the Accelerometer values from IMU chip, when board is in stationary position.
    [Documentation]    Verifying to read the Accelerometer values from IMU chip, when board is in stationary position.

    Connect To Canape

    ${value}=      Read Validate   Accel._0_
    Log     ${value}
    ${is_zero}=    Evaluate    ${value} <= ${tolerance}
    Should Be True    ${is_zero}
    Log    Observation: Accelerometer value read as ${value}. It matches the expected value (nearly equal to zero).


Test TC1_2: Verify the Accelerometer values from IMU chip, when board is in stationary position.
    [Documentation]    Verifying to read the Accelerometer values from IMU chip, when board is in stationary position.

    Connect To Canape

    ${value}=      Read Validate   Accel._1_
    Log     ${value}
    ${is_zero}=    Evaluate    ${value} <= ${tolerance}
    Should Be True    ${is_zero}
    Log    Observation: Accelerometer value read as ${value}. It matches the expected value (nearly equal to zero).


Test TC1_3: Verify the Accelerometer values from IMU chip, when board is in stationary position.
    [Documentation]    Verifying to read the Accelerometer values from IMU chip, when board is in stationary position.

    Connect To Canape

    ${value}=      Read Validate   Accel._2_
    Log     ${value}
    ${is_near_one}=    Evaluate    abs(${value} - 1.0) <= ${tolerance}
    Should Be True    ${is_near_one}
    Log    Observation: Accelerometer value read as ${value}. It matches the expected value (nearly equal to One).
	
	
	
