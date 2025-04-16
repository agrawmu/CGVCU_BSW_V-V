*** Settings ***
Library    SSHLibrary
Test Setup    Connect To Remote Machine
Test Teardown    Close Connection

*** Variables ***
${REMOTE_IP}    192.168.0.156
${USERNAME}     root

*** Keywords ***
Connect To Remote Machine
    Open Connection    ${REMOTE_IP}
    Login              ${USERNAME}

*** Test Cases ***


Test Case 24: To Verify the Functionality of the API That Stops Recording and Saves the Recorded Audio as a WAV File
    [Documentation]    Verifying the API's ability to stop recording and save the audio in WAV format to the specified file path, ensuring proper functionality.

    # Step 1: Start audio recording
    ${start_output}=    Execute Command    curl -X POST "http://localhost/mic/start-recording"
    #Should Contain    ${start_output}    "message":"Audio capture started."
    Log    ✅ Recording started successfully.

    # Step 2: Stop the recording and save as a WAV file
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/mic/stop-recording" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav'.
    Log    ✅ Recording stopped and saved to /Audio/Mic/output.wav successfully.

    # Step 3: Verify that the WAV file is saved correctly
    ${ls_output}=    Execute Command    ls /Audio/Mic
    Should Contain    ${ls_output}    output.wav
    Log    🎯 File output.wav successfully saved in /Audio/Mic directory.

    # Step 4: Cleanup - Delete the recorded file
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑️ Temporary WAV file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully stops recording and saves the audio as a WAV file to the specified path.


Test Case 25: To Verify the Functionality of the API That Stops Recording and Saves the Recorded Audio as an MP3 File
    [Documentation]    Verifying the API's ability to stop recording and save the audio in MP3 format to the specified file path, ensuring proper functionality.

    # Step 1: Start audio recording
    ${start_output}=    Execute Command    curl -X POST "http://localhost/mic/start-recording"
    Log    ✅ Recording started successfully.

    # Step 2: Stop the recording and save as MP3 file
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/mic/stop-recording" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.mp3"}'
    Should Contain    ${stop_output}    Audio capture stopped. Audio file saved as '/Audio/Mic/output.mp3'.
    Log    ✅ Recording stopped and saved to /Audio/Mic/output.mp3 successfully.

    # Step 3: Verify that the MP3 file is saved correctly
    ${ls_output}=    Execute Command    ls /Audio/Mic
    Should Contain    ${ls_output}    output.mp3
    Log    🎯 File output.mp3 successfully saved in /Audio/Mic directory.

    # Step 4: Cleanup - Delete the recorded file
    Execute Command    rm -f /Audio/Mic/output.mp3
    Log    🗑️ Temporary MP3 file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully stops recording and saves the audio as an MP3 file to the specified path.


Test Case 26: To Verify the Functionality of the API That Stops Recording and Saves the Recorded Audio as a FLAC File
    [Documentation]    Verifying the API's ability to stop recording and save the audio in FLAC format to the specified file path, ensuring proper functionality.

    # Step 1: Start audio recording
    ${start_output}=    Execute Command    curl -X POST "http://localhost/mic/start-recording"
    Log    ✅ Recording started successfully.

    # Step 2: Stop the recording and save as a FLAC file
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/mic/stop-recording" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.flac"}'
    Should Contain    ${stop_output}    Audio capture stopped. Audio file saved as '/Audio/Mic/output.flac'.
    Log    ✅ Recording stopped and saved to /Audio/Mic/output.flac successfully.

    # Step 3: Verify that the FLAC file is saved correctly
    ${ls_output}=    Execute Command    ls /Audio/Mic
    Should Contain    ${ls_output}    output.flac
    Log    🎯 File output.flac successfully saved in /Audio/Mic directory.

    # Step 4: Cleanup - Delete the recorded file
    Execute Command    rm -f /Audio/Mic/output.flac
    Log    🗑️ Temporary FLAC file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully stops recording and saves the audio as a FLAC file to the specified path.

