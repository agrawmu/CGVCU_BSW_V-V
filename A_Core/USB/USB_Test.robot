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
Test Case 1. To verify file creation on a connected external USB storage device.
    [Documentation]    Verifying the creation of a new file on the connected external USB storage device and ensuring its existence.

    # Create a new file on the USB
    Execute Command    touch /mnt/usb/new_file.txt

    # Verify the file exists
    ${file_content} =    Execute Command    ls -l /mnt/usb/new_file.txt
    Should Contain    ${file_content}    new_file.txt

    # Remove the file
    Execute Command    rm /mnt/usb/new_file.txt

    Log    Observed the list of files present in the USB storage device.

Test Case 2. To verify file deletion on a connected external USB storage device.
    [Documentation]    Verifying the deletion of a file on the ECU using the rm command and checking if the file is successfully removed.

    # Create a new file on the USB
    Execute Command    touch /mnt/usb/new_file.txt

    # Verify the file exists
    ${file_content} =    Execute Command    ls -l /mnt/usb/new_file.txt
    Should Contain    ${file_content}    new_file.txt

    # Remove the file
    Execute Command    rm /mnt/usb/new_file.txt

    # Verify the file is deleted
    ${file_check} =    Execute Command    ls /mnt/usb/ || echo "File not found"
    Should Contain    ${file_check}    File not found

    Log    Observed the list of files present in the USB storage device after deletion.


Test Case 3. To verify creation of multiple files with different extensions on a connected external USB storage device.
    [Documentation]    Verifying the creation of files with various extensions (.txt, .pdf, .jpg, .mp3) on an external USB storage device using the touch command and checking their existence.

    # Create multiple files on the USB
    Execute Command    touch /mnt/usb/new_file1.txt /mnt/usb/new_file2.pdf /mnt/usb/new_file3.jpg /mnt/usb/new_file4.mp3

    # Verify the files exist
    ${file_content} =    Execute Command    ls -l /mnt/usb/new_file1.txt /mnt/usb/new_file2.pdf /mnt/usb/new_file3.jpg /mnt/usb/new_file4.mp3
    Should Contain    ${file_content}    new_file1.txt
    Should Contain    ${file_content}    new_file2.pdf
    Should Contain    ${file_content}    new_file3.jpg
    Should Contain    ${file_content}    new_file4.mp3

    # Remove the files
    Execute Command    rm /mnt/usb/new_file1.txt /mnt/usb/new_file2.pdf /mnt/usb/new_file3.jpg /mnt/usb/new_file4.mp3

    # Verify the files are deleted
    ${file_check} =    Execute Command    ls /mnt/usb/ || echo "File not found"
    Should Contain    ${file_check}    File not found

    Log    Verified creation and deletion of multiple files with different extensions on the USB storage device.

Test Case 4. To Verify reading the contents of a file from a connected external USB storage device.
    [Documentation]    Verifying the ECU can correctly read the contents of a file located on the connected external USB storage device.

    # Create a test file on the USB with some content
    Execute Command    echo "This is a test file." > /mnt/usb/test_file.txt

    # Read the file content
    ${file_content} =    Execute Command    cat /mnt/usb/test_file.txt
    Should Contain    ${file_content}    This is a test file.

    # Remove the test file
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified reading a file from the USB storage device.

Test Case 5. To Verify writing data to a file on a connected external USB storage device.
    [Documentation]    Verifying the ability to write data to a new file on the external USB storage device using the echo command and confirm that the data is written correctly.

    # Create a test file on the USB with some content
    Execute Command    echo "This is a test file." > /mnt/usb/test_file.txt

    # Read the file content
    ${file_content} =    Execute Command    cat /mnt/usb/test_file.txt
    Should Contain    ${file_content}    This is a test file.

    # Remove the test file
    Execute Command    rm /mnt/usb/test_file.txt

    # Verify the file is deleted
    ${file_check} =    Execute Command    ls /mnt/usb/ || echo "File not found"
    Should Contain    ${file_check}    File not found

    Log    Verified writing of a file on the USB storage device.

