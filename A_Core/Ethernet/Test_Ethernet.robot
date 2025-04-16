*** Settings ***
Library    SSHLibrary
Test Setup    Connect To Remote Machine
Test Teardown    Close Connection

*** Variables ***
${REMOTE_IP}    192.168.0.38
${USERNAME}     root

*** Keywords ***
Connect To Remote Machine    Open Connection    ${REMOTE_IP}
    Login              ${USERNAME}

*** Test Cases ***
Test Case 1: To verify the shell command "ip" for Standard Ethernet in A-Core
    [Documentation]    Verify that the 'ip' command shows the IP address of all interfaces.
    ${output}=    Execute Command    ip address
    Log    IP Command Output: ${output}
    Should Contain    ${output}    pfe0
    Log    Observation: 'pfe0' interface detected in 'ip address' output.

Test Case 2: To verify the shell command "ifconfig" for Standard Ethernet in A-Core
    [Documentation]    Verify that the 'ifconfig' command shows configured interfaces.
    ${output}=    Execute Command    ifconfig
    Log    Ifconfig Output: ${output}
    Should Contain    ${output}    pfe0
    Log    Observation: 'pfe0' interface detected in 'ifconfig' output.

Test Case 3: To verify the shell command "lspci" for Standard Ethernet in A-Core
    [Documentation]    Verify that the 'lspci' command lists PCI devices.
    ${output}=    Execute Command    lspci
    Log    lspci Output: ${output}
    Should Contain    ${output}    Class
    Log    Observation: PCI device information retrieved successfully.

Test Case 4: To verify the shell command "lshw" for Standard Ethernet in A-Core
    [Documentation]    Verify that the 'lshw' command lists hardware details.
    ${output}=    Execute Command    lshw
    Log    lshw Output: ${output}
    Should Contain    ${output}    s32g399acgm
    Log    Observation: Expected hardware identifier 's32g399acgm' found in lshw output.

Test Case 5: To verify the configured IP address for pfe0
    [Documentation]    Verify that the IP address is correctly configured for pfe0.
    ${file_content}=    Execute Command    ifconfig pfe0 192.168.0.22 netmask 255.255.255.0
    Log    Ifconfig Configuration Output: ${file_content}
    ${file_content}=    Execute Command    ifconfig
    Log    Ifconfig Output: ${file_content}
    Should Contain    ${file_content}    192.168.0.22
    ${ping_output}=    Execute Command    ping -c4 192.168.0.22
    Log    Ping Output: ${ping_output}
    Should Contain    ${ping_output}    64 bytes from 192.168.0.22
    Log    Observation: 'pfe0' interface configured with expected IP and responds to ping.

Test Case 6: To verify the pfe0 communication for an invalid IP address
    [Documentation]    Verify that an invalid or not configured IP address on pfe0 shows errors.
    ${output}=    Execute Command    ifconfig
    Log    Ifconfig Output: ${output}
    Should Not Contain    ${output}    192.168.0.155
    ${ping_output}=    Execute Command    ping -c4 192.168.0.155
    Log    Ping Output: ${ping_output}
    Should Contain    ${ping_output}    pipe
    Log    Observation: Invalid IP not found in configuration, and ping test failed as expected.

Test Case 7: To verify the data exchange from ECU to another device with an invalid IP address for PFE0 switch
    [Documentation]    Verifying that an invalid IP address is not assigned and communication fails.

    # Execute ifconfig with invalid IP and capture stderr
    ${output}=    SSHLibrary.Execute Command    ifconfig pfe0 192.168.0.300 netmask 255.255.255.0 2>&1
    Log    Ifconfig Output: ${output}

    # Verify ifconfig command returned the expected error messages
    Should Contain    ${output}    192.168.0.300: Unknown host
    Should Contain    ${output}    ifconfig: `--help' gives usage information.

    # Ensure the invalid IP is not assigned
    ${ifconfig_output}=    SSHLibrary.Execute Command    ifconfig
    Log    Current Ifconfig Output: ${ifconfig_output}
    Should Not Contain    ${ifconfig_output}    192.168.0.300

    Log    Observation: correctly rejected the invalid IP assignment with 'unknown host' error.



Test Case 8: To verify the data exchange from ECU to another device with invalid IP address for sw0p1 switch
    [Documentation]    Verifying the invalid IP address is transmitted to the other device from sw0p1

    # Execute ifconfig with invalid IP and capture stderr
    ${output}=    SSHLibrary.Execute Command    ifconfig sw0p1 192.168.0.300 netmask 255.255.255.0 2>&1
    Log    Ifconfig Output: ${output}

    # Verify ifconfig command returned the expected error messages
    Should Contain    ${output}    192.168.0.300: Unknown host
    Should Contain    ${output}    ifconfig: `--help' gives usage information.

    # Ensure the invalid IP is not assigned
    ${ifconfig_output}=    SSHLibrary.Execute Command    ifconfig
    Log    Current Ifconfig Output: ${ifconfig_output}
    Should Not Contain    ${ifconfig_output}    192.168.0.300

    Log    Observation: correctly rejected the invalid IP assignment with 'unknown host' error.


