*** Settings ***
Library           imu_canape_interface.py
Suite Setup       Open Canape And Load IMU Configuration
Suite Teardown    Close Canape

*** Variables ***
${tolerance}    1e-1

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
CGMN-XXXX: Verify the Accelerometer values from IMU chip, when board is in stationary position.
    [Documentation]    Verify the Accelerometer values from IMU chip, when board is in stationary position.
    Log    verifies from SWE.1 Requriment: XXXX

    # Read the current value of the Accelerometer 'x' values
    ${value_0}=    Read XCP Variable    Accel._0_
    Log    current value of the Accelerometer 'x' values: ${value_0}

    # Read the current value of the Accelerometer 'y' values
    ${value_1}=    Read XCP Variable    Accel._1_
    Log    current value of the Accelerometer 'y' values: ${value_1}

    # Read the current value of the Accelerometer 'z' values
    ${value_2}=    Read XCP Variable    Accel._2_
    Log    current value of the Accelerometer 'z' values: ${value_2}

    # Validate if the Accelerometer 'x' value is nearly equal to zero
    Should Be True    ${value_0} <= ${tolerance}
    Log    Accelerometer 'x' value read as ${value_0}. It matches the expected value (nearly equal to zero).

    # Validate if the Accelerometer 'y' value is nearly equal to zero
    Should Be True    ${value_1} <= ${tolerance}
    Log    Accelerometer 'y' value read as ${value_1}. It matches the expected value (nearly equal to zero).

    # Validate if the Accelerometer 'z' value is nearly equal to one
    Should Be True    ${value_2} - 1.0 <= ${tolerance}
    Log    Accelerometer 'z' value read as ${value_2}. It matches the expected value (nearly equal to one).

CGMN-XXXX: Verify the Gyroscope values from IMU chip, when board is in stationary position.
    [Documentation]    Verify the Gyroscope values from IMU chip, when board is in stationary position.
    Log    verifies from SWE.1 Requriment: XXXX

    # Read the current value of the Gyroscope 'x' values
    ${value_0}=    Read XCP Variable    Gyro._0_
    Log    current value of the Gyroscope 'x' values: ${value_0}

    # Read the current value of the Gyroscope 'y' values
    ${value_1}=    Read XCP Variable    Gyro._1_
    Log    current value of the Gyroscope 'y' values: ${value_1}

    # Read the current value of the Gyroscope 'z' values
    ${value_2}=    Read XCP Variable    Gyro._2_
    Log    current value of the Gyroscope 'z' values: ${value_2}

    # Validate if the Gyroscope 'x' value is nearly equal to zero
    Should Be True    ${value_0} <= ${tolerance}
    Log    Gyroscope 'x' value read as ${value_0}. It matches the expected value (nearly equal to zero).

    # Validate if the Gyroscope 'y' value is nearly equal to zero
    Should Be True    ${value_1} <= ${tolerance}
    Log    Gyroscope 'y' value read as ${value_1}. It matches the expected value (nearly equal to zero).

    # Validate if the Gyroscope 'z' value is nearly equal to one
    Should Be True    ${value_2} <= ${tolerance}
    Log    Gyroscope 'z' value read as ${value_2}. It matches the expected value (nearly equal to zero).