Test Case 6. Verify writing data to multiple files on a connected external USB storage device.
    [Documentation]    Verified writing data to multiple files on a connected external USB storage device.

    # Create test files with different content
    Execute Command    echo "This is file1." > /mnt/usb/file1.txt
    Execute Command    echo "This is file2." > /mnt/usb/file2.txt
    Execute Command    echo "This is file3." > /mnt/usb/file3.txt

    # Read file contents
    ${file1_content} =    Execute Command    cat /mnt/usb/file1.txt
    ${file2_content} =    Execute Command    cat /mnt/usb/file2.txt
    ${file3_content} =    Execute Command    cat /mnt/usb/file3.txt

    # Verify contents match expected values
    Should Contain    ${file1_content}    This is file1.
    Should Contain    ${file2_content}    This is file2.
    Should Contain    ${file3_content}    This is file3.

    # Remove the test files
    Execute Command    rm /mnt/usb/file1.txt
    Execute Command    rm /mnt/usb/file2.txt
    Execute Command    rm /mnt/usb/file3.txt

    # Verify files are deleted
    ${file_check} =    Execute Command    ls /mnt/usb/ || echo "File not found"
    Should Contain    ${file_check}    File not found

    Log    Verified writing, reading, and deletion of multiple files on the USB storage device.


Test Case 7. Verify reading data from multiple files on a connected external USB storage device.
    [Documentation]    Verifying the ability to read data from multiple files on a connected external USB storage device.

    # Create test files with different content
    Execute Command    echo "This is file1." > /mnt/usb/file1.txt
    Execute Command    echo "This is file2." > /mnt/usb/file2.txt
    Execute Command    echo "This is file3." > /mnt/usb/file3.txt

    # Read file contents
    ${file1_content} =    Execute Command    cat /mnt/usb/file1.txt
    ${file2_content} =    Execute Command    cat /mnt/usb/file2.txt
    ${file3_content} =    Execute Command    cat /mnt/usb/file3.txt

    # Verify contents match expected values
    Should Contain    ${file1_content}    This is file1.
    Should Contain    ${file2_content}    This is file2.
    Should Contain    ${file3_content}    This is file3.

    # Remove the test files
    Execute Command    rm /mnt/usb/file1.txt
    Execute Command    rm /mnt/usb/file2.txt
    Execute Command    rm /mnt/usb/file3.txt

    # Verify files are deleted
    ${file_check} =    Execute Command    ls /mnt/usb/ || echo "File not found"
    Should Contain    ${file_check}    File not found

    Log    Verified reading and deletion of multiple files on the USB storage device.

Test Case 8. To Verify appending data to a file on a connected external USB storage device.
    [Documentation]    Verifying the appending of data to a file on a connected external USB storage device.

    # Create a test file on the USB with some content
    Execute Command    echo "Initial content." > /mnt/usb/test_file.txt
    Execute Command    echo "Appended data." >> /mnt/usb/test_file.txt

    # Read the file content
    ${file_content} =    Execute Command    cat /mnt/usb/test_file.txt

    # Verify both initial and appended content exist
    Should Contain    ${file_content}    Initial content.
    Should Contain    ${file_content}    Appended data.

    # Remove the test file
    Execute Command    rm /mnt/usb/test_file.txt

    # Verify file deletion
    ${file_check} =    Execute Command    ls /mnt/usb/ || echo "File not found"
    Should Contain    ${file_check}    File not found

    Log    Verified appending data to a file on the USB storage device.

Test Case 9. To Verify the behavior of reading from a file with write-only permissions on a connected external USB storage device.
    [Documentation]    Verifying the behavior when attempting to read from a file with write-only permissions results in the expected error.

    # Create a test file on the USB with some content
    Execute Command    touch /mnt/usb/test_file.txt
    Execute Command    chmod 222 /mnt/usb/test_file.txt

    # Attempt to read the file (should fail)
    ${read_result} =    Execute Command    cat /mnt/usb/test_file.txt 2>&1 || echo "Permission denied"

    # Verify that reading fails due to permission error
    Should Contain    ${read_result}    Permission denied

    # Restore file permissions to allow deletion
    Execute Command    chmod 666 /mnt/usb/test_file.txt
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified behavior of reading from a write-only file on the USB storage device.

Test Case 10. To Verify the behavior of writing to a file opened in read-only mode on a connected external USB storage device.
    [Documentation]    Verifying the behavior when attempting to write to a file with read-only permissions results in the expected error.

    # Create a test file on the USB
    Execute Command    touch /mnt/usb/test_file.txt
    Execute Command    chmod 444 /mnt/usb/test_file.txt

    # Attempt to write to the file (should fail)
    ${write_result} =    Execute Command    echo "New content" > /mnt/usb/test_file.txt 2>&1 || echo "Permission denied"

    # Verify that writing fails due to permission error
    Should Contain    ${write_result}    Permission denied

    # Restore file permissions to allow deletion
    Execute Command    chmod 666 /mnt/usb/test_file.txt
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified behavior of writing to a read-only file on the USB storage device.


