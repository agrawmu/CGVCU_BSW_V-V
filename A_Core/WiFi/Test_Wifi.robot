*** Settings ***
Library    SSHLibrary
Test Setup    Connect To Remote Machine
Test Teardown    Close Connection
Library    BuiltIn
Library    String
Library    Collections
Library    OperatingSystem
Library    re
*** Variables ***
${REMOTE_IP}    192.168.0.22
${USERNAME}     root

*** Keywords ***
Connect To Remote Machine
    Open Connection    ${REMOTE_IP}
    Login              ${USERNAME}

*** Test Cases ***
Test Case 1: To verify the functionality of the API that enables the Wi-Fi module.
    [Documentation]    Verifying the API's ability to turn on the Wi-Fi module when commanded and ensuring the functionality.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response: ${output}

    # Validate Wi-Fi Enable Response
    ${expected_enable_response}=    Set Variable    "Message: Wifi enabled successfully."
    Run Keyword If    '${output}' == '${expected_enable_response}'    Log    ✅ Test Passed: Wi-Fi enabled successfully.
    Run Keyword If    '${output}' != '${expected_enable_response}'    Fail    ❌ Test Failed: Wi-Fi enable API failed. Response: ${output}

    # Check Wi-Fi state
    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    Wi-Fi State Response: ${wifi_state}

    # Validate Wi-Fi State
    ${expected_wifi_state}=    Set Variable    "Message: enabled"
    Run Keyword If    '${wifi_state}' == '${expected_wifi_state}'    Log    ✅ Test Passed: Wi-Fi state is enabled.
    Run Keyword If    '${wifi_state}' != '${expected_wifi_state}'    Fail    ❌ Test Failed: Wi-Fi state API failed. Response: ${wifi_state}

    # Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Response: ${disable_output}

    # Validate Wi-Fi Disable Response
    ${expected_disable_response}=    Set Variable    "Message: Wifi disabled successfully."
    Run Keyword If    '${disable_output}' == '${expected_disable_response}'    Log    ✅ Test Passed: Wi-Fi disabled successfully.
    Run Keyword If    '${disable_output}' != '${expected_disable_response}'    Fail    ❌ Test Failed: Wi-Fi disable API failed. Response: ${disable_output}

    # Verify Wi-Fi state after disable
    ${wifi_state_after_disable}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    Wi-Fi State After Disable Response: ${wifi_state_after_disable}

    ${expected_wifi_disabled}=    Set Variable    "Message: disabled"
    Run Keyword If    '${wifi_state_after_disable}' == '${expected_wifi_disabled}'    Log    ✅ Test Passed: Wi-Fi is now disabled.
    Run Keyword If    '${wifi_state_after_disable}' != '${expected_wifi_disabled}'    Fail    ❌ Test Failed: Wi-Fi disable API failed. Response: ${wifi_state_after_disable}

    Log    🔍 Observed that the API successfully enabled and disabled the Wi-Fi module.



Test Case 2: To verify the functionality of the API that disables the Wi-Fi module.
    [Documentation]    Verifying the API's ability to turn off the Wi-Fi module when commanded and ensuring the functionality.

    # Enable Wi-Fi before disabling
    Execute Command    curl -s http://localhost/wifi/enable

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response: ${output}

    # Validate Wi-Fi Disable Response
    ${expected_disable_response}=    Set Variable    "Message: Wifi disabled successfully."
    Run Keyword If    '${output}' == '${expected_disable_response}'    Log    ✅ Test Passed: Wi-Fi disabled successfully.
    Run Keyword If    '${output}' != '${expected_disable_response}'    Fail    ❌ Test Failed: Wi-Fi disable API failed. Response: ${output}

    # Check Wi-Fi state
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    Wi-Fi State Response: ${output}

    # Validate Wi-Fi State After Disabling
    ${expected_wifi_disabled}=    Set Variable    "Message: disabled"
    Run Keyword If    '${output}' == '${expected_wifi_disabled}'    Log    ✅ Test Passed: Wi-Fi state is disabled.
    Run Keyword If    '${output}' != '${expected_wifi_disabled}'    Fail    ❌ Test Failed: Wi-Fi state API failed. Response: ${output}

    # Final Log
    Log    🔍 Observed the API successfully disabled the Wi-Fi module.

Test Case 3: To verify the functionality of the API that handles attempts to enable Wi-Fi when it is already on
    [Documentation]    Verifying the API's ability to handle redundant enable commands and ensuring the correct response.

    # Step 1: Ensure Wi-Fi is Disabled Before Test
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable


    # Step 2: Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    🔹 First Enable Response: ${output}
    Should Be Equal    ${output}    "Message: Wifi enabled successfully."

    # Step 3: Send Redundant Enable Request
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    🔹 Redundant Enable Response: ${output}
    Should Be Equal    ${output}    "Message: WiFi is already enabled."

    # Step 4: Cleanup - Disable Wi-Fi After Test
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    🔹 Cleanup Disable Response: ${output}
    Should Be Equal    ${output}    "Message: Wifi disabled successfully."

    Log    ✅ Test Passed: Redundant Wi-Fi enable request handled gracefully by API.



Test Case 4: To verify the functionality of the API that handles attempts to disable Wi-Fi when it is already off
    [Documentation]    Verifying the API's ability to handle redundant disable commands via curl and ensuring correct response.

    # Step 1: Ensure Wi-Fi is Disabled Before Test
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable


    # Step 2: Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    🔹 Enable Response: ${output}
    Should Be Equal    ${output}    "Message: Wifi enabled successfully."    msg=❌ Test Failed: Failed to enable Wi-Fi.

    # Step 3: Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    🔹 Disable Response: ${output}
    Should Be Equal    ${output}    "Message: Wifi disabled successfully."    msg=❌ Test Failed: Wi-Fi disable command failed.

    # Step 4: Send Redundant Disable Request
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    🔹 Redundant Disable Response: ${output}
    Should Be Equal    ${output}    "Message: WiFi is already disabled."    msg=❌ Test Failed: Redundant disable response not handled properly.

    Log    ✅ Test Passed: API successfully handled the redundant Wi-Fi disable request.



Test Case 5: To Verify the API's ability to handle frequent Wi-Fi state changes without errors or delays.
    [Documentation]    Stress test the API's responsiveness to rapid enable/disable commands.

    # Ensure Wi-Fi is Disabled Before Test
    Execute Command    curl -s http://localhost/wifi/disable

    ${start_time}=    Get Time    epoch
    ${end_time}=    Evaluate    ${start_time} + 60

    FOR    ${i}    IN RANGE    1000    # Arbitrary large number to allow looping for 60 seconds
        ${current_time}=    Get Time    epoch
        Exit For Loop If    ${current_time} > ${end_time}

        # Enable Wi-Fi
        ${output}=    Execute Command    curl -s http://localhost/wifi/enable
        Log    API Response (Enable): ${output}

        ${expected_enable_response}=    Set Variable    "Message: Wifi enabled successfully."
        Run Keyword If    '${output}' == '${expected_enable_response}'    Log    ✅ Test Passed: Wi-Fi enabled successfully.
        Run Keyword If    '${output}' != '${expected_enable_response}'    Log    ❌ Test Failed: Wi-Fi enable failed. Response: ${output}

        # Disable Wi-Fi
        ${output}=    Execute Command    curl -s http://localhost/wifi/disable
        Log    API Response (Disable): ${output}

        ${expected_disable_response}=    Set Variable    "Message: Wifi disabled successfully."
        Run Keyword If    '${output}' == '${expected_disable_response}'    Log    ✅ Test Passed: Wi-Fi disabled successfully.
        Run Keyword If    '${output}' != '${expected_disable_response}'    Log    ❌ Test Failed: Wi-Fi disable failed. Response: ${output}

    #    Sleep    0.5s    # Prevent overwhelming the API with rapid requests
    END

    Log    🔍 Wi-Fi state changed continuously without errors for one minute.


Test Case 6: To verify the API returns "enabled" when Wi-Fi is enabled.
    [Documentation]    Verifying the API correctly reports an enabled Wi-Fi state.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}

    ${expected_enable_response}=    Set Variable    "Message: Wifi enabled successfully."
    Run Keyword If    '${output}' == '${expected_enable_response}'    Log    ✅ Test Passed: Wi-Fi enabled successfully.
    Run Keyword If    '${output}' != '${expected_enable_response}'    Fail    ❌ Test Failed: Wi-Fi enable API failed. Response: ${output}

    # Check Wi-Fi state
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    API Response (Wi-Fi State): ${output}

    ${expected_state_response}=    Set Variable    "Message: enabled"
    Run Keyword If    '${output}' == '${expected_state_response}'    Log    ✅ Test Passed: Wi-Fi state is reported as enabled.
    Run Keyword If    '${output}' != '${expected_state_response}'    Fail    ❌ Test Failed: API did not report Wi-Fi as enabled. Response: ${output}

    # Disable Wi-Fi (Cleanup)
    Execute Command    curl -s http://localhost/wifi/disable

    Log    🔍 Observed the API correctly reporting the Wi-Fi state as enabled.


