*** Settings ***
Library           imu_canape_interface.py
Suite Setup       Open Canape And Load IMU Configuration
Suite Teardown    Close Canape

*** Test Cases ***

# IMU Module Test Case
CGMN-XXXX: Verify the CGVCU software shall configure the gyroscope’s full-scale value to ±250 DPS.
    [Documentation]    Verify the CGVCU software shall configure the gyroscope’s full-scale value to ±250 DPS
    Log    verifies from SWE.1 Requriment: XXXX

    # Read the current value of the gyroscope full-scale configuration
    ${value}=    Read XCP Variable    gyroFsValue
    Log    Current gyroscope full-scale value: ${value}
    
    # Validate if the full-scale value is set to ±250 DPS
    Should Be Equal As Numbers    ${value}    0
    Log    Gyroscope full-scale value is correctly set to ±250 DPS (0).