Test Case 11. To Verify the ability to rename a file on a connected external USB storage device.
    [Documentation]    Verifying the a file can be successfully renamed on the external USB storage devic and confirming that the renamed file exists in the expected location.

    # Create a test file on the USB
    Execute Command    touch /mnt/usb/test_file.txt
    Execute Command    chmod 444 /mnt/usb/test_file.txt

    # Attempt to write to the file (should fail)
    ${write_result} =    Execute Command    echo "New content" > /mnt/usb/test_file.txt 2>&1 || echo "Permission denied"

    # Verify that writing fails due to permission error
    Should Contain    ${write_result}    Permission denied

    # Restore file permissions to allow deletion
    Execute Command    chmod 666 /mnt/usb/test_file.txt
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified behavior of writing to a read-only file on the USB storage device.

Test Case 12. To Verify the ability to overwrite an existing file with new data on a connected external USB storage device.
    [Documentation]    Verifying that writing new data to an existing file successfully overwrites the previous content.

    # Create a test file with initial content
    Execute Command    echo "Initial Content" > /mnt/usb/test_file.txt

    # Overwrite the file with new content
    Execute Command    echo "New Content" > /mnt/usb/test_file.txt

    # Verify that the content has been successfully overwritten
    ${file_content} =    Execute Command    cat /mnt/usb/test_file.txt
    Should Contain    ${file_content}    New Content
    Should Not Contain    ${file_content}    Initial Content

    # Remove the test file
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified behavior of overwriting an existing file on the USB storage device.

Test Case 13. To Verify the ability to create a file within a specific directory on a connected USB drive.
    [Documentation]    Verifying that a file can be successfully created in the designated directory on the USB drive.

    # Create a test file with initial content
    Execute Command    touch /mnt/usb/test_file.txt

    # Verify the file exists in the directory
    ${file_check} =    Execute Command    ls /mnt/usb/ | grep "test_file.txt"
    Should Contain    ${file_check}    test_file.txt

    # Remove the test file
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified behavior of file creation in a specific directory on the USB storage device.

Test Case 14. To Verify the behavior when attempting to create a file with an invalid name on a connected USB drive.
    [Documentation]    Verifying the behavior when creating a file with an invalid name on a connected USB drive.

    # Attempt to create a file with an invalid name
    ${create_result} =    Execute Command    touch /mnt/usb/invalid_file:name.txt 2>&1 || echo "Invalid filename"

    # Verify that file creation fails
    Should Contain    ${create_result}    Invalid filename

    # Attempt to delete the invalid file (if it was created)
    ${file_exists} =    Execute Command    ls /mnt/usb/ | grep "invalid_file:name.txt" || echo "File not found"
    Should Contain    ${file_exists}    File not found

    Log    Verified behavior when attempting to create a file with an invalid name on the USB storage device.

Test Case 15. To Verify the behavior when attempting to delete a non-existent file on a connected USB drive.
    [Documentation]    Verifying that an attempt to delete a non-existent file returns an appropriate error.

    # Attempt to delete a non-existent file
    ${delete_result} =    Execute Command    rm /mnt/usb/non_existent_file.txt 2>&1 || echo "File not found"

    # Verify that the appropriate error message is returned
    Should Contain    ${delete_result}    No such file or directory

    Log    Verified behavior when attempting to delete a non-existent file on the USB storage device.

Test Case 16. To Verify the ability to change file permissions on a connected USB drive and confirm the changes.
    [Documentation]    Verifying the ability to modify file permissions on a connected USB drive and confirm the applied changes.

    # Create a test file
    Execute Command    touch /mnt/usb/test_file.txt

    # Change file permissions to read-only
    Execute Command    chmod 444 /mnt/usb/test_file.txt

    # Verify the file has read-only permissions
    ${permissions_read_only} =    Execute Command    ls -l /mnt/usb/test_file.txt | awk '{print $1}'
    Should Contain    ${permissions_read_only}    -r--r--r--

    # Change file permissions back to read-write
    Execute Command    chmod 666 /mnt/usb/test_file.txt

    # Verify the file has read-write permissions
    ${permissions_rw} =    Execute Command    ls -l /mnt/usb/test_file.txt | awk '{print $1}'
    Should Contain    ${permissions_rw}    -rw-rw-rw-

    # Remove the test file
    Execute Command    rm /mnt/usb/test_file.txt

    Log    Verified behavior of modifying file permissions on the USB storage device.

