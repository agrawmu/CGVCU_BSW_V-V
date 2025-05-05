*** Settings ***
Library    SSHLibrary
Library    BuiltIn
Library    String
Library    Collections
Library    OperatingSystem
Library    re
Library    DateTime

Test Setup       Connect To Remote Machine
Test Teardown   Close Connection

*** Variables ***
${REMOTE_IP}    192.168.0.22
${USERNAME}     root

*** Keywords ***
Connect To Remote Machine
    Open Connection    ${REMOTE_IP}
    Login    ${USERNAME}

*** Test Cases ***

1 Test Case CGMN-17745: To verify that the GNSS Device is enabled
    [Documentation]    Verifying the GNSS0 and GNSS1 exist in /dev.
    ${output}=    Execute Command    ls /dev
    Should Contain    ${output}    gnss0
    Should Contain    ${output}    gnss1
    Log    Observed the GNSS0 and GNSS1 devices are successfully detected under /dev.

2 Test Case CGMN-17747: To Verify I2C Is Enabled
    [Documentation]    Verifying I2C is enabled by looking for "i2c" in dmesg output.
    ${output}=    Execute Command    dmesg | grep i2c
    Should Contain    ${output}    i2c-0: using pinctrl states for GPIO recovery
    Should Contain    ${output}    i2c-0: using generic GPIOs for recovery
    Log    Observed I2C initialization in dmesg output.

3 Test Case CGMN-17748: To verify the status of serial port configuration
    [Documentation]    Checking PCA device initialization in dmesg and verifying register values.
    ${output}=    Execute Command    dmesg | grep "pca"
    Should Contain    ${output}    pca953x 0-0074

    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x06
    Should Contain    ${output}    0x57

    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x02
    Should Contain    ${output}    0x5f
    Log    Verified serial port configuration from PCA device.

4 Test Case CGMN-17749: To Verify SPI is enabled after initialization
    [Documentation]    Checking SPI initialization in dmesg.
    ${output}=    Execute Command    dmesg | grep spi
    Should Contain    ${output}    zedf9p04b spi1.0: ZEDF9P04B GNSS module initialized
    Should Contain    ${output}    zedf9p04b spi1.1: ZEDF9P04B GNSS module initialized
    Log    Verified SPI initialization from dmesg output.

#5 Test Case CGMN-17750: To Verify the data getting from GNSS0
#    [Documentation]    Reading GNSS0 data and verifying NMEA sentences.
#    ${output}=    Execute Command    timeout 4s cat /dev/gnss0
#    Should Contain    ${output}    $GNGSA,A,1,,,,,,,,,,,,,99.99,99.99,99.99,5*37
#    Should Contain    ${output}    $GNGLL,,,,,,V,N*7A
#    Log    GNSS0 data successfully verified.
#
#6 Test Case CGMN-17746: To Verify the data getting from GNSS1
#    [Documentation]    Reading GNSS1 data and verifying NMEA sentences.
#    ${output}=    Execute Command    timeout 4s cat /dev/gnss1
#    Should Contain    ${output}    $GLGSV,1,1,00,0*79
#    Should Contain    ${output}    $GNGLL,,,,,,V,N*7A
#    Log    GNSS1 data successfully verified.

5 Test Case CGMN-17897: To verify the successful detection of the I2C interface.
    [Documentation]    Checking I2C device detection on bus 0.
    ${output}=    Execute Command    timeout 4s i2cdetect -y 0
    Should Contain    ${output}    70: -- -- -- -- UU UU -- --
    Log    Verified I2C device detection.