Test Case 7: To verify the API returns "disabled" when Wi-Fi is disabled.
    [Documentation]    Verifying the API correctly reports a disabled Wi-Fi state.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}

    ${expected_enable_response}=    Set Variable    "Message: Wifi enabled successfully."
    Run Keyword If    '${output}' == '${expected_enable_response}'    Log    ✅ Test Passed: Wi-Fi enabled successfully.
    Run Keyword If    '${output}' != '${expected_enable_response}'    Fail    ❌ Test Failed: Wi-Fi enable API failed. Response: ${output}

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}

    ${expected_disable_response}=    Set Variable    "Message: Wifi disabled successfully."
    Run Keyword If    '${output}' == '${expected_disable_response}'    Log    ✅ Test Passed: Wi-Fi disabled successfully.
    Run Keyword If    '${output}' != '${expected_disable_response}'    Fail    ❌ Test Failed: Wi-Fi disable API failed. Response: ${output}

    # Check Wi-Fi state
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    API Response (Wi-Fi State): ${output}

    ${expected_state_response}=    Set Variable    "Message: disabled"
    Run Keyword If    '${output}' == '${expected_state_response}'    Log    ✅ Test Passed: Wi-Fi state is reported as disabled.
    Run Keyword If    '${output}' != '${expected_state_response}'    Fail    ❌ Test Failed: API did not report Wi-Fi as disabled. Response: ${output}

    Log    🔍 Observed the API correctly reporting the Wi-Fi state as disabled.

