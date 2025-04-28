*** Settings ***
Library    SSHLibrary    # Use the SSHLibrary to connect to the remote machine via SSH
Test Setup    Connect To Remote Machine    # Establish an SSH connection before tests start
Test Teardown    Close Connection    # Close the SSH connection after tests finish

*** Variables ***
${REMOTE_IP}    192.168.0.22    # IP address of the remote machine where the tests are executed
${USERNAME}     root    # SSH login username (root in this case)

*** Keywords ***
Connect To Remote Machine
    Open Connection    ${REMOTE_IP}    # Open an SSH connection to the remote machine using the provided IP
    Login    ${USERNAME}    # Log into the remote machine with the provided username

*** Test Cases ***


Test Case 1: Verify CAN Interface Initialization on A Core
    [Documentation]    Verify that the CAN interface can be initialized correctly on A Core after the booting

    # Check if the CAN interface 'can0' exists on the remote machine
    ${status_output}=    Execute Command    ip link show can0
    Should Contain    ${status_output}    can0    # Assert that 'can0' is listed in the output (i.e., the interface exists)
    # Verify that the CAN interface 'can0' is now UP and in DEFAULT mode

    Should Contain    ${status_output}    state UP mode DEFAULT    # Assert that the interface state is UP and mode is DEFAULT
#    # Bring up the CAN interface 'can0' with a bitrate of 500000 (500kbps)
#    ${setup_output}=    Execute Command    ip link set can0 up type can bitrate 500000
#    Should Not Contain    ${setup_output}    Error    # Ensure no errors appear when setting up the interface

    Log    Successfully initialized CAN interface with after booting

Test Case 2: Verify that the CAN baud rate to 500kbps.
    [Documentation]    CGM Linux OS shall configure the CAN baud rate to 500kbps.

    # Bring up the CAN interface with the expected bitrate
    Execute Command    ip link set can0 up type can bitrate 500000
    Sleep    1s  # Allow time for changes to take effect

    # Verify the configured baud rate
    ${output}=    Execute Command    ip -details link show can0
    Log    ${output}
    Should Contain    ${output}    bitrate 500000

    # Bring down the interface after test
    Execute Command    ip link set can0 down

    Log    Successfully verified CAN baud rate of can0.

Test Case 3: Verify that an invalid CAN baud rate of 2000kbps is not accepted by the CGM Linux OS.
    [Documentation]    CGM Linux OS shall not support the invalid CAN baud rate to 2000kbps.

    # Bring down the CAN interface before applying the invalid bitrate
    Execute Command    ip link set can0 down

    # Try setting an invalid CAN bitrate
    ${output}=    Execute Command    ip link set can0 up type can bitrate 200000

    # Verify the configured baud rate
    ${output}=    Execute Command    ip -details link show can0
    Log    ${output}
    Should Contain    ${output}    bitrate 200000
    Should Contain    ${output}    ERROR-ACTIVE
    # Bring down the interface after test
    Execute Command    ip link set can0 down

    Log    Successfully verified that setting an invalid CAN baud rate of 2000kbps was not accepted.

Test Case 4: Verify that the CGM Linux OS shall send the CAN frames along with its message id and CAN type.
    [Documentation]  CGM shall support the CAN frames along with its message id and CAN type.

    # Bring up the CAN interface
    Execute Command  ip link set can0 down
    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
    Sleep  1s  # Ensure interface is up

    # Start candump in the background properly
    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
    Sleep  1s  # Wait for candump to start

    # Send a CAN message
    Execute Command  cansend can0 613#112233445566778899aabbcceedd112211
    Sleep  2s  # Allow time for message to be logged

    # Read the log file and verify the message
    ${output}=  Execute Command  cat /tmp/can_log.txt
    Should Contain  ${output}  can0  613   [8]  11 22 33 44 55 66 77 88

    # Cleanup
    Execute Command  ip link set can0 down
    Execute Command  pkill candump
    Execute Command  rm -f /tmp/can_log.txt

    Log    Successfully transmitted CAN frames with message ID and CAN type.
#Test Case 4: Verify the CAN A-Core communication through the command : cansend can0 613#112233445566778899aabbcceedd112211 cansend can0 613#112233445566778899aabbcceedd112211
#    [Documentation]  Send the Transmission of same CAN command with 2 times in one line command 1.cansend can0 613#112233445566778899aabbcceedd112211 cansend can0 613#112233445566778899aabbcceedd112211
#
#    # Bring up the CAN interface
#    Execute Command  ip link set can0 down
#    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
#    Sleep  1s  # Ensure interface is up
#
#   # Start candump in the background properly
#    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
#    Sleep  1s  # Wait for candump to start
#
#    # Send a CAN message
#    Execute Command  cansend can0 613#112233445566778899aabbcceedd112211cansend can0 613#112233445566778899aabbcceedd112211
#    Sleep  2s  # Allow time for message to be logged

#    # Read the log file and verify the message
#    ${output}=  Execute Command  cat /tmp/can_log.txt
#    Should Not Contain  ${output}  can0  613   [8]  11 22 33 44 55 66 77 88
#    Should Not Contain  ${output}  can0  613   [8]  11 22 33 44 55 66 77 88
#    # Cleanup
#    Execute Command  ip link set can0 down
#    Execute Command  pkill candump
#    Execute Command  rm -f /tmp/can_log.txt