#8 Test Case CGMN-17899: To verify I2C data transmission to GNSS0 register
#    [Documentation]    Validating data consistency in register 0x02 of GNSS0.
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x02
#    Should Contain    ${output}    0xdf
#
#    Execute Command    i2cset -f -y 0 0x74 0x02 0xff
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x02
#    Should Contain    ${output}    0xff
#
#    Execute Command    i2cset -f -y 0 0x74 0x02 0xdf
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x02
#    Should Contain    ${output}    0xdf
#    Log    Verified GNSS0 register updates.
#
#9 Test Case CGMN-17900: To verify I2C data transmission to GNSS1 register
#    [Documentation]    Validating data consistency in register 0x03 of GNSS1.
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x03
#    Should Contain    ${output}    0xdf
#
#    Execute Command    i2cset -f -y 0 0x74 0x03 0xff
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x03
#    Should Contain    ${output}    0xff
#
#    Execute Command    i2cset -f -y 0 0x74 0x03 0xdf
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x03
#    Should Contain    ${output}    0xdf
#    Log    Verified GNSS1 register updates.
#
#10 Test Case CGMN-17901: To Verify I2C data consistency in GNSS0 configuration register
#    [Documentation]    Ensuring register 0x06 data remains consistent.
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x06
#    Should Contain    ${output}    0x57
#
#    Execute Command    i2cset -f -y 0 0x74 0x06 0xff
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x06
#    Should Contain    ${output}    0xff
#
#    Execute Command    i2cset -f -y 0 0x74 0x06 0x57
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x06
#    Should Contain    ${output}    0x57
#    Log    Verified GNSS0 configuration register updates.
#
#11 Test Case CGMN-17898: To Verify I2C data consistency in GNSS1 configuration register
#    [Documentation]    Ensuring register 0x07 data remains consistent.
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x07
#    Should Contain    ${output}    0x57
#
#    Execute Command    i2cset -f -y 0 0x74 0x07 0xff
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x07
#    Should Contain    ${output}    0xff
#
#    Execute Command    i2cset -f -y 0 0x74 0x07 0x57
#    ${output}=    Execute Command    i2cget -f -y 0 0x74 0x07
#    Should Contain    ${output}    0x57
#    Log    Verified GNSS1 configuration register updates.
Test Case 6: To verify the functionality of the API to get successful retrieval of GPS and UTC time.
    [Documentation]    Verify the functionalities of the API to get the GPS and UTC time .
    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/time
    Log    ${GNSS_RESPONSE}

    ${utc_time}=        Get Regexp Matches    ${GNSS_RESPONSE}    UTC Date and Time:\\s*(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})    1
    ${gps_time}=        Get Regexp Matches    ${GNSS_RESPONSE}    GPS Date and Time:\\s*(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})    1
    ${gps_year}=        Get Regexp Matches    ${GNSS_RESPONSE}    GPS Year:\\s*(\\d{4})    1
    ${gps_week}=        Get Regexp Matches    ${GNSS_RESPONSE}    GPS Week:\\s*(\\d+)    1
    ${gps_doy}=         Get Regexp Matches    ${GNSS_RESPONSE}    GPS Day of Year:\\s*(\\d+)    1
    ${gps_weekday}=     Get Regexp Matches    ${GNSS_RESPONSE}    GPS Weekday:\\s*(\\d)    1
    ${seconds_week}=    Get Regexp Matches    ${GNSS_RESPONSE}    Seconds of Week:\\s*(\\d+)    1
    ${seconds_day}=     Get Regexp Matches    ${GNSS_RESPONSE}    Seconds of Day:\\s*(\\d+)    1
    ${gps_time_sec}=    Get Regexp Matches    ${GNSS_RESPONSE}    GPS Time in Seconds:\\s*(\\d+)    1

    Should Not Be Empty    ${utc_time}
    Should Not Be Empty    ${gps_time}
    Should Not Be Empty    ${gps_year}
    Should Not Be Empty    ${gps_week}
    Should Not Be Empty    ${gps_doy}
    Should Not Be Empty    ${gps_weekday}
    Should Not Be Empty    ${seconds_week}
    Should Not Be Empty    ${seconds_day}
    Should Not Be Empty    ${gps_time_sec}

    Should Match Regexp    ${utc_time}[0]    \\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}
    Should Match Regexp    ${gps_time}[0]    \\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}

    Log    Extracted UTC Time: ${utc_time}[0]
    Log    Extracted GPS Time: ${gps_time}[0]
    Log    Extracted GPS Year: ${gps_year}[0]
    Log    Extracted GPS Week: ${gps_week}[0]
    Log    Extracted GPS Day of Year: ${gps_doy}[0]
    Log    Extracted GPS Weekday: ${gps_weekday}[0]
    Log    Extracted Seconds of Week: ${seconds_week}[0]
    Log    Extracted Seconds of Day: ${seconds_day}[0]
    Log    Extracted GPS Time in Seconds: ${gps_time_sec}[0]

    Log    Successfully validated all GPS and UTC time components returned by the API.

