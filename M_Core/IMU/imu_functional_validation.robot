*** Settings ***
Library           imu_canape_interface.py
Suite Setup       Open Canape And Load IMU Configuration
Suite Teardown    Close Canape

*** Test Cases ***

# IMU Module Test Case
CGMN-XXXX: Verify the CGVCU software shall configure the accelerometer’s full-scale value to ±2g.
  [Documentation]  Verify the CGVCU software shall configure the accelerometer’s full-scale value to ±2g.
  Log    verifies from SWE.1 Requriment: XXXX

 # Read the current value of the accelerometer’s full-scale value
  ${value}=  Read XCP Variable  accelFsValue
  Log  Current accelerometer’s full-scale value: ${value}

  # Validate if the full-scale value is set to ±2g
  Should Be Equal As Numbers        ${value}  0
    Log  accelerometer’s full-scale value is correctly set to ±2g (0).

  CGMN-XXXX: Verify the CGVCU software shall configure the gyroscope bandwidth to 41 Hz
  [Documentation]  Verify the CGVCU software shall configure the gyroscope bandwidth to 41 Hz
  Log  verifies from SWE.1 Requriment: XXXX

 # Read the current value of the gyroscope bandwidth
  ${value}=  Read XCP Variable  gyroBwValue
  Log  Current gyroscope full-scale value: ${value}

  # Validate if the bandwidth set to 41 Hz
  Should Be Equal As Numbers        ${value}  4
    Log  Gyroscope bandwidth is correctly set to 41 Hz (4)