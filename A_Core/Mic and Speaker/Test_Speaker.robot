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
Test Case 1: To Verify the Functionality of the API that Starts Audio Playback
    [Documentation]    Verifying the API's ability to start audio playback when commanded and ensuring the functionality and responsiveness of the start command.

    # Step 1: Start audio playback via the API
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert1.wav"}'
    Sleep    2s
    # Step 2: Validate API response
    Should Contain    ${output}    Audio playback started from /Audio/Alert1.wav
    # Step 5: Stop the audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped
    # Step 3: Prompt user to verify the audio playback
    Log To Console    \nListen to the Speaker. If the audio starts playing, type 'YES'. Otherwise, type 'NO'.\n
    ${user_verification}=    Evaluate    input("Is the audio playing? (YES/NO): ")

    # Step 4: Validate tester’s response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio playback started successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Audio playback did not start.


    # Step 6: Log final observation
    Log    Observed that the API successfully initiated and stopped audio playback upon receiving the respective commands.



Test Case 2: To Verify the functionality of the API that stops audio playback.
    [Documentation]    Verifying the API's ability to stop audio playback when commanded and ensuring the functionality and responsiveness of the stop command.

    # Step 1: Start audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/Alert2.wav
    Sleep    2s
    # Step 2: Stop audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${output}    Audio playback stopped

    # Step 3: Get user input to verify the audio playback stopped
    Log To Console    \nListen to the Speaker. If the audio playback stopped, type 'YES'. Otherwise, type 'NO'.\n
    ${user_verification}=    Evaluate    input("Did the audio stop correctly? (YES/NO): ")

    # Step 4: Check the user input and log the result
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio playback stopped successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Audio playback did not stop.

    # Observation
    Log    Observed the API successfully halted audio playback upon receiving the stop command.


Test Case 3: To Verify the Functionality of the API that Mutes Audio Playback
    [Documentation]    Verifying the API's ability to mute audio playback when commanded and ensuring the functionality and responsiveness of the mute command.

    # Step 1: Start audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/Alert2.wav
    Sleep    2s  # Allow some time for playback before muting

    # Step 2: Mute the audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/mute_audio"
    Should Contain    ${output}    Audio muted

    # Step 3: Get user input to verify if the audio is muted
    Log To Console    \nListen to the speaker. If the audio playback is muted, type 'YES'. Otherwise, type 'NO'.\n
    ${user_verification}=    Evaluate    input("Is the audio muted? (YES/NO): ")

    # Step 4: Validate tester’s response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio playback muted successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Audio playback is not muted.

    # Step 5: Stop audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${output}    Audio playback stopped

    # Observation
    Log    Observed the API successfully muted audio playback upon receiving the mute command.