Test Case 5: Verify that the CGM Linux OS shall send the CAN frames along with its invalid message id and CAN type.
    [Documentation]  CGM shall not support the invalid message id and CAN type.
    # Bring up the CAN interface
    Execute Command  ip link set can0 down
    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
    Sleep  1s  # Ensure interface is up

    # Start candump in the background properly
    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
    Sleep  1s  # Wait for candump to start

    # Send a CAN message
    ${output}=    Execute Command  cansend can0 11613#112233445566778899aabbcceedd112211
    Log To Console    ${output}
    Sleep  2s  # Allow time for message to be logged
    #Should Contain    ${output}    Wrong CAN-frame format!
    # Read the log file and verify the message
    ${output}=  Execute Command  cat /tmp/can_log.txt
    Should Not Contain  ${output}  can0  11613   [8]  11 22 33 44 55 66 77 88
    Should Not Contain  ${output}  can0  11613   [8]  11 22 33 44 55 66 77 88
    # Cleanup
    Execute Command  ip link set can0 down
    Execute Command  pkill candump
    Execute Command  rm -f /tmp/can_log.txt
    Log    Successfully verified messages should not be transmitted invalid CAN message IDs and CAN types.


Test Case 6: Verify that the CAN A-Core communication through invalid CAN channel
    [Documentation]  CGM shall not support the invalid CAN channel
    # Bring up the CAN interface
    Execute Command  ip link set can0 down
    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
    Sleep  1s  # Ensure interface is up

    # Start candump in the background properly
    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
    Sleep  1s  # Wait for candump to start

    # Send a CAN message
    ${output}=    Execute Command  cansend can1 613#112233445566778899aabbcceedd112211
    Sleep  2s  # Allow time for message to be logged
    #Should Contain    ${output}    No such device
    # Read the log file and verify the message
    ${output}=  Execute Command  cat /tmp/can_log.txt
    Should Not Contain  ${output}  can1  613   [8]  11 22 33 44 55 66 77 88

    # Cleanup
    Execute Command  ip link set can0 down
    Execute Command  pkill candump
    Execute Command  rm -f /tmp/can_log.txt
    Log    Successfully verified that communication through an invalid CAN channel (can1) was rejected.

#Test Case 7: Verify the CAN A-Core communication without CAN data: cansend can0 613#
#    [Documentation]  Send the Transmission of CAN message without data 1.cansend can0 613#
#    # Bring up the CAN interface
#    Execute Command  ip link set can0 down
#    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
#    Sleep  1s  # Ensure interface is up
#
#    # Start candump in the background properly
#    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
#    Sleep  1s  # Wait for candump to start
#
#    # Send a CAN message
#    ${output}=    Execute Command  cansend can0 613
#    Sleep  2s  # Allow time for message to be logged
#
#    ${output}=  Execute Command  cat /tmp/can_log.txt
#    Should Not Contain  ${output}  can0  613
#
#    # Cleanup
#    Execute Command  ip link set can0 down
#    Execute Command  pkill candump
#    Execute Command  rm -f /tmp/can_log.txt


#Test Case 8: Verify the CAN A-Core communucation with Transmission of 2 CAN message different ID and Same data using && logic : cansend can0 613#112233445566778899aabbcceedd112211 && cansend can0 623#555555555566778899aabbcceedd112211
#    [Documentation]  Send the Transmission of 2 CAN message different ID and Same data using && logic
#    # Bring up the CAN interface
#    Execute Command  ip link set can0 down
#    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
#    Sleep  1s  # Ensure interface is up
#
#    # Start candump in the background properly
#    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
#    Sleep  1s  # Wait for candump to start
#
#    # Send a CAN message
#    ${output}=    Execute Command  cansend can0 613#112233445566778899aabbcceedd112211 && cansend can0 623#112233445566778899aabbcceedd112211
#    Sleep  2s  # Allow time for message to be logged
#
#    ${output}=  Execute Command  cat /tmp/can_log.txt
#    Should Contain  ${output}  can0  613   [8]  11 22 33 44 55 66 77 88
#    Should Contain  ${output}  can0  623   [8]  11 22 33 44 55 66 77 88
#    # Cleanup
#    Execute Command  ip link set can0 down
#    Execute Command  pkill candump
#    Execute Command  rm -f /tmp/can_log.txt

Test Case 7: Verify that the CGM Linux OS shall send the CAN frames along with its message id and CAN type.
    [Documentation]  CGM shall support the CAN frames along with its message id and CAN type.

    # Bring up the CAN interface
    Execute Command  ip link set can0 down
    Execute Command  ip link set can0 up type can bitrate 500000 loopback on
    Sleep  1s  # Ensure interface is up

    # Start candump in the background properly
    Execute Command  nohup candump can0 > /tmp/can_log.txt 2>&1 &
    Sleep  1s  # Wait for candump to start

    # Send a CAN message
    Execute Command  cansend can0 613#112233445566778899aabbcceedd112211
    Execute Command  cansend can0 701#112233445566778899aabbcceedd112211
    Execute Command  cansend can0 204#112233445566778899aabbcceedd112211
    Execute Command  cansend can0 303#112233445566778899aabbcceedd112211
    Execute Command  cansend can0 671#112233445566778899aabbcceedd112211
    Sleep  2s  # Allow time for message to be logged

    # Read the log file and verify the message
    ${output}=  Execute Command  cat /tmp/can_log.txt
    Should Contain  ${output}  can0  613   [8]  11 22 33 44 55 66 77 88
    Should Contain  ${output}  can0  701   [8]  11 22 33 44 55 66 77 88
    Should Contain  ${output}  can0  204   [8]  11 22 33 44 55 66 77 88
    Should Contain  ${output}  can0  303   [8]  11 22 33 44 55 66 77 88
    Should Contain  ${output}  can0  671   [8]  11 22 33 44 55 66 77 88

    # Cleanup
    Execute Command  ip link set can0 down
    Execute Command  pkill candump
    Execute Command  rm -f /tmp/can_log.txt

    Log    Successfully verified that CGM Linux OS sends CAN frames with message ID and CAN type.