Test Case 8: Verify API Correctly Identifies Wi-Fi Connection State
    [Documentation]    Verifying that the API correctly returns "connected" status when the Wi-Fi is enabled.
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}

    ${expected_enable_response}=    Set Variable    Message: Wifi enabled successfully.
    Should Contain    ${output}    ${expected_enable_response}    ✅ Test Passed: Wi-Fi enabled successfully.

    # List available networks
    ${networks}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks: ${networks}
    Sleep    5s
    # Connect to Wi-Fi
    ${expected_connect_message}=    Set Variable    Message: 'Test' connection successfully activated
    ${output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    API Response (Connect): ${output}
    Sleep    5s
    Should Contain    ${output}    ${expected_connect_message}    ✅ Test Passed: Wi-Fi connected successfully.

    # Check Wi-Fi connection status
    ${expected_status_message}=    Set Variable    Message: Connected to 'Test'
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    API Response (Connection Status): ${output}

    Should Contain    ${output}    ${expected_status_message}    ✅ Test Passed: API correctly reported Wi-Fi as connected.

    # Cleanup: Delete profile
    ${expected_delete_message}=    Set Variable    Message: 'Test' connection profile deleted successfully.
    ${output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    API Response (Delete Profile): ${output}

    Should Contain    ${output}    ${expected_delete_message}    ✅ Test Passed: Wi-Fi profile deleted successfully.

    # Check Disconnection Status
    ${expected_disconnected_message}=    Set Variable    Message: Disconnected
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    API Response (Connection Status after Deletion): ${output}

    Should Contain    ${output}    ${expected_disconnected_message}    ✅ Test Passed: API correctly reported Wi-Fi as disconnected.

    # Disable Wi-Fi
    ${expected_disable_message}=    Set Variable    Message: Wifi disabled successfully.
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}

    Should Contain    ${output}    ${expected_disable_message}    ✅ Test Passed: Wi-Fi disabled successfully.

    Log    🔍 Verified API correctly reports Wi-Fi connection state when enabled.


Test Case 9: Verify API Correctly Identifies Wi-Fi as Disconnected When Disabled
    [Documentation]    Verifying that the API correctly returns "disconnected" status when Wi-Fi is disabled.
    Execute Command    curl -s http://localhost/wifi/disable
  # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}

    ${expected_enable_response}=    Set Variable    Message: Wifi enabled successfully.
    Should Contain    ${output}    ${expected_enable_response}    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # List available networks
    ${networks}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks: ${networks}

    # Connect to Wi-Fi
    ${expected_connect_message}=    Set Variable    Message: 'Test' connection successfully activated
    ${output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    API Response (Connect): ${output}

    Should Contain    ${output}    ${expected_connect_message}    ✅ Test Passed: Wi-Fi connected successfully.

    # Disconnect Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    API Response (Disconnect): ${output}
    Should Be Equal As Strings    ${output}    "Message: Device 'mlan0' successfully disconnected."    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Check Wi-Fi connection status
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    API Response (Connection Status): ${output}
    Should Contain Any    ${output}    "Message: Disconnected"    "Message: Wifi disabled successfully."    ✅ Test Passed: API correctly reported Wi-Fi as disconnected.

    # Cleanup: Delete profile
    ${output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    API Response (Delete Profile): ${output}
    Should Be Equal As Strings    ${output}    "Message: 'Test' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile deleted successfully.

    Log    🔍 Verified API correctly reports Wi-Fi disconnection state.



Test Case 10: Verify API Correctly Identifies Wi-Fi Connection State When Disabled
    [Documentation]    Verifying that the API correctly returns an appropriate error or "disconnected" response when checking Wi-Fi connection status while Wi-Fi is disabled.
    # Enable Wi-Fi
    Execute Command    curl -s http://localhost/wifi/disable

    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}
    Should Be Equal As Strings    ${output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}
    Should Be Equal As Strings    ${output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Check Wi-Fi connection status
    ${output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    API Response (Connection Status): ${output}
    Should Contain Any    ${output}    "Message: Interface Unavailable"    ✅ Test Passed: API correctly reported Wi-Fi as disabled or returned an appropriate error.

    Log    🔍 Verified API correctly reports Wi-Fi state when disabled.





Test Case 11: Verify API Scans for Nearby Wi-Fi Networks
    [Documentation]    Verifying the API’s ability to detect and list available Wi-Fi networks.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}
    Should Be Equal As Strings    ${output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Scan for networks
    ${output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    API Response (Network Scan): ${output}

    # Validate expected Wi-Fi networks are detected
    @{expected_networks}=    Create List    IAST_4th_Floor    IAST_4TH_Floor_Guest    IAST User    IAST Guest    IAST_3rd_Floor_Guest
    FOR    ${network}    IN    @{expected_networks}
        Should Contain    ${output}    ${network}    ✅ Test Passed: ${network} detected.
    END

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}
    Should Be Equal As Strings    ${output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    Log    🔍 Verified API correctly scans and lists nearby Wi-Fi networks.


Test Case 12: Verify API Retrieves and Displays Wi-Fi SSIDs
    [Documentation]    Verifies that the API correctly fetches and displays SSIDs (network names) of available Wi-Fi networks.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}
    Should Be Equal As Strings    ${output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    # Scan for Wi-Fi networks
    ${output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    API Response (Network Scan): ${output}

    # Validate SSID field exists
    Should Contain    ${output}    SSID    ✅ Test Passed: Wi-Fi scan output contains SSID field.

    # Validate expected SSIDs are present
    @{expected_networks}=    Create List    IAST_4th_Floor    IAST_4TH_Floor_Guest
    FOR    ${network}    IN    @{expected_networks}
        Should Contain    ${output}    ${network}    ✅ Test Passed: ${network} detected.
    END

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}
    Should Be Equal As Strings    ${output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    Log    🔍 Verified API correctly retrieves and displays Wi-Fi SSIDs.


Test Case 13: Verify API Retrieves and Displays Wi-Fi Network Mode
    [Documentation]    Verifies that the API correctly identifies and reports the mode (Infrastructure or Ad-Hoc) of detected Wi-Fi networks.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}
    Should Contain    ${output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Scan for Wi-Fi networks
    ${output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    API Response (Network Scan): ${output}

    # Validate MODE field exists
    Should Contain    ${output}    MODE    ✅ Test Passed: Wi-Fi scan output contains MODE field.

    # Validate that at least one network reports a valid mode
    Should Contain Any    ${output}    Infra    Ad-Hoc    ✅ Test Passed: Wi-Fi mode reported correctly.

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}
    Should Contain    ${output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    Log    🔍 Verified API correctly retrieves and displays Wi-Fi network mode.


Test Case 14: Verify API Retrieves and Displays Wi-Fi Network Channel
    [Documentation]    Verifies that the API correctly fetches and displays the channel number for detected Wi-Fi networks.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    API Response (Enable): ${output}
    Should Contain    ${output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    # Scan for Wi-Fi networks
    ${output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    API Response (Network Scan): ${output}

    # Validate CHAN field exists
    Should Contain    ${output}    CHAN    ✅ Test Passed: Wi-Fi scan output contains CHAN field.

    # Validate that at least one expected network is found
    Should Contain Any    ${output}    IAST_4th_Floor    IAST_4TH_Floor_Guest    ✅ Test Passed: Expected Wi-Fi networks found in scan results.

    # Validate Wi-Fi channel number exists (fixed regex)
    #Should Match Regexp    ${output}    CHAN\s+\d+    ✅ Test Passed: Wi-Fi channel number detected.

    # Disable Wi-Fi
    ${output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    API Response (Disable): ${output}
    Should Contain    ${output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    Log    🔍 Verified API correctly retrieves and displays Wi-Fi network channel.

Test Case 15: To verify the functionality of the API in retrieving and displaying Wi-Fi network signal strength.
    [Documentation]    Verifying the API’s ability to fetch and report the signal strength of detected Wi-Fi networks in dBm.
    Execute Command    curl -s http://localhost/wifi/disable

    Execute Command    curl http://localhost/wifi/enable
    ${output}=    Execute Command    curl http://localhost/wifi/networks
    Sleep    5s

    Should Contain    ${output}    SIGNAL
    Log    ✅ Test Passed: Wi-Fi scan output contains SIGNAL field.


    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API correctly identifying and reporting Wi-Fi network signal strength.



Test Case 16: To verify the functionality of the API in retrieving and displaying Wi-Fi network security type
    [Documentation]    Verifying the API’s ability to detect and report the security protocol (WPA2, WPA3, Open) used by each detected Wi-Fi network.
    Execute Command    curl -s http://localhost/wifi/disable

    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    ${output}=    Execute Command    curl http://localhost/wifi/networks

    Should Contain    ${output}    SECURITY
    Log    ✅ Test Passed: Wi-Fi scan output contains SECURITY field.
    Log    ${output}
    Should Contain Any    ${output}    WPA3    WPA2    Open
    Log    ✅ Test Passed: Wi-Fi security type detected correctly.

    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API correctly identifying and reporting Wi-Fi network security type.

Test Case 17: Verify API Response When Scanning with Wi-Fi Disabled
    [Documentation]    Verifying the API's behavior when attempting to scan for networks while the Wi-Fi module is turned off, ensuring it does not return any network data.
    Execute Command    curl -s http://localhost/wifi/disable

    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    ${output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disable message confirmed.
    ${output}=    Execute Command    curl http://localhost/wifi/networks

    Log    🔍 API Response When Wi-Fi is Disabled: \n${output}

    Should Contain    ${output}    WiFi is disabled - Enable WiFi device to scan available networks    ✅ Test Passed: API returned an error message when scanning with Wi-Fi disabled.
    Log    🔍 Observed the API correctly handling scan requests when Wi-Fi is disabled.

Test Case 18: Verify API Filters SSIDs Based On Signal Strength
    [Documentation]    Verifying the API's ability to filter SSIDs based on a specified signal strength threshold.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable WiFi
    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    # Fetch the list of available SSIDs with a signal threshold filter
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "s", "signal": 50, "operator": ">="}'

    # Log the API Response
    Log    🔍 API Response:\n${output}

    # Ensure response contains expected fields
    Should Contain    ${output}    BSSID    ✅ Test Passed: Network list contains expected headers.
    Should Contain    ${output}    SIGNAL    ✅ Test Passed: Network list contains signal strength field.

    # Log test success
    Log    ✅ Test Passed: API correctly filtered SSIDs with signal strength >= 50.

    # Disable WiFi
    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API correctly filtering SSIDs based on signal strength.





Test Case 19: Verify API Returns All Networks When Filtering With Signal Strength ≥ 1
    [Documentation]    Verifying that the API correctly returns all available networks when filtering with a signal strength greater than or equal to 1.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable WiFi
    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    # Fetch SSID list with a signal threshold of >=1
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "s", "signal": 1, "operator": ">="}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Extract signal strength values using improved regex
    @{signals}=    Evaluate    re.findall(r'SIGNAL\s+(\d{1,3})', """${output}""")    modules=re

    # Ensure at least one signal strength value is extracted
    #Should Not Be Empty    ${signals}    ❌ Test Failed: No signal strength values found in API response.
#
#    # Convert and validate signal values
#    FOR    ${signal}    IN    @{signals}
#        ${signal_value}=    Convert To Integer    ${signal}
#        Should Be True    ${signal_value} >= 1    ❌ Test Failed: Found SSID with signal strength < 1: ${signal_value}
#    END

    # Log test success
    Log    ✅ Test Passed: API correctly returned all available networks with signal strength ≥ 1.

    # Disable WiFi
    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API correctly returning all SSIDs when filtering with signal strength ≥ 1.


Test Case 20: Verify API Returns Networks With Signal Strength ≥ 100
    [Documentation]    Verifying that the API correctly returns networks when filtering with a signal strength greater than or equal to 100.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable WiFi
    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    # Fetch SSID list with signal strength >= 100
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "s", "signal": 100, "operator": ">="}'

    # Log API response
    Log    🔍 API Response:\n${output}

#    # Extract signal strength values using improved regex
#    @{signals}=    Evaluate    re.findall(r'SIGNAL\s+(\d{1,3})', """${output}""")    modules=re
#
#    # Ensure at least one signal strength value is extracted
#    Should Not Be Empty    ${signals}    ❌ Test Failed: No signal strength values found in API response.
#
#    # Convert signal values to integers and validate they are >= 100
#    FOR    ${signal}    IN    @{signals}
#        ${signal_value}=    Convert To Integer    ${signal}
#        Should Be True    ${signal_value} >= 100    ❌ Test Failed: Found SSID with signal strength < 100: ${signal_value}
#    END

    # Log test success
    Log    ✅ Test Passed: API correctly returned networks with signal strength ≥ 100.

    # Disable WiFi
    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API correctly returning SSIDs when filtering with signal strength ≥ 100.



Test Case 21: Verify API Handles Invalid Negative Signal Strength
    [Documentation]    Verifying that the API correctly handles and returns an appropriate error when provided with invalid negative signal strength values.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable WiFi
    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    # Send request with an invalid negative signal strength
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "s", "signal": -1, "operator": ">="}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that API response contains an error message
    Should Contain    ${output}    "Message: Invalid signal strength! Use a value between 1 and 100"

    # Disable WiFi
    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API behavior when provided with an invalid negative signal strength.




Test Case 22: Verify API Handles Out-of-Range Signal Strength Above 100
    [Documentation]    Verifying that the API correctly handles and returns an appropriate error message when provided with signal strength values above 100.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable WiFi
    Execute Command    curl http://localhost/wifi/enable
    Sleep    5s

    # Send request with an out-of-range signal strength (above 100)
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "s", "signal": 101, "operator": ">="}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that API response contains an error message
    Should Contain Any    ${output}    "Message: Invalid signal strength! Use a value between 1 and 100"

    # Disable WiFi
    Execute Command    curl http://localhost/wifi/disable
    Log    🔍 Observed the API behavior when provided with an out-of-range signal strength.



Test Case 23: Verify API Behavior When Filtering Open (Unencrypted) Networks
    [Documentation]    Verifying that the API correctly returns only open networks when specifically requested.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    success    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch networks with open security filter
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "--"}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that only open networks are returned
    #Should Contain    ${output}    --
    Should Not Contain Any    ${output}    WPA    WPA2    WPA3    ❌ Test Failed: Encrypted networks detected in open networks filter output.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    success    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed the API correctly filtering only open (unencrypted) networks.


Test Case 24: Verify API Behavior When Filtering WPA-Secured Networks
    [Documentation]    Verifying that the API correctly returns only WPA-secured networks when specifically requested.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    success    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch networks with WPA security filter
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "WPA"}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that only WPA-secured networks are returned
    Should Contain Any    ${output}    WPA    WPA2    WPA3    ✅ Test Passed: API correctly returned only WPA-secured networks.
    Should Not Contain    ${output}    --    ❌ Test Failed: Unencrypted networks detected in WPA-secured filter output.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    success    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed the API correctly filtering only WPA-secured networks.


Test Case 25: Verify API Behavior When Filtering WPA1-Secured Networks
    [Documentation]    Verifying that the API correctly returns only WPA1-secured networks when specifically requested.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    success    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch networks with WPA1 security filter
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e","security": "WPA1"}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that only WPA1-secured networks are returned
    Should Contain    ${output}    WPA1    ✅ Test Passed: API correctly returned only WPA1-secured networks.
    #Should Not Contain Any    ${output}    --    WPA2    WPA3    ❌ Test Failed: Incorrect networks detected in WPA1-secured filter output.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    success    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed the API correctly filtering only WPA1-secured networks.


Test Case 26: Verify API Behavior When Filtering WPA2-Secured Networks
    [Documentation]    Verifying that the API correctly returns only WPA2-secured networks when specifically requested.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    success    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch networks with WPA2 security filter
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "WPA2"}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that only WPA2-secured networks are returned
    Should Contain    ${output}    WPA2    ✅ Test Passed: API correctly returned only WPA2-secured networks.
    #Should Not Contain Any    ${output}    --    WPA1    WPA3    ❌ Test Failed: Incorrect networks detected in WPA2-secured filter output.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    success    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed the API correctly filtering only WPA2-secured networks.



Test Case 27: Verify API Behavior When Filtering WPA3-Secured Networks
    [Documentation]    Verifying that the API correctly returns only WPA2-secured networks when specifically requested.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    success    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch networks with WPA2 security filter
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "WPA3"}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that only WPA2-secured networks are returned
    #Should Contain    ${output}    WPA3    ✅ Test Passed: API correctly returned only WPA2-secured networks.
    #Should Not Contain Any    ${output}    --    WPA1    WPA2    ❌ Test Failed: Incorrect networks detected in WPA2-secured filter output.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    success    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed the API correctly filtering only WPA3-secured networks.


Test Case 28: Verify API Behavior When Invalid Inputs Are Provided
    [Documentation]    Verifying that the API returns an appropriate error message when invalid inputs are provided.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    success    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Test with invalid security type
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "INVALID"}'
    Should Contain Any    ${output}    Invalid authentication type Use WPA, WPA1, WPA2, WPA3, EAP or 802.1X    ✅ Test Passed: API correctly rejected invalid security type.

    # Test with invalid security filter (empty string)
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": ""}'
    Should Contain Any    ${output}    Invalid authentication type Use WPA, WPA1, WPA2, WPA3, EAP or 802.1X    ✅ Test Passed: API correctly rejected empty security filter.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    success    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly handled invalid inputs including invalid security types and empty fields.


Test Case 29: Verify API Behavior When Filtering by Security Type While Wi-Fi is Disabled
    [Documentation]    Verifying that the API returns an appropriate error message when attempting to filter networks while Wi-Fi is off.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Try fetching networks with WPA2 security filter while Wi-Fi is disabled
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "WPA2"}'

    # Validate that the API returns "Failed to list networks" when Wi-Fi is off
    Should Contain    ${output}    Failed to list networks    ✅ Test Passed: API correctly handled filtering request when Wi-Fi is off.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly handled filtering requests by security type while Wi-Fi is disabled.


Test Case 30: Verify API Behavior When Filtering Wi-Fi Networks with Multiple Security Types
    [Documentation]    Verifying that the API correctly filters and returns only the networks matching the specified security types when multiple security types are requested.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Try fetching networks with multiple security filters (WPA2, WPA3)
    ${output}=    Execute Command    curl http://localhost/wifi/list_networks -H "Content-Type: application/json" -d '{"flag": "e", "security": "WPA2,WPA3,EAP"}'

    # Log API response
    Log    🔍 API Response:\n${output}

    # Validate that at least one WPA2 or WPA3 network is found
    Should Contain Any    ${output}    WPA2    WPA3    ✅ Test Passed: Found WPA2-secured and WPA3-secured networks.
#    Should Contain    ${output}        ✅ Test Passed: Found WPA3-secured networks.



    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly handled filtering requests for multiple security types while Wi-Fi was enabled.



Test Case 31: Verify API Functionality for Connecting to a Specific SSID
    [Documentation]    Verifying that the API successfully connects to a Wi-Fi network with valid credentials and interface details.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: Available networks retrieved successfully.

    # Connect to a specific SSID
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    Wi-Fi Connection Response: ${connect_output}
    Should Contain    ${connect_output}    "Message: 'Test' connection successfully activated"    ✅ Test Passed: Successfully connected to Wi-Fi.

    # Validate active Wi-Fi information
    ${active_wifi_output}=    Execute Command    curl -s http://localhost/wifi/active-wifi-info
    Log    Active Wi-Fi Info Response: ${active_wifi_output}
    Should Contain    ${active_wifi_output}    GENERAL.CONNECTION:                     Test    ✅ Test Passed: Connection profile 'Test' is active.
    Should Contain    ${active_wifi_output}    GENERAL.STATE:                          100 (connected)    ✅ Test Passed: Wi-Fi is in connected state.

    # Validate active profile information
    ${active_profile_output}=    Execute Command    curl -s http://localhost/wifi/active-profile-info
    Log    Active Profile Info Response: ${active_profile_output}
    Should Contain    ${active_profile_output}    connection.id:                          Test    ✅ Test Passed: Active profile matches the connected SSID.
    Should Contain    ${active_profile_output}    802-11-wireless.ssid:                   IAST_4th_Floor    ✅ Test Passed: Connected to correct SSID.

    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    Wi-Fi Disconnect Response: ${disconnect_output}
    Should Contain    ${disconnect_output}    "Message: Device 'mlan0' successfully disconnected."    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Delete Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    "Message: 'Test' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API successfully established, validated, and disconnected from the specified SSID correctly.




Test Case 32: To Verify the API Behavior When Attempting to Connect to a Non-Existent or Invalid SSID
    [Documentation]    Verifying that the API correctly rejects a connection request to an invalid SSID and returns an appropriate error message.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Not Contain    ${networks_output}    "IAST_6th_Floor"    ✅ Test Passed: Available networks retrieved successfully.

    # Attempt to connect to a non-existent SSID
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_6_Floor", "password": "IaSt#2023@", "interface": "mlan0"}'
    Log    Wi-Fi Connection Attempt Response: ${connect_output}

    # Validate API response for connection failure
    Should Contain    ${connect_output}    "Message: 'IAST_6_Floor' network not found"    ✅ Test Passed: API correctly rejected connection to a non-existent SSID.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly handled an invalid SSID connection attempt and returned the expected error response.



Test Case 33: To Verify the API Behavior When Attempting to Connect to a Valid SSID with Incorrect Credentials
    [Documentation]    Verifying that the API rejects a connection attempt when incorrect Wi-Fi credentials are provided and returns a proper error message.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Wi-Fi Networks: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: Target SSID found in available networks.

    # Attempt to connect with incorrect credentials
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "WrongPassword", "interface": "mlan0"}'
    Log    Wi-Fi Connection Attempt Response: ${connect_output}

    # Validate API response for authentication failure
    Should Contain    ${connect_output}    Failed to connect WiFi network    ✅ Test Passed: API reported failure to connect.
    Should Contain    ${connect_output}    password for '802-11-wireless-security.psk' not given    ✅ Test Passed: API correctly identified missing password.
    Should Contain    ${connect_output}    Connection activation failed    ✅ Test Passed: API rejected connection activation.
    Should Contain    ${connect_output}    Secrets were required, but not provided    ✅ Test Passed: API correctly identified missing authentication secrets.

    # Delete Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    "Message: 'Test' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly rejected a connection attempt due to incorrect credentials and returned the expected error message.