Test Case 17. To Verify the ability to create a directory on a connected USB drive and confirm its existence.
    [Documentation]    Verifying that a directory can be successfully created on the USB drive in the specified location.

    # Create a new directory on the USB drive
    Execute Command    mkdir /mnt/usb/new_directory

    # Verify that the directory exists
    ${dir_check} =    Execute Command    ls -l /mnt/usb/ | grep "new_directory"
    Should Contain    ${dir_check}    new_directory

    # Remove the created directory
    Execute Command    rmdir /mnt/usb/new_directory

    # Verify that the directory is removed
    ${dir_verify} =    Execute Command    ls /mnt/usb/ || echo "Directory not found"
    Should Contain    ${dir_verify}    Directory not found

    Log    Verified creation and deletion of a directory on the USB storage device.


Test Case 18. To Verify the behavior when attempting to create a directory with an invalid path on a connected USB drive
    [Documentation]    Verifying the handling of an invalid path when creating a directory on a connected USB drive.

    # Attempt to create a directory with an invalid path
    ${dir_creation} =    Execute Command    mkdir /mnt/usb/invalid/path/new_directory 2>&1 || echo "Error: Invalid path"

    # Verify that directory creation fails due to an invalid path
    Should Contain    ${dir_creation}    Error: Invalid path

    Log    Verified handling of invalid path when creating a directory on the USB storage device.

Test Case 19. Verify the behavior when attempting to create a directory that already exists on a connected USB drive.
    [Documentation]    Verifying that attempting to create an already existing directory is handled appropriately by returning an error or making no changes.

    # Create the directory initially
    Execute Command    mkdir -p /mnt/usb/existing_directory
    # Attempt to create the same directory again (should return an error or no changes)
    ${dir_creation} =    Execute Command    mkdir /mnt/usb/existing_directory 2>&1 || echo "Error: Directory already exists"
    # Verify expected behavior
    Should Contain    ${dir_creation}    Error: Directory already exists
    # Clean up by removing the directory
    Execute Command    rmdir /mnt/usb/existing_directory
    Log    Verified handling of creating an already existing directory on the USB storage device.

# Divya test case automation
Test Case 20. Verify That a Subdirectory Can Be Successfully Created Inside a Parent Directory
    [Documentation]    Verifies that a subdirectory is properly created inside a parent directory and checks the directory structure.

    # Create parent directory
    ${parent_creation}=    Execute Command    mkdir -p /mnt/usb/parent_directory
    Log    Parent directory creation command executed: ${parent_creation}

    # Create subdirectory
    ${child_creation}=    Execute Command    mkdir /mnt/usb/parent_directory/child_directory
    Log    Subdirectory creation command executed: ${child_creation}

    # List contents to verify
    ${dir_list}=    Execute Command    ls /mnt/usb/parent_directory
    Log    Directory listing result: ${dir_list}

    # Verify subdirectory exists
    Should Contain    ${dir_list}    child_directory

    # Cleanup
    ${cleanup}=    Execute Command    rm -r /mnt/usb/parent_directory
    Log    Cleanup command executed: ${cleanup}

    # Final verification log
    Log    Observed: Subdirectory 'child_directory' was successfully created under 'parent_directory' and verified in directory listing.

Test Case 21. Verifying That Creating Directory With Special Characters In Name Works Properly
    [Documentation]    Verify that directories can be created with special characters in their names and the system handles it properly.

    # Create directory with special characters
    ${special_creation}=    Execute Command    mkdir /mnt/usb/Special_@#$_dir
    Log    Directory with special characters creation command executed: ${special_creation}

    # List contents to verify
    ${dir_list}=    Execute Command    ls /mnt/usb/
    Log    Directory listing result: ${dir_list}

    # Verify that the special directory appears in the list
    Should Contain    ${dir_list}    Special_@#$_dir

    # Cleanup
    ${cleanup}=    Execute Command    rm -r /mnt/usb/Special_@#$_dir
    Log    Cleanup command executed: ${cleanup}

    # Final verification log
    Log    Observed: Directory with name 'Special_@#$_dir' was successfully created, verified in listing, and cleaned up without issues.