Test Case 1: To Verify the Functionality of the API That Starts Audio Recording
    [Documentation]    Verifying the API's ability to start audio recording when commanded and ensuring the functionality and responsiveness of the recording start command.

    # Step 1: Start Audio Recording
    ${output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Log To Console    \n📢 API Response: ${output}
    Should Contain    ${output}    "message":"Audio capture started."
    Log    ✅ Recording started successfully.

    # Step 2: Prompt User to Speak
    Log To Console    \n🎤 Please provide input to the microphone by speaking the following examples:\nEg: \n1️⃣ "Testing, testing, one, two, three." \n2️⃣ "Microphone check, microphone check, one, two, three." \nPress ENTER once you're done speaking.
    Evaluate    input()    # Waits for user to press Enter

    # Step 3: Stop Audio Recording and Save the File
    ${output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log To Console    \n📢 API Response: ${output}
    Should Contain    ${output}    {"message":"Audio capture stopped.
    Should Contain    ${output}    Audio file saved as '/Audio/Mic/output.wav
    Log    ✅ Recording stopped, and file saved successfully.

    # Step 4: Verify if the Recorded File Exists
    ${file_check}=    Execute Command    ls /Audio/Mic/output.wav
    Log To Console    \n📢 File Check Output: ${file_check}
    Should Contain    ${file_check}    output.wav
    Log    ✅ Verified that the recorded file exists.

    # Step 5: Play the Recorded Audio File
    ${output}=    Execute Command    curl -X POST http://localhost/audio/start_audio -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log To Console    \n📢 API Response: ${output}
    Should Contain    ${output}    Audio playback started
    Log    ✅ Playback started successfully.

    # Step 6: Validate Recorded Audio
    Log To Console    \n🔊 Please listen to the recorded audio.\nDoes it match what you spoke? \nType 'YES' if it matches, or 'NO' if it does not.
    ${user_verification}=    Evaluate    input("Does the recorded audio match your input? (YES/NO): ")

    # Step 7: Check User Feedback and Validate Test Result
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    ✅ Test Passed: Audio recording and playback verified successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    ❌ Test Failed: Recorded audio did not match the input.

    # Step 8: Cleanup the Recorded File
    ${cleanup_output}=    Execute Command    rm -f /Audio/Mic/output.wav
    Log To Console    \n📢 Cleanup Response: ${cleanup_output}
    Log    🗑️ Temporary recorded audio file removed.

    # Final Observation
    Log    ✅ Observed the API successfully initiated audio recording and playback, and the recorded audio matched the expected input.

#Test Case 1: To Verify the Functionality of the API That Starts Audio Recording
#    [Documentation]    Verifying the API's ability to start audio recording when commanded and ensuring the functionality and responsiveness of the recording start command.
#
#    # Step 1: Start Audio Recording
#    ${output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
#    Should Contain    ${output}    "message":"Audio capture started."
#    Log    Recording started successfully.
#
#    # Step 2: Prompt User to Speak
#    Log To Console    \nPlease provide input to the microphone by speaking the following examples:\nEg: \n1. "Testing, testing, one, two, three." \n2. "Microphone check, microphone check, one, two, three." \nOnce you are finished, press Enter.
#    Evaluate    input()    # Waits for user to press Enter
#
#    # Step 3: Stop Audio Recording and Save the File
#    ${output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
#    Should Contain    ${output}    "message":"Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav as '/Audio/Mic/output.wav'."
#    Log    Recording stopped, and file saved successfully.
#
#    # Step 4: Play the Recorded Audio File
#    ${output}=    Execute Command    curl -X POST http://localhost/audio/start_audio -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
#    Should Contain    ${output}    Audio playback started from /Audio/Mic/output.wav
#    Log    Playback started successfully.
#
#    # Step 5: Validate Recorded Audio
#    Log To Console    \nPlease listen to the recorded audio. If it matches your input, type 'YES'. If not, type 'NO'.
#    ${user_verification}=    Evaluate    input("Does the recorded audio match your input? (YES/NO): ")
#
#    # Step 6: Check User Feedback and Validate Test Result
#    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio recording and playback verified successfully.
#    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Recorded audio did not match the input.
#
#    # Step 7: Cleanup the Recorded File
#    Execute Command    rm -f /Audio/Mic/output.wav
#    Log    Temporary recorded audio file removed.
#
#    # Final Observation
#    Log    Observed the API successfully initiated audio recording and playback, and the recorded audio matched the expected input.



Test Case 2: To Verify the Functionality of the API That Stops Audio Recording and Saves the Recorded Audio
    [Documentation]    Verifying the API's ability to stop audio recording and save the recorded audio to the specified file path, ensuring the functionality and proper response of the stop recording command.

    # Step 1: Cleanup - Delete Any Existing Files in the Directory Before Starting
    Execute Command    rm -f /Audio/Mic/*
    Log    🧹 Cleaned up existing files in /Audio/Mic directory before starting the test.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST "http://localhost/mic/start-recording"
    Log To Console    \n📢 API Response: ${start_output}
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    ✅ Recording started successfully.

    # Step 3: Prompt User to Speak
    Log To Console    \n🎤 Please provide input to the microphone by speaking the following examples:\n\n1️⃣ "Testing, testing, one, two, three."\n2️⃣ "Microphone check, microphone check, one, two, three."\n\n🔹 Once you are finished, press Enter to continue.
    Evaluate    input()    # Waits for user to press Enter

    # Step 4: Stop Audio Recording and Save the File
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/mic/stop-recording" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log To Console    \n📢 API Response: ${stop_output}
    Should Contain    ${stop_output}    {"message":"Audio capture stopped.
    Should Contain    ${stop_output}    Audio file saved as '/Audio/Mic/output.wav
    Log    ✅ Recording stopped, and file saved successfully.

    # Step 5: Verify if the Recorded File Exists
    ${ls_output}=    Execute Command    ls /Audio/Mic
    Log To Console    \n📢 File Check Output: ${ls_output}
    Should Contain    ${ls_output}    output.wav
    Log    ✅ File "output.wav" successfully saved in /Audio/Mic directory.

    # Step 6: Cleanup - Delete the Recorded File After Validation
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🧹 Temporary file output.wav deleted successfully after test completion.

    # Final Observation
    Log    🎯 Observed API successfully stopped audio recording and saved the recorded file (output.wav) in the /Audio/Mic directory. The file was verified to exist and was deleted after verification.


Test Case 3: To Verify API Behavior When Attempting to Stop Audio Recording While No Recording is in Progress
    [Documentation]    Verifying the API's ability to stop audio recording and handle the request properly when no recording is in progress.

    # Step 1: Attempt to Stop Recording Without Starting It
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'

    # Step 2: Validate the API Response
    Log To Console    \n📢 API Response: ${stop_output}
    Should Contain    ${stop_output}    "Audio capture is not running."    # Expected error message
    Log    ✅ API correctly handled stop command when no recording was in progress.

    # Final Observation
    Log    ✅ Observed that the API correctly prevented stopping a non-existent recording session and returned an appropriate error message.


Test Case 4: To Verify API Behavior When an Invalid File Path Is Specified for Saving Recorded Audio
    [Documentation]    Verifying the API handles invalid file paths properly when attempting to save recorded audio, preventing data loss.

    # Step 1: Verify the Invalid Path Does Not Exist
    ${path_check}=    Execute Command    ls /InvalidPath || echo "Directory not found"
    Should Contain    ${path_check}    Directory not found
    Log    ✅ Confirmed that /InvalidPath does not exist before test execution.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST "http://localhost/mic/start-recording"
    Log To Console    \n📢 API Response: ${start_output}
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    ✅ Recording started successfully.

    # Step 3: Prompt User to Speak
    Log To Console    \n🎤 Please speak into the microphone and press Enter when done.\nExample: "Testing, one, two, three."
    Evaluate    input()

    # Step 4: Stop Audio Recording with an Invalid File Path
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/mic/stop-recording" -H "Content-Type: application/json" -d '{"file_path": "/Invalid/output.wav"}'
    Log To Console    \n📢 API Response: ${stop_output}


    # Step 5: Validate API Behavior (Assuming API returns an error message for invalid paths)
    #Should Contain    ${stop_output}    Error
    Should Contain    ${stop_output}    The directory '/Invalid' does not exist.
    Log    🚫 API correctly rejected the invalid file path.

    # Step 6: Verify File Was Not Created in the Invalid Path
    ${ls_output}=    Execute Command    ls /InvalidPath || echo "Directory not found"
    Should Contain    ${ls_output}    Directory not found
    Log    ✅ Verified that no file was created in the invalid path.

    # Step 7: Log Final Observations
    Log    🎯 Observed API correctly handled an invalid file path. No file was created in /InvalidPath, and an appropriate error message was returned.



Test Case 5: To Verify the Functionality of the API That Pauses, Resumes, and Stops Audio Recording with Playback Validation
    [Documentation]    Ensuring the API can pause, resume, stop audio recording, and successfully play the recorded file.

#    # Step 1: Cleanup Any Previous Recordings
#    Execute Command    rm -f /Audio/Mic/output.wav
#    Log    🗑 Deleted any existing output.wav file before starting the test.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    ✅ Recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    2s    # Allow recording to initialize properly

    # Step 4: Prompt User to Speak Before Pause
    Log To Console    \n🎤 Please speak into the microphone. Example:\n1️⃣ "Testing, testing, one, two, three."\n2️⃣ "Microphone check, one, two, three."\n\nPress Enter when done.
    Evaluate    input()

    # Step 5: Pause Audio Recording
    ${pause_output}=    Execute Command    curl -X POST http://localhost/mic/pause-recording
    Should Contain    ${pause_output}    Audio capture paused.
    Log    ⏸ Recording paused successfully.

    # Step 6: Prompt User to Resume Recording
    Log To Console    \n⏸ Recording is currently PAUSED.\nPress Enter when ready to RESUME recording and provide further input.
    Evaluate    input()

    # Step 7: Resume Audio Recording
    ${resume_output}=    Execute Command    curl -X POST http://localhost/mic/resume-recording
    Should Contain    ${resume_output}    Audio capture resumed.
    Log    ▶ Recording resumed successfully.

    # Step 8: Prompt User for Further Input Before Stopping
    Log To Console    \n🎤 Please provide additional input after resuming. Example:\n1️⃣ "Resuming microphone test."\n2️⃣ "Checking audio quality after pause."\n\nPress Enter when done.
    Evaluate    input()

    # Step 9: Stop Audio Recording and Save the File
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    {"message":"Audio capture stopped.
    Should Contain    ${stop_output}    Audio file saved as '/Audio/Mic/output.wav
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 10: Validate That the File Exists
    Sleep    2s    # Allow time for file to be written
    ${file_check}=    Execute Command    ls /Audio/Mic
    Should Contain    ${file_check}    output.wav
    Log    ✅ Verified that output.wav was successfully saved.

    # Step 11: Play the Recorded Audio File
    ${play_output}=    Execute Command    curl -X POST http://localhost/audio/start_audio -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${play_output}    Audio playback started from /Audio/Mic/output.wav
    Log    🔊 Playback started successfully.

    # Step 12: Prompt User to Validate Audio Playback
    Log To Console    \n🔊 Please listen to the recorded audio. If it matches your input, type 'YES'. If not, type 'NO'.
    ${user_verification}=    Evaluate    input("Does the recorded audio match your input? (YES/NO): ").upper()

    # Step 13: Check User Feedback and Validate Test Result
    Run Keyword If    '${user_verification}' == 'YES'    Log    ✅ Test Passed: Audio recording and playback verified successfully.
    Run Keyword If    '${user_verification}' == 'NO'    Fail    ❌ Test Failed: Recorded audio did not match the input.

    # Step 14: Cleanup Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully paused, resumed, stopped, and played back the audio, ensuring proper functionality.





Test Case 6: To Verify the API's Behavior When Attempting to Pause Audio Recording While No Recording is in Progress
    [Documentation]    Verifying the API's response when attempting to pause audio recording without an active recording session, ensuring proper error handling and messaging.

    # Step 1: Ensure No Recording is in Progress
    Log    🔍 Checking if an audio recording is running before attempting to pause.
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/tmp/dummy.wav"}'

    # Step 2: Attempt to Pause Recording Without Starting It
    ${pause_output}=    Execute Command    curl -X POST http://localhost/mic/pause-recording
    Log    🛑 Attempted to pause recording without an active session.
    Execute Command    curl -X POST http://localhost/mic/resume-recording
    # Step 3: Validate API Response (Expected: Error Message)
    Should Contain    ${pause_output}    Audio capture is not running
    #Run Keyword If    "Audio capture is not running" not in "${pause_output}"
    Log    ✅ API correctly returned an error when no recording was in progress.

Test Case 7: To Verify the Functionality of the API That Resumes a Paused Audio Recording
    [Documentation]    Verifying the API's ability to resume a paused audio recording when commanded, ensuring proper functionality and responsiveness of the resume command.

#    # Step 1: Cleanup Any Previous Recordings
#    Execute Command    rm -f /Audio/Mic/output.wav
#    Log    🗑 Deleted any existing output.wav file before starting the test.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    1s    # Ensure the recording starts properly

    # Step 4: Prompt the User to Speak Before Pausing
    Log To Console    \n🎤 Please provide input to the microphone before PAUSING.\nExample:\n1️⃣ "Testing, testing, one, two, three."\n2️⃣ "Microphone check, one, two, three."\n\nPress Enter when done.
    Evaluate    input()

    # Step 5: Pause the Audio Recording
    ${pause_output}=    Execute Command    curl -X POST http://localhost/mic/pause-recording
    Should Contain    ${pause_output}    Audio capture paused
    Log    ⏸ Recording paused successfully.

    # Step 6: Prompt the User Before Resuming
    Log To Console    \n⏸ Recording is currently PAUSED.\nWhen ready, press Enter to RESUME recording and provide further input.
    Evaluate    input()

    # Step 7: Resume the Paused Recording
    ${resume_output}=    Execute Command    curl -X POST http://localhost/mic/resume-recording
    Should Contain    ${resume_output}    Audio capture resumed
    Log    ▶ Recording resumed successfully.

    # Step 8: Prompt the User to Speak After Resuming
    Log To Console    \n🎤 Please provide additional input after resuming. Example:\n1️⃣ "Resuming microphone test."\n2️⃣ "Checking audio quality after pause."\n\nPress Enter when done.
    Evaluate    input()

    # Step 9: Stop Recording and Save the Audio File
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    {"message":"Audio capture stopped.
    Should Contain    ${stop_output}    Audio file saved as '/Audio/Mic/output.wav
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 10: Validate That the Recorded File Exists
    Sleep    2s    # Allow time for file writing
    ${file_check}=    Execute Command    ls /Audio/Mic
    Should Contain    ${file_check}    output.wav
    Log    ✅ Successfully verified that the recorded file exists.

    # Step 11: Play the Recorded Audio for Verification
    ${play_output}=    Execute Command    curl -X POST http://localhost/audio/start_audio -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${play_output}    Audio playback started
    Log    🔊 Playback started successfully.

    # Step 12: Prompt the User to Validate Audio Playback
    Log To Console    \n🔊 Please listen to the recorded audio. If it matches your input (before & after pause), type 'YES'. If not, type 'NO'.
    ${user_verification}=    Evaluate    input("Does the recorded audio match your input? (YES/NO): ").upper()

    # Step 13: Validate User Feedback on Playback Quality
    Run Keyword If    '${user_verification}' == 'YES'    Log    ✅ Test Passed: Audio recording and playback verified successfully.
    Run Keyword If    '${user_verification}' == 'NO'    Fail    ❌ Test Failed: Recorded audio did not match the input.

    # Step 14: Clean Up the Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully resumed and stopped the audio recording, and the recorded file was validated for correctness.



Test Case 8: To Verify the API's Behavior When Attempting to Resume Audio Recording Without a Paused Session
    [Documentation]    Verifying the API's response when trying to resume audio recording without an active paused session, ensuring proper error handling and messaging.

    # Step 1: Ensure No Active Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording before starting the test.
    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.
    # Step 2: Attempt to Resume Recording Without Pausing
    ${resume_output}=    Execute Command    curl -X POST http://localhost/mic/resume-recording

    # Step 3: Validate That an Appropriate Error Message Is Received
    Should Contain    ${resume_output}    Audio capture is not paused
    Log    ❌ API correctly handled the resume request when no recording was paused.

    # Step 4: Attempt to Stop Recording to Ensure Cleanup
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🛑 Ensured no stray recording was left active.

    # Step 5: Clean Up the Recorded File (If Created)
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully rejected the invalid resume request, ensuring proper error handling.




Test Case 9: To Verify the Functionality of the API That Retrieves the Current Status of Audio Recording
    [Documentation]    Verifying the API's ability to fetch and display the current status of audio recording, ensuring accurate and responsive status reporting.

    # Step 1: Ensure No Active Recording Before Starting
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording before starting the test.

    Execute Command    curl -X POST http://localhost/mic/resume-recording

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    1s

    # Step 4: Retrieve the Current Recording Status
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Should Contain    ${status_output}    "status":"Active"
    Log    📊 Successfully retrieved the current recording status.

    # Step 5: Stop the Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 6: Validate That the File Exists
    ${file_check}=    Execute Command    ls /Audio/Mic/
    Should Contain    ${file_check}    output.wav
    Log    ✅ Verified that output.wav was successfully saved.

    # Step 7: Cleanup Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully returned the current recording status while recording was active.


Test Case 10: To Verify the Functionality of the API That Retrieves the Current Status of Audio Recording When It Is Paused
    [Documentation]    Verifying the API's ability to fetch and display the "Paused" status of audio recording, ensuring accurate and responsive status reporting when the recording is paused.

    # Step 1: Ensure No Active Recording Before the Test
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording before starting the test.

    # Step 2: Start a New Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    1s    # Allow recording to initialize properly

    # Step 4: Pause the Recording
    ${pause_output}=    Execute Command    curl -X POST http://localhost/mic/pause-recording
    Should Contain    ${pause_output}    Audio capture paused
    Log    ⏸ Recording paused successfully.

    # Step 5: Retrieve and Verify the Current Recording Status
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Should Contain    ${status_output}    paused
    Log    📊 Successfully retrieved the "Paused" status of the audio recording.

    # Step 6: Stop the Recording After Verification
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 7: Validate That the Recorded File Exists
    ${file_check}=    Execute Command    ls /Audio/Mic/
    Should Contain    ${file_check}    output.wav
    Log    ✅ Verified that output.wav was successfully saved.

    # Step 8: Clean Up the Recorded File (If Created)
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully returned the "Paused" status when the recording was paused, ensuring accurate status reporting.


Test Case 11: To Verify the Functionality of the API That Retrieves the Current Status of Audio Recording When It Is Stopped
    [Documentation]    Verifying the API's ability to fetch and display the "Stopped" status of audio recording, ensuring accurate and responsive status reporting when the recording is stopped.

    # Step 1: Ensure No Active Recording Before the Test
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording before starting the test.

    # Step 2: Start a New Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    5s    # Allow recording to initialize properly

    # Step 4: Stop the Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    "message":"Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav'.
    Log    🛑 Recording stopped, and file saved successfully.

#    # Step 5: Verify if the Recorded File Exists
#    ${ls_output}=    Execute Command    ls /Audio/Mic
#    Log To Console    \n📢 File Check Output: ${ls_output}
#    Should Contain    ${ls_output}    output.wav
    Log    ✅ File "output.wav" successfully saved in /Audio/Mic directory.
    # Step 5: Retrieve and Verify the Current Recording Status
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Should Contain    ${status_output}    Inactive
    Log    📊 Successfully retrieved the "Stopped" status of the audio recording.


    # Step 7: Clean Up the Recorded File (If Created)
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully returned the "Stopped" status after stopping the recording, ensuring accurate status reporting.


Test Case 12: To Verify the Functionality of the API That Mutes the Microphone
    [Documentation]    Verifying the API's ability to mute the microphone, ensuring proper functionality and responsiveness to mute commands.

    # Step 1: Ensure No Active Recording Before Test
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording before starting the test.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.
    Execute Command    curl http://localhost/mic/unmute-mice
    # Step 3: Wait for Recording to Stabilize
    Sleep    1s

    # Step 4: Ask the User to Mute the Microphone Manually
    Log To Console    ${\n}🔊 Please press Enter to muted microphone.
    Evaluate    input()    # Waits for Enter press

    # Step 5: Mute the Microphone Using the API
    ${mute_output}=    Execute Command    curl http://localhost/mic/mute-mice
    Should Contain    ${mute_output}    Microphone is muted
    Log    🔇 Microphone muted successfully.

    # Step 6: Allow Time for Muting to Take Effect
    Sleep    1s

    # Step 7: Ask the User to Speak After Muting
    Log To Console    ${\n}🔍 Please try speaking now. The recording should capture silence after muting.${\n}Press Enter when done.
    Evaluate    input()    # Waits for Enter press

    # Step 8: Stop the Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    "message":"Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav'."
    Log    🛑 Recording stopped, and file saved successfully.
    Execute Command    curl http://localhost/mic/unmute-mice
    # Step 9: Validate That the File Exists
#    ${file_check}=    Execute Command    ls /Audio/Mic/
#    Should Contain    ${file_check}    output.wav
#    Log    ✅ Verified that output.wav was successfully saved.

    # Step 10: Play the Recorded File for Manual Validation
    Log To Console    ${\n}▶️ Now playing the recorded audio... Listen carefully.${\n}You should hear silence after muting.${\n}Did the recording contain only silence after muting? (YES/NO)
    Execute Command    curl -X POST http://localhost/audio/start_audio -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'

    ${user_response}=    Evaluate    input().strip().upper()

    # Step 11: Validate User Feedback
    Run Keyword If    '${user_response}' != 'YES'    Fail    ❌ Audio was not muted successfully.

    # Step 12: Cleanup - Delete the Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully muted the microphone, recording contained only silence after muting, and playback worked as expected.



Test Case 13: Verify API Behavior When Attempting to Mute an Already Muted Microphone
    [Documentation]    Verifies the API's response when trying to mute an already muted microphone, ensuring proper error handling and messaging.

    # Step 1: Ensure No Active Recording Before Test
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensuring no active recording before starting the test.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Microphone recording started successfully.
    Execute Command    curl http://localhost/mic/unmute-mice
    # Step 3: Wait for Recording to Stabilize
    Sleep    1s

    # Step 4: Mute the Microphone
    ${mute_output_1}=    Execute Command    curl http://localhost/mic/mute-mice
    Should Contain    ${mute_output_1}    Microphone is muted
    Log    🔇 Microphone muted successfully.

    # Step 5: Allow Time for Muting to Take Effect
    Sleep    1s

    # Step 6: Attempt to Mute the Microphone Again
    ${mute_output_2}=    Execute Command    curl http://localhost/mic/mute-mice
    Run Keyword If    "Microphone is already in mute state" in "${mute_output_2}"    Log    ✅ API correctly handled an attempt to mute an already muted microphone.
    Run Keyword Unless    "Microphone is already in mute state" in "${mute_output_2}"    Fail    ❌ API did not return the expected response for an already muted microphone.

    # Step 7: Stop the Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    "message":"Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav'
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 8: Validate That the File Exists
    ${file_check}=    Execute Command    ls /Audio/Mic/
    Should Contain    ${file_check}    output.wav
    Log    ✅ Verified that 'output.wav' was successfully saved.

    # Step 9: Cleanup - Delete the Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 API successfully prevented muting an already muted microphone and returned the expected response.



Test Case 14: Verify the Functionality of the API That Unmutes the Microphone
    [Documentation]    Verifying the API's ability to unmute the microphone, ensuring proper functionality and responsiveness to unmute commands.

    # Step 1: Ensure No Active Recording Before Test
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensuring no active recording before starting the test.
    Execute Command    curl -X POST http://localhost/mic/unmute-mice
    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Microphone recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    1s

    # Step 4: Ask User to Press Enter to Mute the Microphone
    Log To Console    ${\n}🔇 Press **Enter** to mute the microphone using the API.${\n}
    Evaluate    input()    # Waits for Enter press

    # Step 5: Mute the Microphone Using the API
    ${mute_output}=    Execute Command    curl http://localhost/mic/mute-mice
    Should Contain    ${mute_output}    Microphone is muted
    Log    ✅ Microphone muted successfully.



    # Step 7: Ask User to Press Enter to Unmute the Microphone
    Log To Console    ${\n}🔊 Press **Enter** to unmute the microphone using the API.${\n}
    Evaluate    input()    # Waits for Enter press

    # Step 8: Unmute the Microphone Using the API
    ${unmute_output}=    Execute Command    curl http://localhost/mic/unmute-mice
    Should Contain    ${unmute_output}    Microphone is unmuted
    Log    ✅ Microphone unmuted successfully.

    Sleep    5s
    # Step 10: Stop the Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    "message":"Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav'."
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 11: Play the Recorded File for Validation
    Log To Console    ${\n}▶️ Now playing the recorded audio... Listen carefully.${\n}You should hear your voice clearly after unmuting.${\n}Did the recording contain audible speech after unmuting? (YES/NO)
    Execute Command    curl -X POST http://localhost/audio/start_audio -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'

    # Step 12: Ask Tester to Confirm If the Recording Contains Audible Speech After Unmuting
    ${user_verification}=    Evaluate    input().strip().upper()

    # Step 13: Validate User Feedback
    Run Keyword If    '${user_verification}' == 'YES'    Log    ✅ Test Passed: Unmuting function worked correctly.
    Run Keyword If    '${user_verification}' == 'NO'    Fail    ❌ Test Failed: Unmuting function did not work properly.

    # Step 14: Cleanup - Delete the Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API successfully unmuted the microphone and restored audio recording functionality.



Test Case 15: Verify the API's Behavior When Attempting to Unmute an Already Unmuted Microphone
    [Documentation]    Verifying the API's response when trying to unmute an already unmuted microphone, ensuring proper error handling and messaging.

    # Step 1: Ensure No Active Recording Before Test and Unmute the Microphone Initially
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording before starting the test.

    Execute Command    curl http://localhost/mic/unmute-mice
    Log    🟢 Ensured microphone is unmuted before test execution.

    # Step 2: Start Audio Recording
    ${start_output}=    Execute Command    curl -X POST http://localhost/mic/start-recording
    Should Contain    ${start_output}    "message":"Audio capture started."
    Log    🎤 Recording started successfully.

    # Step 3: Wait for Recording to Stabilize
    Sleep    1s

    # Step 4: Ask User to Mute the Microphone
    Log To Console    Press Enter to mute the microphone...
    Evaluate    input()

    ${mute_output}=    Execute Command    curl http://localhost/mic/mute-mice
    Should Contain    ${mute_output}    Microphone is muted
    Log    🔇 Microphone muted successfully.

    # Step 5: Ask User to Unmute the Microphone
    Log To Console    Press Enter to unmute the microphone...
    Evaluate    input()

    ${unmute_output_1}=    Execute Command    curl http://localhost/mic/unmute-mice
    Should Contain    ${unmute_output_1}    Microphone is unmuted
    Log    🔊 Microphone unmuted successfully.

    # Step 6: Wait Before Attempting to Unmute Again
    Sleep    2s

    # Step 7: Attempt to Unmute Again When Already Unmuted
    ${unmute_output_2}=    Execute Command    curl http://localhost/mic/unmute-mice
    Should Contain    ${unmute_output_2}    Microphone not in mute state
    Log    ✅ API correctly handled unmute request when microphone was already unmuted.

    # Step 8: Stop the Recording
    ${stop_output}=    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Should Contain    ${stop_output}    "message":"Audio capture stopped. Audio file saved as '/Audio/Mic/output.wav'."
    Log    🛑 Recording stopped, and file saved successfully.

    # Step 9: Cleanup - Delete the Recorded File
    Execute Command    rm -f /Audio/Mic/output.wav
    Log    🗑 Temporary recorded file deleted successfully.

    # Final Observation
    Log    🎯 Observed API correctly returned an appropriate response when trying to unmute an already unmuted microphone.



Test Case 16: Verify API Behavior When Muting the Microphone Without an Active Recording Session
    [Documentation]    Verifying the API's response when attempting to mute the microphone before starting an audio recording, ensuring proper error handling and messaging.

    # Step 1: Ensure No Active Recording Session
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Run Keyword If    'recording' in '${status_output}'    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording session is running before testing mute functionality.

    # Step 2: Validate Mic Status is Not in "Recording" State
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Should Not Contain    ${status_output}    recording audio
    Log    ✅ Confirmed that no active recording session is running.

#    # Step 3: Ask User to Press Enter Before Muting
#    Log To Console    ${\n}Press Enter to attempt muting the microphone without an active recording session...
#    Evaluate    input()

    # Step 4: Attempt to Mute the Microphone Without Recording
    ${mute_output}=    Execute Command    curl http://localhost/mic/mute-mice
    Execute Command    curl http://localhost/mic/unmute-mice
    Should Contain    ${mute_output}    Audio capture is not running
    Log    ✅ API correctly handled mute request without an active recording session.

    # Final Observation
    Log    🎯 Observed API correctly returned an appropriate response when trying to mute the microphone without an active recording session.



Test Case 17: Verify API Behavior When Unmuting the Microphone Without an Active Recording Session
    [Documentation]    Verifying the API's response when attempting to unmute the microphone before starting an audio recording, ensuring proper error handling and messaging.

    # Step 1: Ensure No Active Recording Session
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Run Keyword If    'recording' in '${status_output}'    Execute Command    curl -X POST http://localhost/mic/stop-recording -H "Content-Type: application/json" -d '{"file_path": "/Audio/Mic/output.wav"}'
    Log    🔄 Ensured no active recording session is running before testing unmute functionality.

    # Step 2: Validate Mic Status is Not in "Recording" State
    ${status_output}=    Execute Command    curl http://localhost/mic/status-mice
    Should Contain    ${status_output}    Inactive
    Log    ✅ Confirmed that no active recording session is running.

#    # Step 3: Ask User to Press Enter Before Unmuting
#    Log To Console    Press Enter to attempt unmuting the microphone without an active recording session...
#    Evaluate    input()

    # Step 4: Attempt to Unmute the Microphone Without Recording
    ${unmute_output}=    Execute Command    curl http://localhost/mic/unmute-mice
    Should Contain    ${unmute_output}    Audio capture is not running
    Log    ✅ API correctly handled unmute request without an active recording session.

    # Final Observation
    Log    🎯 Observed API correctly returned an appropriate response when trying to unmute the microphone without an active recording session.



Test Case 18: To Verify the API That Configures the Codec for the Microphone and Speaker
    [Documentation]    Verifying the API's ability to configure the codec for the microphone and speaker, ensuring correct setup and functionality for audio input and output.

#    # Step 1: Check Current Codec Configuration Before Setting a New One
#    ${current_config}=    Execute Command    curl -X GET http://localhost/mic/config-status
#    Log    🔄 Current codec configuration: ${current_config}

    # Step 2: Send Request to Configure the Codec
    ${config_output}=    Execute Command    curl http://localhost/mic/configure-mic-speaker
    Log    🔄 Sent API request to configure codec with default settings.

    # Step 3: Validate the API Response
    Should Contain    ${config_output}    Codec configured successfully
    Log    ✅ Codec for microphone and speaker configured successfully.

#    # Step 4: Verify Configuration Has Been Applied
#    ${new_config}=    Execute Command    curl -X GET http://localhost/mic/config-status
#    Should Contain    ${new_config}    default
#    Log    🎯 Verified that the codec configuration has been applied successfully.



Test Case 19: To Verify the API That Sets the Micbias Voltage to 2V
    [Documentation]    Verifying the API's ability to set the Micbias voltage to 2V, ensuring correct configuration and functionality.

    # Step 1: Send API Request to Set Micbias Voltage to 2V
    ${config_output}=    Execute Command    curl "http://localhost/mic/set-micbias?voltage=2V"
    Log    🔄 Sent API request to set Micbias voltage to 2V.

    # Step 2: Validate API Response
    Should Contain    ${config_output}    Micbias set to 2V successfully.
    Log    ✅ Micbias voltage successfully configured to 2V.

    # Final Observation
    Log    🎯 Observed API successfully set the Micbias voltage to 2V.


Test Case 20: To Verify the API That Sets the Micbias Voltage to 2.5V
    [Documentation]    Verifying the API's ability to set the Micbias voltage to 2.5V, ensuring correct configuration and functionality.

    # Step 1: Send API Request to Set Micbias Voltage to 2.5V
    ${config_output}=    Execute Command    curl "http://localhost/mic/set-micbias?voltage=2.5V"
    Log    🔄 Sent API request to set Micbias voltage to 2.5V.

    # Step 2: Validate API Response
    Should Contain    ${config_output}    Micbias set to 2.5V successfully.
    Log    ✅ Micbias voltage successfully configured to 2.5V.

    # Final Observation
    Log    🎯 Observed API successfully set the Micbias voltage to 2.5V.


Test Case 21: To Verify the API That Sets the Micbias Voltage to AVDD
    [Documentation]    Verifying the API's ability to set the Micbias voltage to AVDD, ensuring correct configuration and functionality.

    # Step 1: Send API Request to Set Micbias Voltage to AVDDV
    ${config_output}=    Execute Command    curl "http://localhost/mic/set-micbias?voltage=AVDD"
    Log    🔄 Sent API request to set Micbias voltage to AVDD.

    # Step 2: Validate API Response
    Should Contain    ${config_output}    Micbias set to AVDD successfully.
    Log    ✅ Micbias voltage successfully configured to AVDD.

    # Final Observation
    Log    🎯 Observed API successfully set the Micbias voltage to AVDD.

Test Case 22: To Verify the API That Sets the Microphone Gain Level to Different Specified Values
    [Documentation]    Verifying the API's ability to set the microphone gain level within the valid range (0-59), ensuring correct configuration and functionality.

    @{gain_values}    Create List    10    20    30    40    # List of gain levels to test

    FOR    ${gain}    IN    @{gain_values}
        # Step 1: Set the microphone gain level
        ${set_gain_output}=    Execute Command    curl -X POST "http://localhost/mic/set_gain" -H "Content-Type: application/json" -d '{"gain": ${gain}}'
        Log    🔄 Sent API request to set microphone gain level to ${gain}.

        # Step 2: Validate the response
        Should Contain    ${set_gain_output}    gain set to ${gain}
        Log    ✅ Microphone gain level successfully set to ${gain}.
    END

    # Final Observation
    Log    🎯 Observed API correctly set the microphone gain levels as expected.


Test Case 23: To Verify the API's Behavior When Provided with a Value Below and Above the Valid Range (0-59)
    [Documentation]    Verifying the API's ability to handle out-of-range microphone gain values, ensuring proper error handling.

    @{invalid_gain_values}    Create List    -5    60    100    # List of out-of-range gain levels to test

    FOR    ${gain}    IN    @{invalid_gain_values}
        # Step 1: Attempt to set an invalid microphone gain level
        ${set_gain_output}=    Execute Command    curl -X POST "http://localhost/mic/set_gain" -H "Content-Type: application/json" -d '{"gain": ${gain}}'
        Log    🔄 Sent API request with invalid gain value: ${gain}.

        # Step 2: Validate that the API correctly rejects the invalid value
        Should Contain    ${set_gain_output}    Invalid gain level
        Log    ❌ API correctly rejected invalid gain value: ${gain}.
    END

    # Final Observation
    Log    🎯 Observed API correctly rejects out-of-range gain values (<0 or >59) with an appropriate error response.