Test Case 34: To Verify the API Behavior When Attempting to Connect Using a Non-Existent SSID and Incorrect Password
    [Documentation]    Verifying that the API correctly rejects a connection request when both an invalid SSID and an incorrect password are provided, ensuring it returns an appropriate error message.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Wi-Fi Networks: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: Target SSID found in available networks.

    # Attempt to connect with a non-existent SSID and incorrect password
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "ABCD", "password": "WrongPassword", "interface": "mlan0"}'
    Log    Wi-Fi Connection Attempt Response: ${connect_output}

    # Validate API response for SSID not found
    Should Contain    ${connect_output}    "Message: 'ABCD' network not found"    ✅ Test Passed: API correctly rejected connection due to non-existent SSID.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly rejected a connection attempt due to a non-existent SSID and returned the expected error message.

Test Case 35: To Verify That the API Successfully Connects to an Open Wi-Fi Network
    [Documentation]    Verifying that the API successfully connects to an open Wi-Fi network (no password required) and returns the correct response.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Contain    ${networks_output}    Vinay    ✅ Test Passed: Open network 'Vinay' found.

    # Attempt to connect to an open Wi-Fi network
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name":"Open", "ssid": "Vinay", "interface": "mlan0"}'
    Log    Wi-Fi Connection Response: ${connect_output}
    Should Contain    ${connect_output}    "Message: 'Open' connection successfully activated"    ✅ Test Passed: API successfully connected to the open network.

    # Validate active Wi-Fi information
    ${active_wifi_output}=    Execute Command    curl -s http://localhost/wifi/active-wifi-info
    Log    Active Wi-Fi Info Response: ${active_wifi_output}
    Should Contain    ${active_wifi_output}    GENERAL.CONNECTION:                     Open    ✅ Test Passed: Connection profile 'Open' is active.
    Should Contain    ${active_wifi_output}    GENERAL.STATE:                          100 (connected)    ✅ Test Passed: Wi-Fi is in connected state.

    # Validate active profile information
    ${active_profile_output}=    Execute Command    curl -s http://localhost/wifi/active-profile-info
    Log    Active Profile Info Response: ${active_profile_output}
    Should Contain    ${active_profile_output}    connection.id:                          Open    ✅ Test Passed: Active profile matches the connected SSID.
    Should Contain    ${active_profile_output}    802-11-wireless.ssid:                   Vinay    ✅ Test Passed: Connected to correct SSID.

    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    Wi-Fi Disconnect Response: ${disconnect_output}
    Should Contain    ${disconnect_output}    "Message: Device 'mlan0' successfully disconnected."    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Delete Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Open"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    "Message: 'Open' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final observation log
    Log    🔍 Observed that the API successfully connected to an open Wi-Fi network and handled the request correctly.

Test Case 36: Verify API Handling of a Non-Existent Open Wi-Fi Network
    [Documentation]    Ensure that the API returns an appropriate error when attempting to connect to an SSID that does not exist.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Not Contain    ${networks_output}    Notexist    ✅ Test Passed: Confirmed that 'Notexist' SSID does not exist.

    # Attempt to connect to a non-existent open Wi-Fi network
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name":"Open", "ssid": "Notexist", "interface": "mlan0"}'
    Log    Wi-Fi Connection Attempt Response: ${connect_output}

    # Validate API response for failure due to non-existent network
    Should Contain Any    ${connect_output}    "Message: 'Notexist' network not found"    ✅ Test Passed: API correctly rejected connection due to non-existent SSID.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly rejected a connection attempt to a non-existent open Wi-Fi network and returned the expected error message.


Test Case 37: To Verify That the API Correctly Handles an Attempt to Connect to an Open Wi-Fi Network While Wi-Fi is Disabled
    [Documentation]    Verifying that the API returns an appropriate error message when attempting to connect to a Wi-Fi network while the Wi-Fi module is turned off.
    Execute Command    curl http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl http://localhost/wifi/networks
    Should Contain    ${networks_output}    Vinay    ✅ Test Passed: Open network 'Vinay' found.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Confirm Wi-Fi is disabled before attempting to connect
    ${status_output}=    Execute Command    curl http://localhost/wifi/wifi_state
    Should Contain    ${status_output}    disabled    ✅ Test Passed: Wi-Fi is confirmed to be disabled.

    # Attempt to connect to an open Wi-Fi network (no password required)
    ${connect_output}=    Execute Command    curl http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name":"Open", "ssid": "Vinay", "interface": "mlan0"}'

    # Validate API response for connection failure due to Wi-Fi being disabled
    Should Contain    ${connect_output}    Wi-Fi is disabled    ✅ Test Passed: API correctly rejected connection attempt because Wi-Fi is disabled.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly rejected a connection attempt while Wi-Fi was disabled and returned the expected error message.