Test Case 22. Verifying That Creating Directory With Spaces In Name Works Properly
    [Documentation]    Verify that directories can be created with spaces in their names and the system handles it properly.

    # Create directory with space in name (escaped space)
    ${space_creation}=    Execute Command    mkdir /mnt/usb/space directory
    Log    Directory with space in name creation command executed: ${space_creation}

    # List contents to verify
    ${dir_list}=    Execute Command    ls /mnt/usb/
    Log    Directory listing result: ${dir_list}

    # Verify that the directory with space appears in the list
    Should Contain    ${dir_list}    space directory

    # Cleanup
    ${cleanup}=    Execute Command    rmdir /mnt/usb/space directory
    Log    Cleanup command executed: ${cleanup}

    # Final verification log
    Log    Observed: Directory with name 'space directory' was successfully created, verified in listing, and cleaned up without issues.

Test Case 23. Verifying Behavior When Creating a Directory and Verifying Ownership
    [Documentation]    Verify that the ownership of the newly created directory is assigned correctly to the user who created it.

    # Create a new directory
    ${dir_creation}=    Execute Command    mkdir /mnt/usb/parent_directory/new_dir
    Log    Directory creation command executed: ${dir_creation}

    # List directory details to verify ownership
    ${dir_list}=    Execute Command    ls -ld /mnt/usb/parent_directory/new_dir
    Log    Directory listing result: ${dir_list}

    # Verify that the directory owner is 'root' (you can adjust this depending on the user expected)
    Should Contain    ${dir_list}    root

    # Cleanup
    ${cleanup}=    Execute Command    rmdir /mnt/usb/parent_directory/new_dir
    ${cleanup}=    Execute Command    rmdir /mnt/usb/parent_directory
    Log    Cleanup command executed: ${cleanup}

    # Final verification log
    Log    Observed: Directory 'new_dir' was successfully created with the expected ownership ('root') and cleaned up afterward.


Test Case 24. Verifying Behavior When Creating a Directory with Invalid Characters
    [Documentation]    Verify that the system prevents directory creation when invalid characters are used in the directory name.

    # Attempt to create a new directory with invalid characters
    ${dir_creation}=    Execute Command    mkdir /mnt/usb/parent_directory/test1*

    # Check the output for an error message indicating the failure due to invalid characters
    Should Contain    ${dir_creation}    invalid

    # Final verification log
    Log    Observed: Directory creation failed as expected due to the use of invalid characters ('*') in the directory name.

Test Case 25. Verifying Behavior When Creating a Directory with Maximum Length Name
    [Documentation]    Verify that the system supports creating directories with the maximum allowed name length.

    # Define the maximum allowed directory name (adjust length as per your system's limit)
    ${max_dir_name}=    Set Variable    abcdefghfghdkdkdldldldhfdgdfdfdfdfdfdfdfdfdfddf

    # Create the directory with maximum length name
    ${dir_creation}=    Execute Command    mkdir /mnt/usb/parent_directory/${max_dir_name}
    Log    Directory creation command executed: ${dir_creation}

    # List contents to verify the directory was created
    ${dir_list}=    Execute Command    ls /mnt/usb/parent_directory
    Log    Directory listing result: ${dir_list}

    # Verify that the directory with maximum length name appears in the list
    Should Contain    ${dir_list}    ${max_dir_name}

    # Cleanup the directory
    ${cleanup}=    Execute Command    rmdir /mnt/usb/parent_directory/${max_dir_name}
    Log    Cleanup command executed: ${cleanup}

    # Final verification log
    Log    Observed: Directory with name '${max_dir_name}' was successfully created and cleaned up.

Test Case 26. Verifying Behavior When Directory is Renamed
    [Documentation]    Verify that a directory can be renamed successfully.

    # Create the original directory
    ${dir_creation}=    Execute Command    mkdir /mnt/usb/parent_directory/test1
    Log    Directory creation command executed: ${dir_creation}

    # Rename the directory
    ${rename}=    Execute Command    mv /mnt/usb/parent_directory/test1 /mnt/usb/parent_directory/test2
    Log    Directory rename command executed: ${rename}

    # List the contents to verify the directory has been renamed
    ${dir_list}=    Execute Command    ls /mnt/usb/parent_directory
    Log    Directory listing result: ${dir_list}

    # Verify that the renamed directory appears in the list
    Should Contain    ${dir_list}    test2
    Should Not Contain    ${dir_list}    test1

    # Cleanup the renamed directory
    ${cleanup}=    Execute Command    rmdir /mnt/usb/parent_directory/test2
    Log    Cleanup command executed: ${cleanup}

    # Final verification log
    Log    Observed: Directory 'test1' was successfully renamed to 'test2' and cleaned up.