Test Case 9: To verify the data exchange from ECU to another device with invalid IP address for sw0p2 switch
    [Documentation]    Verifying the invalid IP address is transmitted to the other device from sw0p2

    # Execute ifconfig with invalid IP and capture stderr
    ${output}=    SSHLibrary.Execute Command    ifconfig sw0p2 192.168.0.300 netmask 255.255.255.0 2>&1
    Log    Ifconfig Output: ${output}

    # Verify ifconfig command returned the expected error messages
    Should Contain    ${output}    192.168.0.300: Unknown host
    Should Contain    ${output}    ifconfig: `--help' gives usage information.

    # Ensure the invalid IP is not assigned
    ${ifconfig_output}=    SSHLibrary.Execute Command    ifconfig
    Log    Current Ifconfig Output: ${ifconfig_output}
    Should Not Contain    ${ifconfig_output}    192.168.0.300

    Log    Observation: correctly rejected the invalid IP assignment with 'unknown host' error.


Test Case 10: To verify the data exchange from ECU to another device with invalid IP address for sw1p1 switch
    [Documentation]    Verifying the invalid IP address is transmitted to the other device from sw1p1

    # Execute ifconfig with invalid IP and capture stderr
    ${output}=    SSHLibrary.Execute Command    ifconfig sw1p1 192.168.0.300 netmask 255.255.255.0 2>&1
    Log    Ifconfig Output: ${output}

    # Verify ifconfig command returned the expected error messages
    Should Contain    ${output}    192.168.0.300: Unknown host
    Should Contain    ${output}    ifconfig: `--help' gives usage information.

    # Ensure the invalid IP is not assigned
    ${ifconfig_output}=    SSHLibrary.Execute Command    ifconfig
    Log    Current Ifconfig Output: ${ifconfig_output}
    Should Not Contain    ${ifconfig_output}    192.168.0.300

    Log    Observation: correctly rejected the invalid IP assignment with 'unknown host' error.