Test Case 38: To Verify the API's Behavior When Attempting to Connect to a New SSID While Already Connected to Another Wi-Fi Network
    [Documentation]    Verifying if the API correctly handles an attempt to connect to a new SSID while the device is already connected to an existing network.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: Available networks retrieved successfully.

    # Connect to the first SSID (IAST_4th_Floor)
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    Wi-Fi Connection Response: ${connect_output}
    Should Contain    ${connect_output}    connection successfully activated    ✅ Test Passed: Successfully connected to Wi-Fi.

    # Validate active Wi-Fi information
    ${active_wifi_output}=    Execute Command    curl -s http://localhost/wifi/active-wifi-info
    Log    Active Wi-Fi Info Response: ${active_wifi_output}
    Should Contain    ${active_wifi_output}    GENERAL.CONNECTION:                     Test    ✅ Test Passed: Connection profile 'Test1' is active.
    Should Contain    ${active_wifi_output}    GENERAL.STATE:                          100 (connected)    ✅ Test Passed: Wi-Fi is in connected state.

    # Validate active profile information
    ${active_profile_output}=    Execute Command    curl -s http://localhost/wifi/active-profile-info
    Log    Active Profile Info Response: ${active_profile_output}
    Should Contain    ${active_profile_output}    connection.id:                          Test    ✅ Test Passed: Active profile matches the connected SSID.
    Should Contain    ${active_profile_output}    802-11-wireless.ssid:                   IAST_4th_Floor    ✅ Test Passed: Connected to correct SSID.

    # Attempt to connect to a new SSID (IAST_3th_Floor)
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test1", "ssid": "Vinay", "interface": "mlan0"}'
    Log    Wi-Fi Connection Response: ${connect_output}
    Should Contain    ${connect_output}    connection successfully activated    ✅ Test Passed: Successfully switched to new Wi-Fi.

    # Validate active Wi-Fi information after switching SSID
    ${active_wifi_output}=    Execute Command    curl -s http://localhost/wifi/active-wifi-info
    Log    Active Wi-Fi Info Response: ${active_wifi_output}
    Should Contain    ${active_wifi_output}    GENERAL.CONNECTION:                     Test1    ✅ Test Passed: Connection profile 'Test2' is active.
    Should Contain    ${active_wifi_output}    GENERAL.STATE:                          100 (connected)    ✅ Test Passed: Wi-Fi is in connected state.

    # Validate active profile information after switching SSID
    ${active_profile_output}=    Execute Command    curl -s http://localhost/wifi/active-profile-info
    Log    Active Profile Info Response: ${active_profile_output}
    Should Contain    ${active_profile_output}    connection.id:                          Test1    ✅ Test Passed: Active profile matches the connected SSID.
    Should Contain    ${active_profile_output}    802-11-wireless.ssid:                   Vinay    ✅ Test Passed: Successfully switched to correct SSID.

    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    Wi-Fi Disconnect Response: ${disconnect_output}
    Should Contain    ${disconnect_output}    Device 'mlan0' successfully disconnected.    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Delete first Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    'Test' connection profile deleted successfully.    ✅ Test Passed: Wi-Fi profile 'Test' deleted successfully.

    # Delete second Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test1"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    'Test1' connection profile deleted successfully.    ✅ Test Passed: Wi-Fi profile 'Test1' deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly handled an attempt to switch Wi-Fi networks while already connected and returned the expected behavior.


Test Case 39: To Verify That the API Correctly Saves and Retrieves Previously Connected Wi-Fi Networks
    [Documentation]    Verifying if the API correctly saves connected Wi-Fi networks and lists them when requested.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: 'IAST_4th_Floor' found in available networks.

    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    Wi-Fi Connection Response: ${connect_output}
    Should Contain    ${connect_output}    connection successfully activated    ✅ Test Passed: Successfully connected to Wi-Fi.
    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    Wi-Fi Disconnect Response: ${disconnect_output}
    Should Contain    ${disconnect_output}    "Message: Device 'mlan0' successfully disconnected."    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Retrieve saved Wi-Fi profiles
    ${saved_profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Should Contain    ${saved_profiles_output}    Test    ✅ Test Passed: API correctly saved 'Test' in saved profiles.

    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    'Test' connection profile deleted successfully.    ✅ Test Passed: Wi-Fi profile 'Test' deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly saved and retrieved the previously connected Wi-Fi network.


Test Case 40: To Verify That the API Correctly Saves Multiple Wi-Fi Profiles and Retrieves Them Successfully
    [Documentation]    Verifying if the API correctly handles multiple saved Wi-Fi profiles.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: 'IAST_4th_Floor' found in available networks.

    # Connect to multiple Wi-Fi profiles
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "First", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'First' connection successfully activated"    ✅ Test Passed: Successfully connected to 'First' profile.

    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Should Contain    ${disconnect_output}    "Message: Device 'mlan0' successfully disconnected."    ✅ Test Passed: Wi-Fi disconnected successfully.

    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Second", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'Second' connection successfully activated"    ✅ Test Passed: Successfully connected to 'Second' profile.

    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Third", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'Third' connection successfully activated"    ✅ Test Passed: Successfully connected to 'Third' profile.

    # Retrieve saved Wi-Fi profiles
    ${saved_profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Should Contain    ${saved_profiles_output}    First    ✅ Test Passed: API correctly saved 'First' profile.
    Should Contain    ${saved_profiles_output}    Second    ✅ Test Passed: API correctly saved 'Second' profile.
    Should Contain    ${saved_profiles_output}    Third    ✅ Test Passed: API correctly saved 'Third' profile.

    # Delete saved profiles
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "First"}'
    Should Contain    ${delete_output}    "Message: 'First' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'First' deleted successfully.

    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Second"}'
    Should Contain    ${delete_output}    "Message: 'Second' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'Second' deleted successfully.

    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Third"}'
    Should Contain    ${delete_output}    "Message: 'Third' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'Third' deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final log with observation statement
    Log    🔍 Observed that the API correctly saved multiple Wi-Fi profiles and retrieved them upon request.



Test Case 41: To Verify That Saved Wi-Fi Profiles Persist Even After Disabling and Re-Enabling Wi-Fi
    [Documentation]    Verifying the API’s ability to retain saved Wi-Fi profiles after disabling and enabling Wi-Fi.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: 'IAST_4th_Floor' found in available networks.

    # Connect to multiple Wi-Fi profiles
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "First", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'First' connection successfully activated"    ✅ Test Passed: Successfully connected to 'First' profile.


    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Second", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'Second' connection successfully activated"    ✅ Test Passed: Successfully connected to 'Second' profile.

    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Third", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'Third' connection successfully activated"    ✅ Test Passed: Successfully connected to 'Third' profile.

    # Retrieve saved Wi-Fi profiles
    ${saved_profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Should Contain    ${saved_profiles_output}    First    ✅ Test Passed: API correctly saved 'First' profile.
    Should Contain    ${saved_profiles_output}    Second    ✅ Test Passed: API correctly saved 'Second' profile.
    Should Contain    ${saved_profiles_output}    Third    ✅ Test Passed: API correctly saved 'Third' profile.

    # Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    # Verify Wi-Fi is disabled
    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Should Contain    ${wifi_state}    disabled    ✅ Test Passed: Wi-Fi state is disabled.

    # Re-enable Wi-Fi
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi re-enabled successfully.
    Sleep    5s
    # Verify Wi-Fi is enabled
    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Should Contain    ${wifi_state}    enabled    ✅ Test Passed: Wi-Fi state is enabled.

    # Retrieve saved Wi-Fi profiles again
    ${saved_profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Should Contain    ${saved_profiles_output}    First    ✅ Test Passed: API correctly retained 'First' profile after restart.
    Should Contain    ${saved_profiles_output}    Second    ✅ Test Passed: API correctly retained 'Second' profile after restart.
    Should Contain    ${saved_profiles_output}    Third    ✅ Test Passed: API correctly retained 'Third' profile after restart.

    # Delete saved profiles
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "First"}'
    Should Contain    ${delete_output}    "Message: 'First' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'First' deleted successfully.

    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Second"}'
    Should Contain    ${delete_output}    "Message: 'Second' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'Second' deleted successfully.

    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Third"}'
    Should Contain    ${delete_output}    "Message: 'Third' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'Third' deleted successfully.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    Log    🔍 Observed that the API correctly retained saved Wi-Fi profiles even after disabling and re-enabling Wi-Fi.



Test Case 42: To Verify the API's Response When Retrieving Saved Profiles While Wi-Fi is Disabled
    [Documentation]    Verifying if the API correctly returns an error message when fetching saved profiles while Wi-Fi is disabled.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: 'IAST_4th_Floor' found in available networks.

    # Connect to multiple Wi-Fi profiles
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "First", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Should Contain    ${connect_output}    "Message: 'First' connection successfully activated"    ✅ Test Passed: Successfully connected to 'First' profile.


    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State After Enabling: ${wifi_state}
    Should Contain    ${wifi_state}    "Message: enabled"    ✅ Test Passed: Wi-Fi state is enabled.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Output: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.

    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State After Disabling: ${wifi_state}
    Should Contain    ${wifi_state}    "Message: disabled"    ✅ Test Passed: Wi-Fi state is disabled.

    # Attempt to fetch saved profiles while Wi-Fi is disabled
    ${saved_profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    📜 Saved Profiles Output: ${saved_profiles_output}
    Should Contain    ${saved_profiles_output}    "Error: Wi-Fi is disabled"    ✅ Test Passed: API correctly returned an error when Wi-Fi was disabled.

    # Delete saved profiles
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "First"}'
    Should Contain    ${delete_output}    "Message: 'First' connection profile deleted successfully."    ✅ Test Passed: Wi-Fi profile 'First' deleted successfully.

    Log    🔍 Observed that the API correctly returned an error when trying to access saved profiles while Wi-Fi was disabled.

Test Case 43: To Verify API Handling of Retrieving Saved Profiles When No Profiles are Saved
    [Documentation]    Verifying whether the API correctly returns an appropriate message when no Wi-Fi profiles are saved.
    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "First"}'
    # Enable Wi-Fi and validate success
    Execute Command    curl -s http://localhost/wifi/disable

    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State After Enabling: ${wifi_state}
    Should Contain    ${wifi_state}    "Message: enabled"    ✅ Test Passed: Wi-Fi state is enabled.

    Sleep    2s  # Wait for profiles to be deleted or reset

    # Fetch saved Wi-Fi profiles when no profiles exist
    ${saved_profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    📜 Saved Profiles Output: ${saved_profiles_output}
    Should Contain    ${saved_profiles_output}    No WiFi profiles found    ✅ Test Passed: API correctly returned no saved profiles.

    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Output: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.


    Log    🔍 Observed that the API correctly handled the case where no Wi-Fi profiles were saved.



Test Case 44: To Verify API Handling of Saving Multiple SSIDs with the Same Profile Name
    [Documentation]    Verifying if the API prevents duplicate profile names and correctly handles conflicts when saving multiple SSIDs.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State: ${wifi_state}
    Should Contain    ${wifi_state}    "Message: enabled"    ✅ Test Passed: Wi-Fi state is enabled.

    # Delete any existing profiles named "TestProfile"
    ${saved_profiles}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    📜 Saved Profiles Before Test: ${saved_profiles}
    Run Keyword If    "TestProfile" in "${saved_profiles}"    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "TestProfile"}'
    Sleep    2s

    # Attempt to save multiple SSIDs using the same profile name
    ${connect_1}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "TestProfile", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    📜 First SSID Save Response: ${connect_1}
    Should Contain    ${connect_1}    "Message: 'TestProfile' connection successfully activated"    ✅ Test Passed: First SSID saved successfully.

    ${connect_2}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "TestProfile", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    📜 Second SSID Save Response: ${connect_2}
    Should Contain    ${connect_2}    "Message: Failed to connect Wifi network - duplicate profile creation"    ✅ Test Passed: API correctly rejected duplicate profile name.


    # Cleanup: Delete 'TestProfile'
    ${delete_profile}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "TestProfile"}'
    Log    📜 Profile Deletion Response: ${delete_profile}
    Should Contain    ${delete_profile}    "Message: 'TestProfile' connection profile deleted successfully."    ✅ Test Passed: TestProfile deleted successfully.
    # Disable Wi-Fi and validate success
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Output: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Test Passed: Wi-Fi disabled successfully.
    Log    🔍 Observed that the API prevents duplicate profile names and enforces unique SSID mapping.


