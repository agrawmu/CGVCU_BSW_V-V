*** Settings ***
Library    SSHLibrary
Test Setup    Connect To Remote Machine
Test Teardown    Close Connection
Library    OperatingSystem
Library    Collections

*** Variables ***
${REMOTE_IP}    192.168.0.22
${USERNAME}     root

*** Keywords ***
Connect To Remote Machine
    Open Connection    ${REMOTE_IP}
    Login              ${USERNAME}

*** Test Cases ***

Test Case 1. Verify the functionality of the API that lists files in SSD
    [Documentation]    Verifying the API retrieves a list of files and directories in SSD
    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API: ${file_content}
    Should Contain    ${file_content}    directory_tree
    Log    Successfully retrieved the list of files in SSD

Test Case 2. Verify the functionality of the API that writes a file in SSD
    [Documentation]    Verifying the API can successfully create and write a file in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Validation team validate the functionalities of the release modules and can''t validate the not implemented modules "}'
    Log    Response from API (Write): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List): ${file_content}
    Should Contain    ${file_content}    Validation.txt

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Delete): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully created, validated, and deleted the file in SSD

Test Case 3. Verify the functionality of the API that reads data from a written file in SSD
    [Documentation]    Verifying the API can successfully read the data from a written file in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    Response from API (Write): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/read -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Read): ${file_content}
    Should Contain    ${file_content}    "data":"Hello, World!"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Delete): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully wrote, read, and deleted the file in SSD

Test Case 4. Verify the functionality of the API that creates a new directory in SSD
    [Documentation]    Verifying the API can successfully create a new directory in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/create_directory -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Create Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List After Creation): ${file_content}
    Should Contain    ${file_content}    new_directory_SSD

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Delete Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List After Deletion): ${file_content}
    Should Not Contain    ${file_content}    new_directory_SSD

    Log    Successfully created and deleted the directory in SSD

Test Case 5. Verify the functionality of the API that writes a file in a new directory in SSD
    [Documentation]    Verifying the API can successfully create and write a file in a new directory in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/create_directory -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Create Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test.txt", "data": "Hello, how's your day!"}'
    Log    Response from API (Write File): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List Files): ${file_content}
    Should Contain    ${file_content}    Test.txt

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt"}'
    Log    Response from API (Delete File): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List After Deletion): ${file_content}
    Should Contain    ${file_content}    directory_tree

    Log    Successfully created, wrote, and deleted the file in a new directory in SSD

Test Case 6. Verify the functionality of the API that reads data from a written file in a new directory in SSD
    [Documentation]    Verifying the API can successfully read the data from a written file in a new directory in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/create_directory -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Create Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt", "data": "Hello, World!"}'
    Log    Response from API (Write File): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/read -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt"}'
    Log    Response from API (Read File): ${file_content}
    Should Contain    ${file_content}    "data":"Hello, World!"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt"}'
    Log    Response from API (Delete File): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List After Deletion): ${file_content}
    Should Contain    ${file_content}    directory_tree

    Log    Successfully wrote, read, and deleted the file in the new directory in SSD

Test Case 7. Verify the functionality of the API that deletes a file in SSD
    [Documentation]    Verifying the API can successfully delete a file in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/create_directory -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Create Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt", "data": "Hello, World!"}'
    Log    Response from API (Write File): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List Files): ${file_content}
    Should Contain    ${file_content}    directory_tree

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt"}'
    Log    Response from API (Delete File): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List After Deletion): ${file_content}
    Should Contain    ${file_content}    directory_tree

    Log    Successfully deleted the selected file in SSD

Test Case 8. Verify the functionality of the API that deletes a directory in SSD
    [Documentation]    Verifying the API can successfully delete a directory in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/create_directory -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Create Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List Directories): ${file_content}
    Should Contain    ${file_content}    directory_tree

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    Response from API (Delete Directory): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List After Deletion): ${file_content}
    Should Contain    ${file_content}    directory_tree

    Log    Successfully deleted the selected directory in SSD

Test Case 9. Verify the functionality of the API that storage status of SSD
    [Documentation]    Verifying the API can successfully show total, used, and remaining space of SSD
    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/status
    Log    Response from API (Storage Status): ${file_content}

    Should Contain    ${file_content}    "free_space"
    Should Contain    ${file_content}    "total_space"
    Should Contain    ${file_content}    "used_space"
    Log    Successfully retrieved SSD storage status

