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

1 Test Case CGMN___: Verify Docker is Installed
    [Documentation]    Checking if Docker is installed on the ECU.
	Log    verifies from SWE.1 Requriment: 
    ${output}=    Execute Command    which docker
    Should Not Be Empty    ${output}    # Ensure Docker is found in the system path
    Log    Docker is installed on the system.

2 Test Case CGMN___: Verify Docker Package Installation - docker-ce
	Log    verifies from SWE.1 Requriment: 
    [Documentation]    Verifying if the Docker CE package is installed on the ECU.
    ${output}=    Execute Command    dpkg -l | grep docker
    Should Contain    ${output}    docker-ce
    Log    Observed that the Docker CE package is installed.

3 Test Case CGMN___: Verify Docker Package Installation - python3-docker-compose
	Log    verifies from SWE.1 Requriment: 
    [Documentation]    Verifying if the Python3 Docker Compose package is installed on the ECU.
    ${output}=    Execute Command    dpkg -l | grep docker
    Should Contain    ${output}    python3-docker-compose
    Log    Observed that the Python3 Docker Compose package is installed.


4 Test Case CGMN___: Verify Docker Service is Running
    [Documentation]    Verifying if the Docker service is active and running on the ECU.
	Log    verifies from SWE.1 Requriment: 
    ${docker_status}=    Execute Command    systemctl is-active docker
    Should Be Equal As Strings    ${docker_status.strip()}    active
    Log    Observed that the Docker service is running.


5 Test Case CGMN___: Verify Pulling the "hello-world" Image from Docker Hub
    [Documentation]    Verifying the default pulling of the "hello-world" image from Docker Hub.
	Log    verifies from SWE.1 Requriment: 
    ${output}=    Execute Command    docker pull hello-world
    Should Contain    ${output}    Pulling from library/hello-world
    ${output}=    Execute Command    docker images
    Should Contain    ${output}    hello-world
    Log    Observed that Docker successfully pulled the "hello-world" image from Docker Hub.
    Execute Command    docker rmi hello-world    shell=True


6 Test Case CGMN___: Verify Running the "hello-world" Image from Docker Hub
    [Documentation]    Verifying Docker is able to run the "hello-world" image from Docker Hub.
	Log    verifies from SWE.1 Requriment: 
    ${output}=    Execute Command    docker run hello-world
    Should Contain    ${output}    Hello from Docker!
    Log    Observed that the Docker "hello-world" image ran successfully.

#4 Test Case CGMN-____: To Verify Pulling "hello-world" Image Without Network
#    [Documentation]    Verifying that pulling the "hello-world" image fails when the Ethernet connection is disconnected.
#    Log To Console    \nDisconnect the Ethernet connection and press Enter.
#    Evaluate    input('Press Enter to continue...')    # Waits for Enter press
#    Execute Command    docker pull hello-world    shell=True    stdout=stdout.txt
#    ${output}=    Get File    stdout.txt
#    Should Not Contain    ${output}    Pulling from library/hello-world
#    Log To Console    \nConnect the Ethernet connection and press Enter.
#    Evaluate    input('Press Enter to continue...')    # Waits for Enter press
#    Log    Observed the error message related to network connectivity and hello-world image not pulled from the docker hub.

7 Test Case CGMN___: Verify Pulling "hello-world" Image Without Network
    [Documentation]    Verifying that pulling the "hello-world" image fails when the Ethernet connection is disconnected.
	Log    verifies from SWE.1 Requriment: 
    # Disable networking
    Execute Command    ip link set eth0 down

    # Ensure no existing hello-world image to force a pull attempt
    Execute Command    docker rmi hello-world

    # Attempt to pull the image, and capture the output
    ${output}=    Execute Command    docker pull hello-world
    Should Not Contain    ${output}    Pulling from library/hello-world
    # Verify that an error message indicating a network issue appears in the output
    #Should Contain    ${output}    connect: network is unreachable
    #Should Contain    ${output}    Error response from daemon


    # Re-enable networking
    Execute Command    ip link set eth0 up
    # Log the observation
    Log    Observed the error message related to network connectivity and hello-world image not pulled from Docker Hub.