Test Case 7: To verify the functionality of the API to get Latitude of the GPS .

    [Documentation]    Verify that the API returns the correct format for Latitude from the GNSS coordinates response.

    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/coordinates
    Log    ${GNSS_RESPONSE}

    ${latitude}=    Get Regexp Matches    ${GNSS_RESPONSE}    Latitude:\\s*([+-]?\\d+\\.\\d+)    1
    Should Not Be Empty    ${latitude}
    Log    Latitude: ${latitude[0]}

    # Optional: Validate latitude range
    ${lat_val}=    Convert To Number    ${latitude[0]}
    Should Be True    ${lat_val} >= -90 and ${lat_val} <= 90    Latitude is out of valid range

    Log    Successfully validated latitude format and value range from GNSS API.

Test Case 8: To verify the functionality of the API to get Longitude of the GPS .

    [Documentation]    Verify that the API returns the correct format for Longitude from the GNSS coordinates response.

    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/coordinates
    Log    ${GNSS_RESPONSE}

    ${longitude}=    Get Regexp Matches    ${GNSS_RESPONSE}    Longitude:\\s*([+-]?\\d+\\.\\d+)    1
    Should Not Be Empty    ${longitude}
    Log    Longitude: ${longitude[0]}

    # Optional: Validate longitude range
    ${long_val}=    Convert To Number    ${longitude[0]}
    Should Be True    ${long_val} >= -180 and ${long_val} <= 180    Longitude is out of valid range

    Log    Successfully validated longitude format and value range from GNSS API.
Test Case 9: To verify the GNSS coordinates contain both latitude and longitude in one response.
    [Documentation]    Verify that the GNSS coordinates API returns both latitude and longitude values together in a single response.

    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/coordinates
    Log    ${GNSS_RESPONSE}

    ${latitude}=    Get Regexp Matches    ${GNSS_RESPONSE}    Latitude:\\s*([+-]?\\d+\\.\\d+)    1
    ${longitude}=   Get Regexp Matches    ${GNSS_RESPONSE}    Longitude:\\s*([+-]?\\d+\\.\\d+)    1

    Should Not Be Empty    ${latitude}
    Should Not Be Empty    ${longitude}

    Log    GNSS API returned both Latitude: ${latitude[0]} and Longitude: ${longitude[0]} successfully.
Test Case 10: To verify the functionalities of the API to check consistency of GPS data.

    [Documentation]    Verify the GNSS API returns consistent latitude and longitude values over 5 consecutive calls.

    @{latitudes}=    Create List
    @{longitudes}=   Create List

    FOR    ${i}    IN RANGE    5
        ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/coordinates
        Log    GNSS Response ${i}: ${GNSS_RESPONSE}

        ${latitude}=    Get Regexp Matches    ${GNSS_RESPONSE}    Latitude:\\s*([+-]?\\d+\\.\\d+)    1
        Should Not Be Empty    ${latitude}
        ${lat_val}=    Convert To Number    ${latitude[0]}
        Should Be True    ${lat_val} >= -90 and ${lat_val} <= 90    Latitude is out of valid range
        Append To List    ${latitudes}    ${lat_val}

        ${longitude}=    Get Regexp Matches    ${GNSS_RESPONSE}    Longitude:\\s*([+-]?\\d+\\.\\d+)    1
        Should Not Be Empty    ${longitude}
        ${long_val}=    Convert To Number    ${longitude[0]}
        Should Be True    ${long_val} >= -180 and ${long_val} <= 180    Longitude is out of valid range
        Append To List    ${longitudes}    ${long_val}
    END

    Log    Latitude List: ${latitudes}
    Log    Longitude List: ${longitudes}

    ${ref_lat}=    Set Variable    ${latitudes[0]}
    ${ref_long}=   Set Variable    ${longitudes[0]}

    FOR    ${lat}    IN    @{latitudes}
        ${diff_lat}=    Evaluate    abs(${lat} - ${ref_lat})
        Should Be True    ${diff_lat} < 0.0001    Inconsistent latitude: ${lat} differs from ${ref_lat}
    END

    FOR    ${lon}    IN    @{longitudes}
        ${diff_long}=    Evaluate    abs(${lon} - ${ref_long})
        Should Be True    ${diff_long} < 0.0001    Inconsistent longitude: ${lon} differs from ${ref_long}
    END

    Log    GNSS coordinates remained consistent across all 5 API calls.



Test Case 11: To verify that GNSS time API does not return empty or error response.
    [Documentation]    Verify that the GNSS time API is reachable and returns a valid, non-empty response without any error strings.
    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/time
    Log    ${GNSS_RESPONSE}

    Should Not Be Empty    ${GNSS_RESPONSE}
    Should Not Contain     ${GNSS_RESPONSE}    error
    Should Not Contain     ${GNSS_RESPONSE}    404
    Should Not Contain     ${GNSS_RESPONSE}    not found

    Log    GNSS time API responded successfully without error content.

Test Case 12: To verify that GPS Time is ahead of UTC Time.
    [Documentation]    Verify that the GPS time is greater than the UTC time, accounting for the leap second difference.

    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/time
    Log    ${GNSS_RESPONSE}

    ${utc_time}=    Get Regexp Matches    ${GNSS_RESPONSE}    UTC Date and Time:\\s*(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})    1
    ${gps_time}=    Get Regexp Matches    ${GNSS_RESPONSE}    GPS Date and Time:\\s*(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})    1

    Should Not Be Empty    ${utc_time}
    Should Not Be Empty    ${gps_time}

    ${utc_secs}=    Convert Date    ${utc_time[0]}    result_format=epoch
    ${gps_secs}=    Convert Date    ${gps_time[0]}    result_format=epoch

    ${diff}=    Evaluate    ${gps_secs} - ${utc_secs}
    Should Be True    ${diff} >= 0    GPS time is not ahead of UTC

    Log    GPS time is ahead of or equal to UTC by ${diff} seconds.

Test Case 13: To verify that GPS Time is 18 seconds ahead of UTC Time.
    [Documentation]    Verify that the GPS time is exactly 18 seconds ahead of the UTC time, accounting for the leap second difference.

    ${GNSS_RESPONSE}=    Execute Command    curl http://localhost/gnss/time
    Log    ${GNSS_RESPONSE}

    ${utc_time}=    Get Regexp Matches    ${GNSS_RESPONSE}    UTC Date and Time:\\s*(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})    1
    ${gps_time}=    Get Regexp Matches    ${GNSS_RESPONSE}    GPS Date and Time:\\s*(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})    1

    Should Not Be Empty    ${utc_time}
    Should Not Be Empty    ${gps_time}

    ${utc_secs}=    Convert Date    ${utc_time[0]}    result_format=epoch
    ${gps_secs}=    Convert Date    ${gps_time[0]}    result_format=epoch

    ${diff}=    Evaluate    ${gps_secs} - ${utc_secs}
    Should Be Equal As Numbers    ${diff}    18    GPS time is not 18 seconds ahead of UTC

    Log    GPS time is exactly 18 seconds ahead of UTC.