Test Case 10. Verify the functionality of the API that secure write file in SSD
    [Documentation]    Verifying the API can successfully create a secure write file in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/encrypt_write -H "Content-Type: application/json" -d '{"path": "secure.txt", "data": "Secret Message"}'
    Log    Response from API (Secure Write File): ${file_content}

    Should Contain    ${file_content}    "message":"File written successfully (encrypted)"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    Response from API (List Files): ${file_content}

    Should Contain    ${file_content}    secure.txt

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "secure.txt"}'
    Log    Response from API (Delete Secure File): ${file_content}

    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully wrote and deleted a secure file in SSD

Test Case 11. Verify the functionality of the API that reads data from a secure file in SSD
    [Documentation]    Verifying the API can successfully read secure data from a secure file in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/encrypt_write -H "Content-Type: application/json" -d '{"path": "secure.txt", "data": "Secret Message"}'
    Log    Response from API (Secure Write File): ${file_content}

    Should Contain    ${file_content}    "message":"File written successfully (encrypted)"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/decrypt_read -H "Content-Type: application/json" -d '{"path": "secure.txt"}'
    Log    Response from API (Decrypt Read File): ${file_content}

    Should Contain    ${file_content}    "data":"Secret Message"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "secure.txt"}'
    Log    Response from API (Delete Secure File): ${file_content}

    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully read and deleted a secure file in SSD

Test Case 12. Verify the functionality of the API that Logs events
    [Documentation]    Verifying the API can successfully log events in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/log_event -H "Content-Type: application/json" -d '{"message": "Sample log message"}'
    Log    Response from API (Log Event): ${file_content}

    Should Contain    ${file_content}    "message":"Event logged successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/read_logs
    Log    Response from API (Read Logs): ${file_content}

    Should Contain    ${file_content}    logs

    Log    Successfully observed the log records stored in SSD

Test Case 13. Verify the functionality of the API that sets access control for write in SSD
    [Documentation]    Verifying the API enforces write-only access for files in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    Response from API (Write File): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "write"}'
    Log    Response from API (Set Access Control): ${file_content}
    Should Contain    ${file_content}    "message":"Access control for Validation.txt set to write"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/check_access_control?path=Validation.txt
    Log    Response from API (Check Access Control): ${file_content}
    Should Contain    ${file_content}    "access_control":"write","path":"Validation.txt"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Delete File): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully verified write-only access for file in SSD

Test Case 14. Verify the functionality of the API that sets access control for read in SSD
    [Documentation]    Verifying the API enforces read-only access for files in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    Response from API (Write File): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "read"}'
    Log    Response from API (Set Access Control): ${file_content}
    Should Contain    ${file_content}    "message":"Access control for Validation.txt set to read"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/check_access_control?path=Validation.txt
    Log    Response from API (Check Access Control): ${file_content}
    Should Contain    ${file_content}    "access_control":"read","path":"Validation.txt"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "write"}'
    Log    Response from API (Set Access Control): ${file_content}
    Should Contain    ${file_content}    "message":"Access control for Validation.txt set to write"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Delete File): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully verified read-only access for file in SSD

Test Case 15. Verify the functionality of the API that restricts reading a file when write access is set
    [Documentation]    Verifying that a file cannot be read when it has write-only access in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    Response from API (Write File): ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "write"}'
    Log    Response from API (Set Access Control): ${file_content}
    Should Contain    ${file_content}    "message":"Access control for Validation.txt set to write"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/check_access_control?path=Validation.txt
    Log    Response from API (Check Access Control): ${file_content}
    Should Contain    ${file_content}    "access_control":"write","path":"Validation.txt"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/read -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Attempt Read File): ${file_content}
    Should Contain    ${file_content}    "Access denied"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    Response from API (Delete File): ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Successfully verified that a file with write-only access cannot be read

Test Case 16. Verify the functionality of the API that Access control for read and try to write in SSD
    [Documentation]    Verifying the file API's cannot access write operation while having read access in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "read"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"Access control for Validation.txt set to read"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/check_access_control?path=Validation.txt
    Log    ${file_content}
    Should Contain    ${file_content}    "access_control":"read","path":"Validation.txt"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Should Contain    ${file_content}    Access denied

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "write"}'
    Log    ${file_content}
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/set_access_control -H "Content-Type: application/json" -d '{"path": "Validation.txt", "access_level": "write"}'
    Log    Response from API (Set Access Control): ${file_content}
    Should Contain    ${file_content}    "message":"Access control for Validation.txt set to write"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "Validation.txt"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Observed the file is not written while giving a read access control


Test Case 17. Verify the functionality of the API that SSD Format
    [Documentation]    Verifying the API's can successfully format all created files in SSD
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/create_directory -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/write -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    ${file_content}
    Should Contain    ${file_content}    directory_tree

    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/format
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"SSD formatted successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    ${file_content}
    Should Contain    ${file_content}    directory_tree

    Log    Observed the SSD data is formatted