Test Case 4: To Verify the Functionality of the API that Unmutes Audio Playback
    [Documentation]    Verifying the API's ability to unmute audio playback when commanded and ensuring the functionality and responsiveness of the unmute command.



    # Step 1: Start audio playback via the API
    ${start_output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${start_output}    Audio playback started from /Audio/Alert2.wav
    Sleep    2s  # Allow playback to start

    # Step 2: Mute the audio playback
    ${mute_output}=    Execute Command    curl -X POST "http://localhost/audio/mute_audio"
    Should Contain    ${mute_output}    Audio muted
    Sleep    4s  # Allow playback to start
    # Step 3: Unmute the audio playback
    ${unmute_output}=    Execute Command    curl -X POST "http://localhost/audio/unmute_audio"
    Should Contain    ${unmute_output}    Audio unmuted
    Sleep    2S
    # Step 6: Stop the audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped

    # Step 4: Prompt user to verify if the audio is still muted
    Log To Console    \nListen to the speaker. If the audio is still muted, type 'YES'. Otherwise, type 'NO'.\n
    ${user_verification}=    Evaluate    input("Is the audio still muted? (YES/NO): ")

    # Step 5: Validate tester’s response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Fail    Test Failed: Audio playback is still muted after unmute command.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Log    Test Passed: Audio playback unmuted successfully.



    # Step 7: Log final observation
    Log    Observed that the API successfully muted and then unmuted the audio playback upon receiving the respective commands.



Test Case 5: To Verify that the API Correctly Reports the Audio Playback Status as "Playing"
    [Documentation]    Verifying the API accurately reports "Playing" status when audio is actively being played.

    # Step 1: Start audio playback via the API
    ${start_output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${start_output}    Audio playback started from /Audio/Alert2.wav
    Sleep    2s  # Allow playback to start

    # Step 2: Retrieve audio playback status
    ${status_output}=    Execute Command    curl -X GET "http://localhost/audio/audio_status"
    Should Contain    ${status_output}    "status":"playing"

    # Step 3: Stop the audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped

    # Step 4: Log final observation
    Log    Observed that the API correctly reported the audio status as "Playing" when audio was actively playing.


Test Case 6: To Verify that the API Correctly Reports the Audio Playback Status as "Stopped"
    [Documentation]    Verifying the API accurately reports "Stopped" status when audio playback is currently not active.

    # Step 1: Start audio playback via the API
    ${start_output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${start_output}    Audio playback started from /Audio/Alert2.wav
    Sleep    2s  # Allow playback to start

    # Step 2: Stop the audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped

    # Step 3: Retrieve audio playback status
    ${status_output}=    Execute Command    curl -X GET "http://localhost/audio/audio_status"
    Should Contain    ${status_output}    "status":"stopped"

    # Step 4: Log final observation
    Log    Observed that the API correctly reported the audio playback status as "Stopped" when playback was inactive.


Test Case 7: To Verify that the API Correctly Reports the Audio Playback Status as "Muted"
    [Documentation]    Verifying the API accurately reports "Muted" status when audio playback is currently muted.

    # Step 1: Start audio playback via the API
    ${start_output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${start_output}    Audio playback started from /Audio/Alert2.wav
    Sleep    2s  # Allow playback to start

    # Step 2: Mute the audio playback
    ${mute_output}=    Execute Command    curl -X POST "http://localhost/audio/mute_audio"
    Should Contain    ${mute_output}    Audio muted

    # Step 3: Retrieve audio playback status
    ${status_output}=    Execute Command    curl -X GET "http://localhost/audio/audio_status"
    Should Contain    ${status_output}    "status":"playing but muted"

    # Step 4: Stop the audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped

    # Step 5: Log final observation
    Log    Observed that the API correctly reported the audio playback status as "Muted" when playback was muted.


Test Case 8: To Verify the API's Handling of Invalid File Paths During Audio Playback Initiation
    [Documentation]    Verifying the API correctly handles requests with invalid file paths and returns an appropriate error response.

    # Step 1: Attempt to start audio playback with an invalid file path
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/invalid/path/audio_file.wav"}'

    # Step 2: Validate API response for error handling
    Should Contain    ${output}    error
    Should Contain    ${output}    No such file or directory

    # Step 3: Log final observation
    Log    Observed that the API correctly handled invalid file paths by returning an appropriate error response when attempting to initiate audio playback.


Test Case 9: To Verify the API's Handling of a Stop Audio Request When No Audio is Currently Playing
    [Documentation]    Verifying the API gracefully handles the stop audio request when no audio playback is in progress.

    # Step 1: Ensure no audio is playing by stopping any ongoing playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"

    # Step 2: Validate API response for proper handling when no audio is playing
    Should Contain    ${output}    Audio playback is not running

    # Step 3: Log final observation
    Log    Observed that the API correctly handled the stop audio request by returning an appropriate response when no audio was playing.


Test Case 10: To Verify the API's Handling of Concurrent Requests to Start Audio Playback
    [Documentation]    Verifying the API can handle multiple concurrent requests to start audio playback without errors or unexpected behavior.

    # Step 1: Loop through multiple concurrent playback requests
    FOR    ${i}    IN RANGE    1    11
        ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
        Should Contain    ${output}    Audio playback started from /Audio/Alert2.wav

        # Step 2: Stop the audio playback after each start request
        ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
        Should Contain    ${output}    Audio playback stopped

        # Step 3: Introduce a short delay to simulate rapid requests
        Sleep    0.2s
    END

    # Step 4: Log the final observation
    Log    Observed that the API successfully handled multiple concurrent requests to start audio playback without errors or unexpected behavior.


Test Case 11: To verify the API's behavior when attempting to start a new audio file while another audio file is already playing.
    [Documentation]    Verifying the API's behavior when starting a new audio file while another is already playing.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/Alert2.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/Alert2.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/Alert2.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/Alert2.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${output}    Audio playback stopped
    Log    Observed the API seamlessly stops the current playback and begins playing the new audio file without errors or delays.



Test Case 12: To Verify the API's Ability to Play WMA Audio Files
    [Documentation]    Verifying the API can successfully play a WMA audio file without errors or interruptions.

    # Step 1: Start playing a WMA audio file
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wma"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wma

    # Step 2: Log a prompt for user verification
    Log To Console    \nListen to the speaker. If the WMA file is playing correctly, type 'YES'. Otherwise, type 'NO'.\n

    # Step 3: Get user input to confirm audio playback
    ${user_verification}=    Evaluate    input("Is the WMA file playing? (YES/NO): ")

    # Step 4: Validate user response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: WMA audio playback verified successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: WMA audio playback did not start correctly.

    # Step 5: Stop the audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${output}    Audio playback stopped

    # Step 6: Log final observation
    Log    Observed that the API successfully played a WMA audio file without errors or interruptions.


Test Case 13: To Verify the API's Ability to Play WV Audio Files
    [Documentation]    Verifying the API can successfully play a WV audio file without errors or interruptions.

    # Step 1: Start WV audio file playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wv"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wv

    # Step 2: Stop audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"

    # Step 3: Log final observation
    Log    Observed the API successfully playing WV audio files without errors or interruptions during playback.



Test Case 14: To Verify the API's Ability to Play WVE Audio Files
    [Documentation]    Verifying the API can successfully play a WVE audio file without errors or interruptions.

    # Step 1: Start WVE audio file playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wve"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wve

    # Step 2: Stop audio playback
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"

    # Step 3: Log final observation
    Log    Observed the API successfully playing WVE audio files without errors or interruptions during playback.


Test Case 15: To verify the API's ability to play W64 audio files.
    [Documentation]    Verifying the API can successfully play a W64 audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.w64"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.w64
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing W64 audio files without errors or interruptions during playback.

Test Case 16: To verify the API's ability to play WAV audio files.
    [Documentation]    Verifying the API can successfully play a WAV audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wav"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.wav
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log     Observed the API successfully playing WAV audio files without errors or interruptions during playback.

Test Case 17: To verify the API's ability to play SPH audio files.
    [Documentation]    Verifying the API can successfully play an SPH audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.sph"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.sph
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing SPH audio files without errors or interruptions during playback.

Test Case 18: To verify the API's ability to play SPX audio files.
    [Documentation]    Verifying the API can successfully play an SPX audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.spx"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.spx
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing SPX audio files without errors or interruptions during playback.


Test Case 19: To verify the API's ability to play TTA audio files.
    [Documentation]    Verifying the API can successfully play a TTA audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.tta"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.tta
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing TTA audio files without errors or interruptions during playback.

Test Case 20: To verify the API's ability to play VOC audio files.
    [Documentation]    Verifying the API can successfully play a VOC audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.voc"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.voc
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing VOC audio files without errors or interruptions during playback.

Test Case 21: To verify the API's ability to play PVF audio files.
    [Documentation]    Verifying the API can successfully play a PVF audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.pvf"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.pvf
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing PVF audio files without errors or interruptions during playback.

Test Case 22: To verify the API's ability to play RA audio files.
    [Documentation]    Verifying the API can successfully play an RA audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.ra"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.ra
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing RA audio files without errors or interruptions during playback.

Test Case 23: To verify the API's ability to play SLN audio files.
    [Documentation]    Verifying the API can successfully play an SLN audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.sln"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.sln
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing SLN audio files without errors or interruptions during playback.

Test Case 24: To verify the API's ability to play .SND audio files.
    [Documentation]    Verifying the API can successfully play an SND audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.snd"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.snd
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing .SND audio files without errors or interruptions during playback.

Test Case 25: To verify the API's ability to play NIST audio files.
    [Documentation]    Verifying the API can successfully play an NIST audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.nist"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.nist
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing NIST audio files without errors or interruptions during playback.

Test Case 26: To verify the API's ability to play OGA audio files.
    [Documentation]    Verifying the API can successfully play an OGA audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.oga"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.oga
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing OGA audio files without errors or interruptions during playback.

Test Case 27: To verify the API's ability to play OGG audio files.
    [Documentation]    Verifying the API can successfully play an OGG audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.ogg"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.ogg
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing OGG audio files without errors or interruptions during playback.

Test Case 28: To verify the API's ability to play OPUS audio files.
    [Documentation]    Verifying the API can successfully play an OPUS audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.opus"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.opus
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing OPUS audio files without errors or interruptions during playback.

Test Case 29: To verify the API's ability to play PAF audio files.
    [Documentation]    Verifying the API can successfully play a PAF audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.paf"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.paf
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing PAF audio files without errors or interruptions during playback.

Test Case 30: To verify the API's ability to play IRCAM audio files.
    [Documentation]    Verifying the API can successfully play an IRCAM audio file without errors or interruptions.
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.ircam"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.ircam
    ${output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing IRCAM audio files without errors or interruptions during playback.

Test Case 31: To verify the API's ability to play M4A audio files.
    [Documentation]    Verifying the API can successfully play an m4a audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.m4a"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.m4a
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing M4A audio files without errors or interruptions during playback.

Test Case 32: To verify the API's ability to play VOX audio files.
    [Documentation]    Verifying the API can successfully play an vox audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.vox"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.vox
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing M4A audio files without errors or interruptions during playback.

Test Case 33: To verify the API's ability to play M4R audio files.
    [Documentation]    Verifying the API can successfully play an m4r audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.m4r"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.m4r
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing M4R audio files without errors or interruptions during playback.

Test Case 34: To verify the API's ability to play MAUD audio files.
    [Documentation]    Verifying the API can successfully play an maud audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.maud"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.maud
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing MAUD audio files without errors or interruptions during playback.

Test Case 35: To verify the API's ability to play MP3 Format Sound (.mp2) audio files.
    [Documentation]    Verifying the API can successfully play an .mp2 audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.mp2"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.mp2
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing MP3 Format Sound (.mp2) audio files without errors or interruptions during playback.

Test Case 36: To verify the API's ability to play MP3 File audio files.
    [Documentation]    Verifying the API can successfully play an .mp3 audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.mp3"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.mp3
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing MP3 File audio files without errors or interruptions during playback.

Test Case 37: To verify the API's ability to play CDDA File audio files.
    [Documentation]    Verifying the API can successfully play an .cdda audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.cdda"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.cdda
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing CDDA File audio files without errors or interruptions during playback.

Test Case 38: To verify the API's ability to play DTS File audio files.
    [Documentation]    Verifying the API can successfully play an .dts audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.dts"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.dts
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing DTS File audio files without errors or interruptions during playback.


Test Case 39: To verify the API's ability to play FAP File audio files.
    [Documentation]    Verifying the API can successfully play an .fap audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.fap"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.fap
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing FAP File audio files without errors or interruptions during playback.

Test Case 40: To verify the API's ability to play FLAC File audio files.
    [Documentation]    Verifying the API can successfully play an .flac audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.flac"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.flac
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing FLAC File audio files without errors or interruptions during playback.

Test Case 41: To verify the API's ability to play AU Format Sound File audio files.
    [Documentation]    Verifying the API can successfully play an .au audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.au"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.au
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing AU Format Sound File audio files without errors or interruptions during playback.

Test Case 42: To verify the API's ability to play AVR File audio files.
    [Documentation]    Verifying the API can successfully play an .avr audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.avr"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.avr
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing AVR Format Sound File audio files without errors or interruptions during playback.


Test Case 43: To verify the API's ability to play CAF File audio files.
    [Documentation]    Verifying the API can successfully play an .caf audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.caf"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.caf
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing CAF Format Sound File audio files without errors or interruptions during playback.


Test Case 44: To verify the API's ability to play 8SVX File audio files.
    [Documentation]    Verifying the API can successfully play an .8svx audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.8svx"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.8svx
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing 8SVX Format Sound File audio files without errors or interruptions during playback.


Test Case 45: To verify the API's ability to play AAC File audio files.
    [Documentation]    Verifying the API can successfully play an .aac audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.aac"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.aac
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing AAC Format Sound File audio files without errors or interruptions during playback.


Test Case 46: To verify the API's ability to play AC3 File audio files.
    [Documentation]    Verifying the API can successfully play an .ac3 audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.ac3"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.ac3
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing AC3 Format Sound File audio files without errors or interruptions during playback.


Test Case 47: To verify the API's ability to play WMP11.AssocFile.AIFF audio files.
    [Documentation]    Verifying the API can successfully play an .aiff audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.aiff"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.aiff
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing WMP11.AssocFile.AIFF Format Sound File audio files without errors or interruptions during playback.


Test Case 48: To verify the API's ability to play AMB File audio files.
    [Documentation]    Verifying the API can successfully play an .amb audio file without errors or interruptions.
    ${output}    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.amb"}'
    Should Contain    ${output}    Audio playback started from /Audio/sample1.amb
    ${output}    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Log    Observed the API successfully playing AMB Format Sound File audio files without errors or interruptions during playback.

Test Case 49: To verify the API's ability to start and stop audio streaming from the input device to the output device.
    [Documentation]    Verifying the API's ability to start and stop audio streaming between the input and output devices, ensuring proper functionality.

    # Step 1: Start audio streaming
    ${start_output}=    Execute Command    curl -X POST http://localhost/audio/start_streaming
    Should Contain    ${start_output}    Audio streaming started.
    Log    Audio streaming started successfully.

    # Step 2: Prompt the tester to provide microphone input
    Log To Console    ${\n}Please provide input to the microphone by speaking the following examples:${\n}
    Log To Console    ${\n}1. "Testing, testing, one, two, three." ${\n}2. "Microphone check, microphone check, one, two, three." ${\n}

    # Step 3: Allow tester to confirm audio playback
    Log To Console    ${\n}Listen to the recorded audio output. If the playback matches your input, type 'YES'. Otherwise, type 'NO'.${\n}
    ${user_verification}=    Evaluate    input("Does the recorded audio match your input? (YES/NO): ")

    # Step 4: Validate tester's response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio streaming and playback verified successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Recorded audio did not match the input.

    # Step 5: Stop audio streaming
    ${stop_output}=    Execute Command    curl -X POST http://localhost/audio/stop_streaming
    Should Contain    ${stop_output}    Audio streaming stopped.
    Log    Audio streaming stopped successfully.
    # Observation
    Log    Observed the API successfully starting audio streaming

Test Case 50: To verify the API's ability to stop audio streaming from the input device to the output device.
    [Documentation]    Verifying the API's ability to stop audio streaming from the input device to the output device, ensuring proper functionality.

    # Step 1: Start audio streaming
    ${start_output}=    Execute Command    curl -X POST http://localhost/audio/start_streaming
    Should Contain    ${start_output}    Audio streaming started.
    Log    Audio streaming started successfully.
    Sleep    10s
    # Step 5: Stop audio streaming
    ${stop_output}=    Execute Command    curl -X POST http://localhost/audio/stop_streaming
    Should Contain    ${stop_output}    Audio streaming stopped.
    Log    Audio streaming stopped successfully.
    # Step 2: Prompt the tester to provide microphone input
    Log To Console    ${\n}Please provide input to the microphone by speaking the following examples:${\n}
    Log To Console    ${\n}1. "Testing, testing, one, two, three." ${\n}2. "Microphone check, microphone check, one, two, three." ${\n}
    # Step 3: Allow tester to confirm audio playback
    Log To Console    ${\n}Listen to the recorded audio output. If it is not playing then give your input, type 'YES'. Otherwise, type 'NO'.${\n}
    ${user_verification}=    Evaluate    input()
    # Step 4: Validate tester's response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio streaming stopped.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Recorded audio did not match the input.

    # Observation
    Log    Observed the API successfully stopping audio streaming

Test Case 51: To verify the functionality of the API that pauses the current audio playback.
    [Documentation]    Verifying the API's ability to pause the current audio playback, ensuring proper functionality.
    # Step 1: Start audio playback
    ${start_output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wav"}'
    Should Contain    ${start_output}    Audio playback started from /Audio/sample1.wav
    Log    Audio playback started successfully.

    Sleep    2s  # Allow playback to run for a few seconds

    # Step 2: Pause the audio playback
    ${pause_output}=    Execute Command    curl -X POST http://localhost/audio/pause_playing

    Should Contain    ${pause_output}    Audio playback paused
    Log    Audio playback paused
    Sleep    2s

    # Step 3: Resume the audio playback
    ${resume_output}=    Execute Command    curl -X POST http://localhost/audio/resume_playing
    Should Contain    ${resume_output}    Audio playback resumed
    Log    Audio playback resumed successfully.
    Sleep    2s
    # Step 6: Stop audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped
    Log    Audio playback stopped successfully.
    # Step 4: Validate playback resumes from paused position
    Log To Console    ${\n}Listen to the audio output. If it resumes from where it was paused, type 'YES'. Otherwise, type 'NO'.${\n}
    ${user_verification}=    Evaluate    input("Does the audio resume correctly? (YES/NO): ")

    # Step 5: Validate tester's response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio successfully resumed from paused position.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Audio did not resume from paused position.

    # Observation
    Log    Observed API successfully pauses

Test Case 52: To Verify the API's Behavior When Attempting to Pause Audio Playback While No Audio is Currently Playing
    [Documentation]    Verifying the API's response when attempting to pause audio playback while no audio is playing, ensuring proper error handling and messaging.


    # Step 2: Attempt to pause audio playback without starting it
    ${pause_output}=    Execute Command    curl -X POST http://localhost/audio/pause_playing
#    ${resume_output}=    Execute Command    curl -X POST http://localhost/audio/resume_playing
    # Step 3: Validate the API response
    Should Contain    ${pause_output}    "message":"Audio playback is not running"

    # Step 4: Log API behavior
    Log    API correctly returned an error message when trying to pause audio without playback.

    # Observation
    Log    Observed API properly handling the case where pause is attempted without active playback.


Test Case 53: To verify the functionality of the API that resumes paused audio playback.
    [Documentation]    Verifying the API's ability to resume paused audio playback, ensuring proper functionality

    # Step 1: Start audio playback
    ${start_output}=    Execute Command    curl -X POST "http://localhost/audio/start_audio" -H "Content-Type: application/json" -d '{"file_path": "/Audio/sample1.wav"}'
    Should Contain    ${start_output}    Audio playback started from /Audio/sample1.wav
    Log    Audio playback started successfully.

    Sleep    2s  # Allow playback to run for a few seconds

    # Step 2: Pause the audio playback
    ${pause_output}=    Execute Command    curl -X POST http://localhost/audio/pause_playing
    Should Contain    ${pause_output}    Audio playback paused
    Log    Audio playback paused successfully.

    Sleep    5s  # Simulate pause duration

    # Step 3: Resume the audio playback
    ${resume_output}=    Execute Command    curl -X POST http://localhost/audio/resume_playing

    Should Contain    ${resume_output}    Audio playback resumed
    Log    Audio playback resumed successfully.
    Sleep    2s
    # Step 6: Stop audio playback
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped
    Log    Audio playback stopped successfully.
    # Step 4: Validate playback resumes from paused position
    Log To Console    \nListen to the audio output. If it resumes from where it was paused, type 'YES'. Otherwise, type 'NO'.\n
    ${user_verification}=    Evaluate    input("Does the audio resume correctly? (YES/NO): ")

    # Step 5: Validate tester's response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Audio successfully resumed from paused position.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Audio did not resume from paused position.



    # Observation
    Log    Observed API successfully resumes paused audio playback

#Test Case 54: To verify the API's behavior when attempting to resume audio playback while no audio is currently paused.
#    [Documentation]    Verifying the API's response when trying to resume audio playback without any paused audio.
#    # Step 1: Attempt to resume audio playback without pausing first
#    ${resume_output}=    Execute Command    curl -X POST http://localhost/audio/resume_playing
#    # Step 2: Validate API response
#    Should Contain    ${resume_output}    Audio playback is not paused    # Assuming API returns an error message when there's no paused audio
#    Log    Attempted to resume audio playback without any paused audio.
#    # Observation
#    Log    Observed API correctly handling the.

Test Case 54: To Verify the API's Behavior When Attempting to Resume Audio Playback While No Audio is Currently Paused
    [Documentation]    Verifying the API's response when trying to resume audio playback without any paused audio.


    # Step 2: Attempt to resume audio playback without pausing first
    ${resume_output}=    Execute Command    curl -X POST http://localhost/audio/resume_playing

    # Step 3: Validate API response
    Should Contain    ${resume_output}    Audio playback is not paused    # Assuming API returns this error message

    # Step 4: Log API behavior
    Log    Attempted to resume audio playback without any paused audio.

    # Step 5: Observation
    Log    Observed API correctly handling the case where resume is attempted without active paused playback.


Test Case 55: To verify the functionality of the API that retrieves a list of predefined audio alerts available in the system.
    [Documentation]    Verifying the API's ability to fetch and display a list of predefined audio alerts available in the system.
    # Step 1: Retrieve predefined audio alerts
    ${alerts_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_3", "file_path": "/Audio/sample1.wav"}'

    ${alerts_output}=    Execute Command    curl -X GET "http://localhost/audio/predefined_audio_alerts"

    # Step 2: Validate API response
    Should Not Be Empty    ${alerts_output}    # Ensures the response is not empty
    Should Contain    ${alerts_output}    "alert_3":"/Audio/sample1.wav"    # Assuming API returns a JSON list with alert names
    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_3"}'


    # Step 3: Log the response
    Log    Observed Predefined audio alerts retrieved successfully: ${alerts_output}

Test Case 56: To verify the functionality of the API that plays a specified predefined audio alert.
    [Documentation]    Verifying the API's ability to play a specified predefined audio alert, ensuring proper functionality
    # Step 1: Play a predefined audio alert
    ${alerts_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_3", "file_path": "/Audio/sample1.wav"}'
    ${alert_output}=    Execute Command    curl -X POST "http://localhost/audio/play_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_3"}'
    # Step 2: Validate API response
    Should Contain    ${alert_output}    Audio playback started from /Audio/sample1.wav.
    Log    API successfully played predefined audio alert: ${alert_output}
    Sleep    2s
    ${stop_output}=    Execute Command    curl -X POST "http://localhost/audio/stop_audio"
    Should Contain    ${stop_output}    Audio playback stopped
    Log    Audio playback stopped successfully.
    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_3"}'
    # Step 3: Prompt tester to validate audio output
    Log To Console    \nListen to the audio output. If the alert audio is playing, type 'YES'. Otherwise, type 'NO'.\n
    ${user_verification}=    Evaluate    input("Is the alert audio playing correctly? (YES/NO): ")
    # Step 4: Validate tester's response
    Run Keyword If    "${user_verification.upper()}" == "YES"    Log    Test Passed: Alert audio played successfully.
    Run Keyword If    "${user_verification.upper()}" == "NO"    Fail    Test Failed: Alert audio did not play correctly.
    Log    Observed API successfully played the predefined audio alert.

Test Case 57: To verify the API's behavior when an invalid alert_id is provided.
    [Documentation]    Verifying the API's response when an invalid alert_id is provided, ensuring proper error handling and messaging.
    # Step 1: Retrieve predefined audio alerts
    ${alerts_output}=    Execute Command    curl -X GET "http://localhost/audio/predefined_audio_alerts"
    Should Not Be Empty    ${alerts_output}    # Ensures the API returns a response
    # Step 2: Attempt to play an invalid predefined alert
    ${invalid_alert_output}=    Execute Command    curl -X POST "http://localhost/audio/play_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "invalid_alert_id"}'
    # Step 3: Validate API response for error handling
    Should Contain    ${invalid_alert_output}    error
    Should Contain    ${invalid_alert_output}    Invalid or missing alert ID
    # Step 4: Log the response
    Log    Observed API responded correctly to an invalid alert_id: ${invalid_alert_output}


Test Case 58: To verify the functionality of the API that adds a new predefined audio alert.
    [Documentation]    Verifying the API's ability to add a new predefined audio alert using the specified alert ID and file path

    # Step 1: Add a new predefined audio alert
    ${alerts_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_4", "file_path": "/Audio/sample1.wav"}'
    # Step 2: Validate API response
    Should Contain    ${alerts_output}    Alert 'alert_4' added with file path '/Audio/sample1.wav'
    Log    Predefined audio alert added successfully.
    # Step 3: Retrieve the list of predefined audio alerts to verify the addition
    ${list_output}=    Execute Command    curl -X GET "http://localhost/audio/predefined_audio_alerts"
    Should Contain    ${list_output}    "alert_4":"/Audio/sample1.wav"
    Log    Verified that alert_4 is present in the predefined audio alerts list.
    # Observation
    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_4"}'
    Log    Observed API correctly added and listed the new predefined audio alert.

Test Case 59: To verify the API's behavior when an existing alert_id is provided.
    [Documentation]    Verifying the API's ability to handle duplicate alert IDs properly, ensuring appropriate error handling
    # Step 1: Add a new predefined audio alert
    ${alerts_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_5", "file_path": "/Audio/sample1.wav"}'

    # Step 2: Validate API response for the first addition
    Should Contain    ${alerts_output}    Alert 'alert_5' added with file path '/Audio/sample1.wav
    Log    Predefined audio alert added successfully.

    # Step 3: Retrieve the list of predefined audio alerts to verify the addition
    ${list_output}=    Execute Command    curl -X GET "http://localhost/audio/predefined_audio_alerts"
    Should Contain    ${list_output}    "alert_5":"/Audio/sample1.wav
    Log    Verified that alert_4 is present in the predefined audio alerts list.

    # Step 4: Attempt to add the same alert_id again
    ${duplicate_alert_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_5", "file_path": "/Audio/sample1.wav"}'

    # Step 5: Validate API response for duplicate alert_id
    Should Contain    ${duplicate_alert_output}    "message":"Alert 'alert_5' already exists.","status":"error"
    Log    API correctly handled the duplicate alert_id with an appropriate error message.

    # Observation
    Log    Observed API correctly prevented duplicate predefined audio alert addition.

Test Case 60: To verify the functionality of the API that removes a predefined audio alert.
    [Documentation]    Verifying the API's ability to remove a predefined audio alert using the specified alert ID.

    # Step 1: Add a predefined audio alert to ensure it exists before removal
    ${add_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_4", "file_path": "/Audio/sample1.wav"}'
    Should Contain    ${add_output}    Alert 'alert_4' added with file path '/Audio/sample1.wav
    Log    Predefined audio alert added successfully.

    # Step 2: Verify the alert exists in the list of predefined alerts
    ${list_output}=    Execute Command    curl -X GET "http://localhost/audio/predefined_audio_alerts"
    Should Contain    ${list_output}    "alert_4":"/Audio/sample1.wav"
    Log    Verified that alert_4 is present in the predefined audio alerts list.

    # Step 3: Remove the predefined audio alert
    ${remove_output}=    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_4"}'
    Should Contain    ${remove_output}    Alert 'alert_4' removed
    Log    Predefined audio alert removed successfully.

    # Step 4: Verify that the alert is no longer in the predefined alerts list
    ${list_after_removal}=    Execute Command    curl -X GET "http://localhost/audio/predefined_audio_alerts"
    Should Not Contain    ${list_after_removal}    "alert_4":"/Audio/sample1.wav"
    Log    Verified that alert_4 is no longer present in the predefined audio alerts list.

    # Observation
    Log    Observed API successfully removed the predefined audio alert.

Test Case 61: To verify the API's behavior when attempting to remove a non-existent predefined audio alert.
    [Documentation]    Verifying the API's response when trying to remove a non-existent audio alert.

    # Step 1: Attempt to remove a non-existent alert
    ${remove_output}=    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "invalid_alert"}'

    # Step 2: Validate API response
    Should Contain    ${remove_output}    error
    Should Contain    ${remove_output}    Invalid or missing alert ID
    Log    API correctly returned an error message for a non-existent alert.

    # Observation
    Log    Observed API correctly handled the removal of a non-existent alert.

Test Case 62: To verify the API's behavior when attempting to remove an alert multiple times consecutively.
     [Documentation]    Verifying API response when removing the same alert multiple times.
    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_5"}'
    # Step 1: Ensure the alert exists
    ${add_output}=    Execute Command    curl -X POST "http://localhost/audio/add_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_5", "file_path": "/Audio/sample1.wav"}'
    Should Contain    ${add_output}    Alert 'alert_5' added with file path '/Audio/sample1.wav
    Log    Predefined audio alert added successfully.

    # Step 2: Remove the alert
    ${remove_output}=    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_5"}'
    Should Contain    ${remove_output}    Alert 'alert_5' removed
    Log    Predefined audio alert removed successfully.

    # Step 3: Attempt to remove the same alert again
    ${remove_again_output}=    Execute Command    curl -X POST "http://localhost/audio/remove_predefined_alert" -H "Content-Type: application/json" -d '{"alert_id": "alert_5"}'
    Should Contain    ${remove_again_output}    error
    Should Contain    ${remove_again_output}    Invalid or missing alert ID
    Log    API correctly returned an error for a second removal attempt.

    # Observation
    Log    Observed API correctly handled multiple consecutive removal requests.

Test Case 63: To verify the API's ability to set a valid audio volume level.
    [Documentation]    Verifying the API's ability to set the audio volume when a valid value is provided.

    # Step 1: Set the volume to a valid level
    ${set_volume_output}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": -20}'

    # Step 2: Validate API response
    Should Contain    ${set_volume_output}    Volume set to -20
    Log    Volume successfully set to -20.

    # Observation
    Log    Observed API correctly set the volume to the requested level.


Test Case 64: To verify the API's behavior when setting the volume to maximum (0).
    [Documentation]    Verifying the API's response when setting the maximum volume level (0).

    # Step 1: Set volume to max (0)
    ${set_volume_output}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": 0}'

    # Step 2: Validate API response
    Should Contain    ${set_volume_output}    Volume set to 0
    Log    Volume successfully set to 0 (maximum).

    # Observation
    Log    Observed API correctly set the volume to the maximum level.

Test Case 65: To verify the API's behavior when setting the volume to minimum (-63).
    [Documentation]    Verifying the API's response when setting the minimum volume level (-63).

    # Step 1: Set volume to min (-63)
    ${set_volume_output}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": -63}'

    # Step 2: Validate API response
    Should Contain    ${set_volume_output}    Volume set to -63
    Log    Volume successfully set to -63 (minimum).

    # Observation
    Log    Observed API correctly set the volume to the minimum level.

Test Case 66: To verify the API's behavior when setting an out-of-range volume level (e.g., -70).
    [Documentation]    Verifying the API's response when setting an out-of-range volume level (-70).

    # Step 1: Attempt to set volume beyond the valid range
    ${set_volume_output}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": -70}'

    # Step 2: Validate API response
    Should Contain    ${set_volume_output}    Invalid volume level
    Log    API correctly rejected the invalid volume level.

    # Observation
    Log    Observed API correctly rejected an out-of-range volume setting.

Test Case 67: To verify the API's behavior when setting a non-numeric volume value.
    [Documentation]    Verifying the API's response when a non-numeric volume value is provided.

    # Step 1: Attempt to set a non-numeric volume value
    ${set_volume_output}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": "low"}'

    # Step 2: Validate API response
    Should Contain    ${set_volume_output}    Invalid volume level
    Log    API correctly rejected the non-numeric volume value.

    # Observation
    Log    Observed API correctly rejected a non-numeric volume input.

Test Case 68: To verify the API's response time when setting the volume multiple times rapidly.
    [Documentation]    Verifying API response time when setting the volume multiple times rapidly.

    # Step 1: Set different volume levels rapidly
    ${set_volume_1}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": -10}'
    ${set_volume_2}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": -30}'
    ${set_volume_3}=    Execute Command    curl -X POST "http://localhost/audio/set_volume" -H "Content-Type: application/json" -d '{"volume": -50}'

    # Step 2: Validate API response
    Should Contain    ${set_volume_1}    Volume set to -10
    Should Contain    ${set_volume_2}    Volume set to -30
    Should Contain    ${set_volume_3}    Volume set to -50
    Log    API correctly handled multiple volume changes.

    # Observation
    Log    Observed API handled rapid volume changes efficiently without errors.