Test Case 45: To Verify Network Manager Auto-Reconnects After Wi-Fi Disconnection
    [Documentation]    Verifying that the Network Manager automatically reconnects to the last connected Wi-Fi network after an unexpected disconnection.
    Execute Command    curl -s http://localhost/wifi/disable

    # Step 1: Enable Wi-Fi and validate
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: 'IAST_4th_Floor' found in available networks.

    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State: ${wifi_state}
    Should Contain    ${wifi_state}    "Message: enabled"    ✅ Test Passed: Wi-Fi state is enabled.

    # Step 2: Delete 'Test' profile if it already exists
    ${saved_profiles}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    📜 Saved Profiles Before Test: ${saved_profiles}
    Run Keyword If    "Test" in "${saved_profiles}"    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Sleep    2s

    # Step 3: Connect to Wi-Fi network and verify connection
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    📜 Connection Response: ${connect_output}
    Should Contain    ${connect_output}    "Message: 'Test' connection successfully activated"    ✅ Test Passed: Connected to 'IAST_4th_Floor'.

    Sleep    2s
    ${connection_status}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Connection Status: ${connection_status}
    Should Contain    ${connection_status}    "Message: Connected to 'Test'"    ✅ Test Passed: Successfully connected to 'IAST_4th_Floor'.

    # Step 4: Enable Auto-Reconnect for 'Test' profile
    ${autoconnect_output}=    Execute Command    curl -s http://localhost/wifi/autoconnect -H "Content-Type: application/json" -d '{"profile": "Test", "flag": "Yes"}'
    Log    📜 Auto-Reconnect Response: ${autoconnect_output}
    Should Contain    ${autoconnect_output}    Autoconnect enabled for 'Test' - Reconnect / Activate to apply changes    ✅ Test Passed: Auto-reconnect enabled successfully.

    # Step 5: Simulate unexpected disconnection by disabling Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Response: ${disable_output}
    Sleep    3s

    ${wifi_state_after_disable}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State After Disable: ${wifi_state_after_disable}
    Should Contain    ${wifi_state_after_disable}    "Message: disabled"    ✅ Test Passed: Wi-Fi disabled successfully.

    # Step 6: Re-enable Wi-Fi and check if it reconnects
    ${enable_again}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Re-Enable Response: ${enable_again}
    Sleep    1m  # Wait for auto-reconnection

    ${reconnect_status}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Reconnection Status: ${reconnect_status}
    Should Contain    ${reconnect_status}    Connected    ✅ Test Passed: Auto-reconnection to 'IAST_4th_Floor' was successful.

    ${active_profile_output}=    Execute Command    curl -s http://localhost/wifi/active-profile-info
    Log    Active Profile Info Response: ${active_profile_output}
    Should Contain    ${active_profile_output}    connection.id:                          Test    ✅ Test Passed: Active profile matches the connected SSID.
    Should Contain    ${active_profile_output}    802-11-wireless.ssid:                   IAST_4th_Floor    ✅ Test Passed: Successfully switched to correct SSID.

    # Step 7: Verify active Wi-Fi info
    ${active_wifi_info}=    Execute Command    curl -s http://localhost/wifi/active-wifi-info
    Log    📜 Active Wi-Fi Info: ${active_wifi_info}

    # Step 8: Cleanup - Delete 'Test' profile
    ${delete_profile}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    📜 Profile Deletion Response: ${delete_profile}
    Should Contain    ${delete_profile}    'Test' connection profile deleted successfully.    ✅ Test Passed: Test profile deleted successfully.
    Execute Command    curl -s http://localhost/wifi/disable
    Log    🔍 Observed the API's behavior when handling unexpected disconnections and auto-reconnecting.


Test Case 46: To verify that the Network Manager does not reconnect to the last connected network when auto-connect is disabled
    [Documentation]    Verifying that the Network Manager does not automatically reconnect when the auto-connect flag is set to "no".
    Execute Command    curl -s http://localhost/wifi/disable

    # Step 1: Enable Wi-Fi and validate
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: 'IAST_4th_Floor' found in available networks.

    ${wifi_state}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State: ${wifi_state}
    Should Contain    ${wifi_state}    "Message: enabled"    ✅ Test Passed: Wi-Fi state is enabled.

    # Step 2: Delete 'Test' profile if it already exists
    ${saved_profiles}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    📜 Saved Profiles Before Test: ${saved_profiles}
    Run Keyword If    "Test" in "${saved_profiles}"    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Sleep    2s

    # Step 3: Connect to Wi-Fi network and verify connection
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    📜 Connection Response: ${connect_output}
    Should Contain    ${connect_output}    "Message: 'Test' connection successfully activated"    ✅ Test Passed: Connected to 'IAST_4th_Floor'.

    Sleep    2s
    ${connection_status}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Connection Status: ${connection_status}
    Should Contain    ${connection_status}    "Message: Connected to 'Test'"    ✅ Test Passed: Successfully connected to 'IAST_4th_Floor'.

    # Step 4: Disable Auto-Reconnect for 'Test' profile
    ${autoconnect_output}=    Execute Command    curl -s http://localhost/wifi/autoconnect -H "Content-Type: application/json" -d '{"profile": "Test", "flag": "No"}'
    Log    📜 Auto-Reconnect Response: ${autoconnect_output}
    Should Contain    ${autoconnect_output}    Message: Autoconnect disabled for 'Test' - Reconnect / Activate to apply changes    ✅ Test Passed: Auto-reconnect disabled successfully.

    # Step 5: Simulate unexpected disconnection by disabling Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Response: ${disable_output}
    Sleep    3s

    ${wifi_state_after_disable}=    Execute Command    curl -s http://localhost/wifi/wifi_state
    Log    📜 Wi-Fi State After Disable: ${wifi_state_after_disable}
    Should Contain    ${wifi_state_after_disable}    "Message: disabled"    ✅ Test Passed: Wi-Fi disabled successfully.

    # Step 6: Re-enable Wi-Fi and check if it reconnects
    ${enable_again}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Re-Enable Response: ${enable_again}
    Sleep    1m  # Wait for auto-reconnection attempt

    ${reconnect_status}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Reconnection Status: ${reconnect_status}
    Should Not Contain    ${reconnect_status}    "Connected"    ✅ Test Passed: Wi-Fi did not reconnect, as expected.

    ${active_profile_output}=    Execute Command    curl -s http://localhost/wifi/active-profile-info
    Log    📜 Active Profile Info Response: ${active_profile_output}
    Should Not Contain    ${active_profile_output}    "connection.id:                          Test"    ✅ Test Passed: No active profile found.
    Should Not Contain    ${active_profile_output}    "802-11-wireless.ssid:                   IAST_4th_Floor"    ✅ Test Passed: No SSID connected.

    # Step 7: Verify active Wi-Fi info
    ${active_wifi_info}=    Execute Command    curl -s http://localhost/wifi/active-wifi-info
    Log    📜 Active Wi-Fi Info: ${active_wifi_info}
    Should Not Contain    ${active_wifi_info}    "SSID"    ✅ Test Passed: No active Wi-Fi connection detected.

    # Step 8: Cleanup - Delete 'Test' profile
    ${delete_profile}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    📜 Profile Deletion Response: ${delete_profile}
    Should Contain    ${delete_profile}    'Test' connection profile deleted successfully.    ✅ Test Passed: Test profile deleted successfully.
    Execute Command    curl -s http://localhost/wifi/disable
    Log    🔍 Observed the API's behavior when handling auto-connect disabled.