Test Case 18. Verify the functionality of the API that create multiple directories in SSD
    [Documentation]    Verifying the API's can successfully create multiple new directories in SSD
    ${file_content_1}=    Execute Command    curl -X POST "http://localhost/ssd/create_directory" -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    Log    ${file_content_1}
    Should Contain    ${file_content_1}    "message":"Directory created successfully"

    ${file_content_2}=    Execute Command    curl -X POST "http://localhost/ssd/create_directory" -H "Content-Type: application/json" -d '{"path": "new_directory_SSD1"}'
    Log    ${file_content_2}
    Should Contain    ${file_content_2}    "message":"Directory created successfully"

    ${file_content_3}=    Execute Command    curl -X POST "http://localhost/ssd/create_directory" -H "Content-Type: application/json" -d '{"path": "new_directory_SSD2"}'
    Log    ${file_content_3}
    Should Contain    ${file_content_3}    "message":"Directory created successfully"

    ${file_content_4}=    Execute Command    curl -X POST "http://localhost/ssd/create_directory" -H "Content-Type: application/json" -d '{"path": "new_directory_SSD3"}'
    Log    ${file_content_4}
    Should Contain    ${file_content_4}    "message":"Directory created successfully"

    ${file_content_5}=    Execute Command    curl -X POST "http://localhost/ssd/create_directory" -H "Content-Type: application/json" -d '{"path": "new_directory_SSD4"}'
    Log    ${file_content_5}
    Should Contain    ${file_content_5}    "message":"Directory created successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    ${file_content}
    Should Contain    ${file_content}    new_directory_SSD
    Should Contain    ${file_content}    new_directory_SSD1
    Should Contain    ${file_content}    new_directory_SSD2
    Should Contain    ${file_content}    new_directory_SSD3
    Should Contain    ${file_content}    new_directory_SSD4
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD"}'
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD1"}'
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD2"}'
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD3"}'
    ${file_content}=    Execute Command    curl -X POST http://localhost/ssd/delete -H "Content-Type: application/json" -d '{"path": "new_directory_SSD4"}'


    Log    Observed the new directories created in SSD

Test Case 19. Verify the functionality of the API that write same file multiple times in SSD
    [Documentation]    Verifying the API's can successfully write the file multiple times for same name in SSD
    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/write" -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/write" -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Plan for SSD Test"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X GET http://localhost/ssd/list
    Log    ${file_content}
    Should Contain    ${file_content}    Validation.txt

    Log    Observed the write file created in SSD

Test Case 20. Verify the functionality of the API that writes multiple times to the same file in SSD
    [Documentation]    Verifying the API can successfully write data multiple times in the same file in SSD

    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/write" -H "Content-Type: application/json" -d '{"path": "Validation1.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/write" -H "Content-Type: application/json" -d '{"path": "Validation1.txt", "data": "Plan for SSD Test"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"File written successfully"

    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/read" -H "Content-Type: application/json" -d '{"path": "Validation1.txt"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "data":"Hello, World!Plan for SSD Test"

    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/delete" -H "Content-Type: application/json" -d '{"path": "Validation1.txt"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "message":"Deletion successful"

    Log    Observed the data should be added

Test Case 21. Verify the functionality of the API that deletes an unknown file in SSD
    [Documentation]    Verifying the API does not successfully delete an unknown file in SSD

    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/delete" -H "Content-Type: application/json" -d '{"path": "new_directory_SSD/Test1.txt"}'
    Log    ${file_content}
    Should Contain    ${file_content}    "File or directory not found"

    Log    Observed no such file


Test Case 22. Verify the functionality of the API that writes a file after removing SSD
    [Documentation]    Verifying the API does not allow writing a file when SSD is removed

#    Execute Command    umount /dev/nvme0n1 /mnt/ssd
#    Log    SSD unmounted
    Log To Console    Remove ssd from the mother board and press enter
    ${user_verification}=    Evaluate    input("Press enter ")
    ${file_content}=    Execute Command    curl -X POST "http://localhost/ssd/write" -H "Content-Type: application/json" -d '{"path": "Validation.txt", "data": "Hello, World!"}'
    Log    ${file_content}
    Run Keyword And Continue On Failure    Should Contain    error
    Should Not Contain    ${file_content}    File written successfully


#    Execute Command    mount /dev/nvme0n1 /mnt/ssd
#    Log    SSD remounted

    Log    Observed error while writing file when SSD was removed


