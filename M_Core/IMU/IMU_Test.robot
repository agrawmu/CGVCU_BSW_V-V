*** Settings ***
Library    IMU_Library.py

*** Test Cases ***

Test 1: Verify the CGVCU software shall configure the gyroscope’s full-scale value to ±250 DPS.
    [Documentation]    Verifying the CGVCU software shall configure the gyroscope’s full-scale value to ±250 DPS.

    Connect To Canape
    ${xcp_var}=    Set Variable    gyroFsValue
    ${value}=      Read Validate    ${xcp_var}
    Log     ${value}
    Should Be Equal As Numbers    ${value}    0
    Log    Observation: Gyroscope full-scale value read as ${value}. It matches the expected value (0 => ±250 DPS).