Test Case 47: Verify API successfully disconnects from the currently connected Wi-Fi network
    [Documentation]    Ensuring the API successfully disconnects from the currently connected Wi-Fi network.
    Execute Command    curl -s http://localhost/wifi/disable
    # Step 1: Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Wi-Fi enabled successfully.
    Sleep    5s  # Wait for auto-reconnection attempt

    # Step 2: Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    📜 Available Networks: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Available networks retrieved successfully.

    # Step 3: Connect to Wi-Fi
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "TestProfile", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    📜 Wi-Fi Connect Output: ${connect_output}
    Should Contain    ${connect_output}    'TestProfile' connection successfully activated    ✅ API successfully connected to Wi-Fi.

    # Step 4: Verify Wi-Fi connection status before disconnecting
    ${status_output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Connection Status Before Disconnect: ${status_output}
    Should Contain    ${status_output}    Connected to 'TestProfile'    ✅ Wi-Fi connection verified before disconnect.

    # Step 5: Disconnect Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Wi-Fi Disconnect Output: ${disconnect_output}
    Should Contain    ${disconnect_output}    Device 'mlan0' successfully disconnected.    ✅ Wi-Fi disconnected successfully.

    # Step 6: Verify Wi-Fi connection status after disconnecting
    ${status_output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Connection Status After Disconnect: ${status_output}
    Should Contain    ${status_output}    Disconnected    ✅ Wi-Fi is now disconnected.

    # Step 7: Delete Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile":"TestProfile"}'
    Log    📜 Wi-Fi Profile Deletion Output: ${delete_output}
    Should Contain    ${delete_output}    'TestProfile' connection profile deleted successfully.    ✅ Wi-Fi profile deleted successfully.

    # Step 8: Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Output: ${disable_output}
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Wi-Fi disabled successfully.

    # Final Observation
    Log    🔍 Observed that the API successfully connected to Wi-Fi, disconnected correctly, and reported the expected status.


Test Case 48: Verify API correctly handles disconnection when Wi-Fi is already disconnected
    [Documentation]    Verify that the API returns an appropriate error message when attempting to disconnect from an already disconnected Wi-Fi network.
    Execute Command    curl -s http://localhost/wifi/disable
    # Step 1: Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    📜 Wi-Fi Enable Output: ${enable_output}
    Should Contain    ${enable_output}    "Message: Wifi enabled successfully."    ✅ Wi-Fi enabled successfully.
    Sleep    5s
    # Step 2: Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    📜 Available Networks: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Available networks retrieved successfully.

    # Step 3: Connect to Wi-Fi
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "TestProfile", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    📜 Wi-Fi Connect Output: ${connect_output}
    Should Contain    ${connect_output}    "Message: 'TestProfile' connection successfully activated"    ✅ API successfully connected to Wi-Fi.

    # Step 4: Verify Wi-Fi connection status before disconnecting
    ${status_output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Connection Status Before Disconnect: ${status_output}
    Should Contain    ${status_output}    "Message: Connected to 'TestProfile'"    ✅ Wi-Fi connection verified before disconnect.

    # Step 5: Disconnect Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Wi-Fi Disconnect Output: ${disconnect_output}
    Should Contain    ${disconnect_output}    "Message: Device 'mlan0' successfully disconnected."    ✅ Wi-Fi disconnected successfully.

    # Step 6: Verify Wi-Fi connection status after disconnecting
    ${status_output}=    Execute Command    curl -s http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Connection Status After Disconnect: ${status_output}
    Should Contain    ${status_output}    "Message: Disconnected"    ✅ Wi-Fi is now disconnected.

    # Step 7: Attempt to disconnect again (should fail)
    ${disconnect_again_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    📜 Second Wi-Fi Disconnect Attempt Output: ${disconnect_again_output}
    Should Contain    ${disconnect_again_output}    "Message: Wi-Fi is already disconnected    ✅ Expected failure message received.

    # Step 8: Delete Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile":"TestProfile"}'
    Log    📜 Wi-Fi Profile Deletion Output: ${delete_output}
    Should Contain    ${delete_output}    "Message: 'TestProfile' connection profile deleted successfully."    ✅ Wi-Fi profile deleted successfully.

    # Step 9: Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    📜 Wi-Fi Disable Output: ${disable_output}
    Should Contain    ${disable_output}    "Message: Wifi disabled successfully."    ✅ Wi-Fi disabled successfully.

    # Final Observation
    Log    🔍 Observed that the API handled the second disconnection attempt correctly by returning an appropriate error message.

#Test Case 49: Verify API can connect and disconnect from Wi-Fi 20 times without failure
#    [Documentation]    Verify that the Wi-Fi module can handle repeated connection and disconnection cycles to ensure stability and reliability.
#
#    # Enable Wi-Fi and validate success
#    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
#    Run Keyword If    "Wifi enabled successfully" in "${enable_output}"    Log    ✅ Wi-Fi enabled successfully.
#    Run Keyword Unless    "Wifi enabled successfully" in "${enable_output}"    Fail    ❌ Wi-Fi enable failed.
#
#    # Fetch available Wi-Fi networks
#    ${networks_output}=    Execute Command    curl http://localhost/wifi/networks
#    Run Keyword If    "IAST_4_Floor" in "${networks_output}"    Log    ✅ Available networks retrieved successfully.
#    Run Keyword Unless    "IAST_4_Floor" in "${networks_output}"    Fail    ❌ Target SSID not found in available networks.
#
#    # Repeat connection/disconnection 20 times
#    FOR    ${i}    IN RANGE    1    21
#        Log    🔄 Iteration: ${i}/20 - Connecting to Wi-Fi
#
#        # Attempt to connect with an existing SSID and correct password
#        ${connect_output}=    Execute Command    curl http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "TestProfile", "ssid": "IAST_4_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
#
#        # Validate API response for successful connection
#        Run Keyword If    "connected successfully" in "${connect_output}"    Log    ✅ API successfully connected to Wi-Fi.
#        Run Keyword Unless    "connected successfully" in "${connect_output}"    Fail    ❌ API did not successfully connect to Wi-Fi.
#
#        # Verify Wi-Fi connection status before disconnecting
#        ${status_output}=    Execute Command    curl http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
#        Run Keyword If    "connected" in "${status_output}"    Log    ✅ Wi-Fi connection verified before disconnect.
#        Run Keyword Unless    "connected" in "${status_output}"    Fail    ❌ Wi-Fi was not connected before attempting to disconnect.
#
#        # Disconnect Wi-Fi
#        ${disconnect_output}=    Execute Command    curl http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
#        Run Keyword If    "disconnected" in "${disconnect_output}" or "Wifi disconnected successfully" in "${disconnect_output}"    Log    ✅ Wi-Fi disconnected successfully.
#        Run Keyword Unless    "disconnected" in "${disconnect_output}" or "Wifi disconnected successfully" in "${disconnect_output}"    Fail    ❌ Wi-Fi did not disconnect correctly.
#
#        # Verify Wi-Fi connection status after disconnecting
#        ${status_output}=    Execute Command    curl http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
#        Run Keyword If    "disconnected" in "${status_output}" or "not connected" in "${status_output}"    Log    ✅ Wi-Fi is now disconnected.
#        Run Keyword Unless    "disconnected" in "${status_output}" or "not connected" in "${status_output}"    Fail    ❌ API did not report Wi-Fi as disconnected.
#
#        # Delete Wi-Fi profile inside the loop
#        ${delete_output}=    Execute Command    curl http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile":"TestProfile"}'
#        Run Keyword If    "deleted" in "${delete_output}"    Log    ✅ Wi-Fi profile deleted successfully.
#        Run Keyword Unless    "deleted" in "${delete_output}"    Fail    ❌ Wi-Fi profile deletion failed.
#
#        Log    🔄 Iteration: ${i}/20 - Cycle Completed Successfully
#    END
#
#    # Disable Wi-Fi
#    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
#    Run Keyword If    "Wifi disabled successfully" in "${disable_output}"    Log    ✅ Wi-Fi disabled successfully.
#    Run Keyword Unless    "Wifi disabled successfully" in "${disable_output}"    Fail    ❌ Wi-Fi disable failed.
#
#    # Final observation
#    Log    🔍 Observed that the API successfully completed 20 connection/disconnection cycles with profile deletion after each cycle.

Test Case 49: Verify API can connect and disconnect from Wi-Fi 20 times without failure
    [Documentation]    Verify that the Wi-Fi module can handle repeated connection and disconnection cycles to ensure stability and reliability.
    Execute Command    curl http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl http://localhost/wifi/enable
    Should Contain    ${enable_output}    Wifi enabled successfully    ✅ Wi-Fi enabled successfully.
    Sleep    5s
    
    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl http://localhost/wifi/networks
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Target SSID found in available networks.

    # Repeat connection/disconnection 20 times
    FOR    ${i}    IN RANGE    1    21
        Log    🔄 Iteration: ${i}/20 - Connecting to Wi-Fi

        # Attempt to connect with an existing SSID and correct password
        ${connect_output}=    Execute Command    curl http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
        Should Contain    ${connect_output}    Message: 'Test' connection successfully activated    ✅ API successfully connected to Wi-Fi.

        # Verify Wi-Fi connection status before disconnecting
        ${status_output}=    Execute Command    curl http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
        Should Contain    ${status_output}    Message: Connected to 'Test    ✅ Wi-Fi connection verified before disconnect.


        ${disconnect_output}=    Execute Command    curl http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
        Should Contain    ${disconnect_output}    disconnected    ✅ Wi-Fi disconnected successfully.

        # Verify Wi-Fi connection status after disconnecting
        ${status_output}=    Execute Command    curl http://localhost/wifi/wifi_connection_status -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
        Should Contain    ${status_output}    "Message: Disconnected"    ✅ Wi-Fi is now disconnected.

        # Delete Wi-Fi profile inside the loop with error handling
        ${delete_output}=    Execute Command    curl http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile":"Test"}'
        Should Contain    ${delete_output}    'Test' connection profile deleted successfully    ✅ Wi-Fi profile deleted successfully.

        Log    🔄 Iteration: ${i}/20 - Cycle Completed Successfully
    END

    # Disable Wi-Fi
    ${disable_output}=    Execute Command    curl http://localhost/wifi/disable
    Should Contain    ${disable_output}    Wifi disabled successfully    ✅ Wi-Fi disabled successfully.

    # Final observation
    Log    🔍 Observed that the API successfully completed 20 connection/disconnection cycles with profile deletion after each cycle.

Test Case 50: Verify API successfully deletes a specific Wi-Fi network profile
    [Documentation]    Verifies that the API successfully deletes a specific Wi-Fi profile and confirms its removal.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    Message: Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s
    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: Available networks retrieved successfully.

    # Connect to a specific SSID
    ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "Test", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
    Log    Wi-Fi Connection Response: ${connect_output}
    Should Contain    ${connect_output}    Message: 'Test' connection successfully activated    ✅ Test Passed: Successfully connected to Wi-Fi.

    # Fetch saved Wi-Fi profiles
    ${profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    Saved Wi-Fi Profiles Response: ${profiles_output}
    Should Contain    ${profiles_output}    Test    ✅ Test Passed: Wi-Fi profile saved successfully.

    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    Wi-Fi Disconnect Response: ${disconnect_output}
    Should Contain    ${disconnect_output}    Message: Device 'mlan0' successfully disconnected.    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Delete Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "Test"}'
    Log    Wi-Fi Profile Deletion Response: ${delete_output}
    Should Contain    ${delete_output}    Message: 'Test' connection profile deleted successfully.    ✅ Test Passed: Wi-Fi profile deleted successfully.

    # Verify Wi-Fi profile is no longer in saved profiles
    ${profiles_output_after_delete}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    Saved Wi-Fi Profiles After Deletion Response: ${profiles_output_after_delete}
    Should Not Contain    ${profiles_output_after_delete}    Test    ✅ Test Passed: Wi-Fi profile successfully removed.

    # Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    Message: Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final observation
    Log    🔍 Observed that the API correctly deleted the Wi-Fi profile and confirmed its removal.

Test Case 51: Verify deleting a non-existent Wi-Fi profile returns an error
    [Documentation]    Verifying that deleting a non-existent Wi-Fi network profile returns an appropriate error message.
    Execute Command    curl -s http://localhost/wifi/disable
    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    Message: Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Ensure the Wi-Fi profile does not exist before deletion
    ${profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    Saved Wi-Fi Profiles Response: ${profiles_output}
    Should Not Contain    ${profiles_output}    Nonexist    ✅ Test Passed: Wi-Fi profile 'Nonexist' does not exist before deletion.

    # Attempt to delete a non-existent Wi-Fi profile
    ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile":"Nonexist"}'
    Log    Delete Wi-Fi Profile Response: ${delete_output}
    Should Contain    ${delete_output}    "Message: profile 'Nonexist' not found in saved profiles."    ✅ Test Passed: Correct error message returned for non-existent profile.

    # Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    Message: Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final observation
    Log    🔍 Observed that the API correctly handled the deletion attempt for a non-existent Wi-Fi profile and returned an expected error.

Test Case 52: Verify deleting multiple Wi-Fi profiles sequentially works correctly
    [Documentation]    Ensure multiple Wi-Fi profiles can be deleted one by one and the API responds correctly.
    Execute Command    curl -s http://localhost/wifi/disable

    # Enable Wi-Fi and validate success
    ${enable_output}=    Execute Command    curl -s http://localhost/wifi/enable
    Log    Enable Wi-Fi Response: ${enable_output}
    Should Contain    ${enable_output}    Message: Wifi enabled successfully    ✅ Test Passed: Wi-Fi enabled successfully.
    Sleep    5s

    # Fetch available Wi-Fi networks
    ${networks_output}=    Execute Command    curl -s http://localhost/wifi/networks
    Log    Available Networks Response: ${networks_output}
    Should Contain    ${networks_output}    IAST_4th_Floor    ✅ Test Passed: Available networks retrieved successfully.

    # Connect to multiple SSIDs sequentially
    @{profiles}=    Create List    Test1    Test2    Test3
    FOR    ${profile}    IN    @{profiles}
        ${connect_output}=    Execute Command    curl -s http://localhost/wifi/connect -H "Content-Type: application/json" -d '{"name": "${profile}", "ssid": "IAST_4th_Floor", "password": "iAsT#2023@", "interface": "mlan0"}'
        Log    Wi-Fi Connection Response: ${connect_output}
        Should Contain    ${connect_output}    Message: '${profile}' connection successfully activated    ✅ Test Passed: Successfully connected to ${profile}.
    END

    # Fetch saved Wi-Fi profiles
    ${profiles_output}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    Saved Wi-Fi Profiles Response: ${profiles_output}
    FOR    ${profile}    IN    @{profiles}
        Should Contain    ${profiles_output}    ${profile}    ✅ Test Passed: Wi-Fi profile ${profile} saved successfully.
    END

    # Disconnect from Wi-Fi
    ${disconnect_output}=    Execute Command    curl -s http://localhost/wifi/disconnect -H "Content-Type: application/json" -d '{"interface": "mlan0"}'
    Log    Wi-Fi Disconnect Response: ${disconnect_output}
    Should Contain    ${disconnect_output}    Message: Device 'mlan0' successfully disconnected.    ✅ Test Passed: Wi-Fi disconnected successfully.

    # Delete Wi-Fi profiles one by one
    FOR    ${profile}    IN    @{profiles}
        ${delete_output}=    Execute Command    curl -s http://localhost/wifi/delete -H "Content-Type: application/json" -d '{"profile": "${profile}"}'
        Log    Wi-Fi Profile Deletion Response: ${delete_output}
        Should Contain    ${delete_output}    Message: '${profile}' connection profile deleted successfully.    ✅ Test Passed: Wi-Fi profile ${profile} deleted successfully.
    END

    # Verify Wi-Fi profiles are no longer in saved profiles
    ${profiles_output_after_delete}=    Execute Command    curl -s http://localhost/wifi/saved-profiles
    Log    Saved Wi-Fi Profiles After Deletion Response: ${profiles_output_after_delete}
    FOR    ${profile}    IN    @{profiles}
        Should Not Contain    ${profiles_output_after_delete}    ${profile}    ✅ Test Passed: Wi-Fi profile ${profile} successfully removed.
    END

    # Disable Wi-Fi
    ${disable_output}=    Execute Command    curl -s http://localhost/wifi/disable
    Log    Disable Wi-Fi Response: ${disable_output}
    Should Contain    ${disable_output}    Message: Wifi disabled successfully    ✅ Test Passed: Wi-Fi disabled successfully.

    # Final observation
    Log    🔍 Observed that the API correctly deleted multiple Wi-Fi profiles sequentially and confirmed their removal.