8 Test Case CGMN___: Verify Pushing Container Image from ECU to Docker Hub
    [Documentation]    Verifying that the ECU can successfully push a container image to Docker Hub.
	Log    verifies from SWE.1 Requriment: 
    ${login_output}=    Execute Command    docker login -u mv238 -p Matwin@63
    Should Contain    ${login_output}    Login Succeeded
    ${pull_output}=    Execute Command    docker pull hello-world
    Should Contain    ${pull_output}    Pulling from library/hello-world
    Execute Command    docker tag hello-world:latest mv238/hello-world:latest
    ${push_output}=    Execute Command    docker push mv238/hello-world:latest
    Should Contain    ${push_output}    sha256
    Log    Observed that the container image was successfully pulled, tagged, and pushed to Docker Hub.

9 Test Case CGMN___: Verify Removing a Docker Image
    [Documentation]    Verifying that a Docker image can be removed successfully.
	Log    verifies from SWE.1 Requriment: 
    Execute Command    docker pull hello-world
    ${image_list}=    Execute Command    docker images -q hello-world
    Should Not Be Empty    ${image_list}    # Ensure the image exists
    ${remove_output}=    Execute Command    docker rmi hello-world
    Should Contain    ${remove_output}    Untagged: hello-world
    ${image_list_after}=    Execute Command    docker images -q hello-world
    Should Be Empty    ${image_list_after}    # Ensure the image is removed
    Log    Observed that the Docker image was successfully removed.

10 Test Case CGMN___: Verify Docker Info Command
    [Documentation]    Verifying that Docker info command provides system details.
	Log    verifies from SWE.1 Requriment: 
    ${output}=    Execute Command    docker info
    Should Contain    ${output}    Server Version
    Should Contain    ${output}    Storage Driver
    Log    Observed that Docker info command successfully returned system details.

11 Test Case CGMN___: Verify Listing All Docker Images
    [Documentation]    Verifying that Docker can list available images.
	Log    verifies from SWE.1 Requriment: 
    ${output}=    Execute Command    docker images
    Should Contain    ${output}    REPOSITORY
    Should Contain    ${output}    TAG
    Log    Observed that Docker successfully listed available images.

12 Test Case CGMN___: Verify Listing Running Containers
    [Documentation]    Verifying that Docker can list running containers.
	Log    verifies from SWE.1 Requriment: 
    ${output}=    Execute Command    docker ps
    Should Contain    ${output}    CONTAINER ID
    Should Contain    ${output}    IMAGE
    Log    Observed that Docker successfully listed running containers.

13 Test Case CGMN___: Verify Stopping a Running Docker Container
    [Documentation]    Verifying that a running Docker container can be stopped.
	Log    verifies from SWE.1 Requriment: 	
    ${container_id}=    Execute Command    docker run -d hello-world
    Should Not Be Empty    ${container_id}    # Ensure container is running
    Execute Command    docker stop ${container_id}
    ${output}=    Execute Command    docker ps -q -f id=${container_id}
    Should Be Empty    ${output}    # Ensure container is stopped
    Log    Observed that the container was successfully stopped.

14 Test Case CGMN___: Verify Restarting Docker Service
    [Documentation]    Verifying that the Docker service can be restarted.
	Log    verifies from SWE.1 Requriment: 	
    Execute Command    systemctl restart docker
    ${status}=    Execute Command    systemctl is-active docker
    Should Be Equal As Strings    ${status.strip()}    active
    Log    Observed that the Docker service restarted successfully.

15 Test Case CGMN___: Verify Docker Help Command
    [Documentation]    Checking if Docker help command is accessible.
	Log    verifies from SWE.1 Requriment: 	
    ${output}=    Execute Command    docker --help
    Should Contain    ${output}    Usage:
    Log    Observed that Docker help command executed successfully.