Test Case 11: To verify the data exchange from ECU to another device with invalid IP address for sw1p2 switch
    [Documentation]    Verifying the invalid IP address is transmitted to the other device from sw1p2

    # Execute ifconfig with invalid IP and capture stderr
    ${output}=    SSHLibrary.Execute Command    ifconfig sw1p2 192.168.0.300 netmask 255.255.255.0 2>&1
    Log    Ifconfig Output: ${output}

    # Check for 'unknown host' in the output
    Should Contain    ${output}    192.168.0.300: Unknown host
    Should Contain    ${output}    ifconfig: `--help' gives usage information.

    # Check if the invalid IP is not set on the interface
    ${ifconfig_output}=    SSHLibrary.Execute Command    ifconfig
    Log    Current Ifconfig Output: ${ifconfig_output}

    Should Not Contain    ${ifconfig_output}    192.168.0.300

    Log    Observation: correctly rejected the invalid IP assignment with 'unknown host' error.

Test Case 12: To verify the data exchange from ECU to another device with valid IP Address to invalid switch configuration for PFE0
    [Documentation]    Verifying the valid IP Address to invalid switch configuration.

    ${output}=    Execute Command    ifconfig pfe0 192.168.0.156 netmask 255.255.255.0
    Log    Ifconfig Output: ${output}

    ${ifconfig_output}=    Execute Command    ifconfig pfe0
    Should Contain    ${ifconfig_output}    192.168.0.156

    Log    Current Ifconfig Output: ${ifconfig_output}

    # Execute ping with a timeout of 5 seconds
    ${ping_output}=    Execute Command    ping -I sw0p1 -w 5 192.168.0.157
    Log    Ping Output: ${ping_output}

 # Validate that ping fails due to invalid switch configuration
    Should Contain    ${ping_output}    0 received
    Should Contain    ${ping_output}    100% packet loss

    Log    Observation: Ping failed due to invalid switch configuration for 'sw0p1', confirming expected behavior.



Test Case 13: To verify the data exchange from ECU to another device with valid IP Address to invalid switch configuration for sw0p1
    [Documentation]    Verifying the valid IP Address to invalid switch configuration.

    ${output}=    Execute Command    ifconfig pfe0 192.168.0.156 netmask 255.255.255.0
    Log    Ifconfig Output: ${output}


    ${ifconfig_output}=    Execute Command    ifconfig pfe0
    Should Contain    ${ifconfig_output}    192.168.0.156

    Log    Current Ifconfig Output: ${ifconfig_output}

    # Execute ping with a timeout of 5 seconds
    ${ping_output}=    Execute Command    ping -I sw0p2 -w 5 192.168.0.157
    Log    Ping Output: ${ping_output}

 # Validate that ping fails due to invalid switch configuration
    Should Contain    ${ping_output}    0 received
    Should Contain    ${ping_output}    100% packet loss

    Log    Observation: Ping failed due to invalid switch configuration for 'sw0p1', confirming expected behavior.

Test Case 14: To verify the data exchange from ECU to another device with valid IP Address to invalid switch configuration for sw0p2
    [Documentation]    Verifying the valid IP Address to invalid switch configuration.

    ${output}=    Execute Command    ifconfig pfe0 192.168.0.156 netmask 255.255.255.0
    Log    Ifconfig Output: ${output}

    ${ifconfig_output}=    Execute Command    ifconfig pfe0
    Should Contain    ${ifconfig_output}    192.168.0.156

    Log    Current Ifconfig Output: ${ifconfig_output}

    # Execute ping with a timeout of 5 seconds
    ${ping_output}=    Execute Command    ping -I sw0p1 -w 5 192.168.0.157
    Log    Ping Output: ${ping_output}

   # Validate that ping fails due to invalid switch configuration
    Should Contain    ${ping_output}    0 received
    Should Contain    ${ping_output}    100% packet loss

    Log    Observation: Ping failed due to invalid switch configuration for 'sw0p2', confirming expected behavior.

Test Case 15: To verify the data exchange from ECU to another device with valid IP Address to invalid switch configuration for sw1p1
    [Documentation]    Verifying the valid IP Address to invalid switch configuration.

    ${output}=    Execute Command    ifconfig pfe0 192.168.0.156 netmask 255.255.255.0
    Log    Ifconfig Output: ${output}

    ${ifconfig_output}=    Execute Command    ifconfig pfe0
    Should Contain    ${ifconfig_output}    192.168.0.156

    Log    Current Ifconfig Output: ${ifconfig_output}

    # Execute ping with a timeout of 5 seconds
    ${ping_output}=    Execute Command    ping -I sw1p2 -w 5 192.168.0.157
    Log    Ping Output: ${ping_output}

    # Validate that ping fails due to invalid switch configuration
    Should Contain    ${ping_output}    0 received
    Should Contain    ${ping_output}    100% packet loss

    Log    Observation: Ping failed due to invalid switch configuration for 'sw1p2', confirming expected behavior.

Test Case 16: To verify the data exchange from ECU to another device with valid IP Address to invalid switch configuration for sw1p2
    [Documentation]    Verifying the valid IP Address to invalid switch configuration.

    ${output}=    Execute Command    ifconfig pfe0 192.168.0.156 netmask 255.255.255.0
    Log    Ifconfig Output: ${output}

    ${ifconfig_output}=    Execute Command    ifconfig pfe0
    Should Contain    ${ifconfig_output}    192.168.0.156

    Log    Current Ifconfig Output: ${ifconfig_output}

    # Execute ping with a timeout of 5 seconds
    ${ping_output}=    Execute Command    ping -I sw1p1 -w 5 192.168.0.157
    Log    Ping Output: ${ping_output}

    # Validate that ping fails due to invalid switch configuration
    Should Contain    ${ping_output}    0 received
    Should Contain    ${ping_output}    100% packet loss

    Log    Observation: Ping failed due to invalid switch configuration for 'sw1p1', confirming expected behavior.