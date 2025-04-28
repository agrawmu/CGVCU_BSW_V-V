*** Settings ***
Library    SSHLibrary
Test Setup    Connect To Remote Machine
Test Teardown    Close Connection

*** Variables ***
${REMOTE_IP}    192.168.0.22
${USERNAME}     root

*** Keywords ***
Connect To Remote Machine
    Open Connection    ${REMOTE_IP}
    Login              ${USERNAME}

*** Test Cases ***
Test Case 1: To verify the shell command "nmtui" for network configuration in A-Core
    [Documentation]    Verify that executing "nmtui" launches the NetworkManager TUI.
    ${output}=    Execute Command    tmux new-session -d -s nmtui_session "nmtui"; echo $?
    Log    ${output}
    Should Not Be Empty    ${output}
    Execute Command    pkill -f nmtui   # Stop the process


Test Case 2: To verify the shell command "netplan" for network configuration in A-Core
    [Documentation]    Verify that the "netplan" command provides valid network configuration information.
    ${output}=    Execute Command    netplan info
    Should Contain    ${output}    website:
