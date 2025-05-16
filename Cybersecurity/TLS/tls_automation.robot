*** Settings ***
Library           Process
Library           OperatingSystem
Suite Setup       Generate Test Certificates
Suite Teardown    Cleanup Certificates

*** Variables ***
${SERVER_IP}      127.0.0.1
${SERVER_PORT}     4433
${GOOGLE_HOST}     google.com
${CERT_DIR}       ${CURDIR}${/}certs

*** Keywords ***
Generate Test Certificates
    [Documentation]    Generate self-signed and expired certificates.
    Create Directory    ${CERT_DIR}
    # Generate self-signed certificate
    Run Process    openssl    req    -x509    -newkey    rsa:4096    -nodes    -keyout    ${CERT_DIR}${/}self_signed_key.pem
    ...    -out    ${CERT_DIR}${/}self_signed_cert.pem    -days    1    -subj    /CN=self-signed-server
    # Generate expired certificate
    Run Process    openssl    req    -x509    -newkey    rsa:4096    -nodes    -keyout    ${CERT_DIR}${/}expired_key.pem
    ...    -out    ${CERT_DIR}${/}expired_cert.pem    -days    -1    -subj    /CN=expired-server

Cleanup Certificates
    [Documentation]    Remove generated certificates.
    Remove Directory    ${CERT_DIR}    recursive=True

Start TLS Server
    [Arguments]    ${cert}    ${key}    ${options}=${EMPTY}
    [Documentation]    Start a local TLS server with specified cert and options.
    ${server_process}=    Start Process    openssl    s_server    -cert    ${cert}    -key    ${key}
    ...    -accept    ${SERVER_PORT}    ${options}    stderr=STDOUT
    Sleep    2s    # Wait for server to start
    [Return]    ${server_process}

Stop TLS Server
    [Arguments]    ${server_process}
    [Documentation]    Terminate the TLS server process.
    Terminate Process    ${server_process}

Run OpenSSL Client
    [Arguments]    ${options}
    [Documentation]    Run openssl s_client and return output.
    ${result}=    Run Process    openssl    s_client    -connect    ${SERVER_IP}:${SERVER_PORT}    ${options}
    ...    stdout=stdout.txt    stderr=stderr.txt    shell=True
    ${output}=    Get File    stdout.txt
    Append To File    combined.log    ${output}
    [Return]    ${output}

*** Test Cases ***
TC_TLS_01: Verify TLS 1.3 Implementation
    [Documentation]    Client connects via TLS 1.3 to Google (replace with internal server if needed).
    ${output}=    Run Process    openssl    s_client    -connect    ${GOOGLE_HOST}:443    -tls1_3
    ...    stdout=stdout.txt    stderr=stderr.txt    shell=True
    Should Contain    ${output.stdout}    TLSv1.3

TC_TLS_02: Validate AES-256-GCM Cipher Suite
    [Documentation]    Force AES-256-GCM cipher in TLS 1.3.
    ${output}=    Run Process    openssl    s_client    -connect    ${GOOGLE_HOST}:443    -tls1_3    -cipher    TLS_AES_256_GCM_SHA384
    ...    stdout=stdout.txt    stderr=stderr.txt    shell=True
    Should Contain    ${output.stdout}    Cipher    :    TLS_AES_256_GCM_SHA384

TC_TLS_03: Validate SHA-384 Hash Algorithm
    [Documentation]    Confirm SHA-384 is used in TLS 1.3.
    ${output}=    Run Process    openssl    s_client    -connect    ${GOOGLE_HOST}:443    -tls1_3
    ...    stdout=stdout.txt    stderr=stderr.txt    shell=True
    Should Contain    ${output.stdout}    Signature Algorithm: sha384WithRSAEncryption

TC_TLS_04: Support TLS 1.2 and 1.3
    [Documentation]    Test both TLS 1.2 and 1.3.
    ${output}=    Run Process    openssl    s_client    -connect    ${GOOGLE_HOST}:443    -tls1_2
    ...    stdout=stdout.txt    stderr=stderr.txt    shell=True
    Should Contain    ${output.stdout}    TLSv1.2
    ${output}=    Run Process    openssl    s_client    -connect    ${GOOGLE_HOST}:443    -tls1_3
    ...    stdout=stdout.txt    stderr=stderr.txt    shell=True
    Should Contain    ${output.stdout}    TLSv1.3

TC_TLS_05: Reject TLS 1.1 or Lower
    [Documentation]    Connection with TLS 1.1 must fail.
    ${server_process}=    Start TLS Server    ${CERT_DIR}${/}self_signed_cert.pem    ${CERT_DIR}${/}self_signed_key.pem    -tls1_1
    ${output}=    Run OpenSSL Client    -tls1_1
    Should Contain    ${output}    no protocols available
    Stop TLS Server    ${server_process}

TC_TLS_06: Reject Weak Cipher Suites
    [Documentation]    Force weak cipher (AES128-SHA).
    ${server_process}=    Start TLS Server    ${CERT_DIR}${/}self_signed_cert.pem    ${CERT_DIR}${/}self_signed_key.pem    -tls1_2
    ${output}=    Run OpenSSL Client    -cipher AES128-SHA
    Should Contain    ${output}    no cipher match
    Stop TLS Server    ${server_process}

TC_TLS_07: Reject Expired Certificates
    [Documentation]    Test with an expired certificate.
    ${server_process}=    Start TLS Server    ${CERT_DIR}${/}expired_cert.pem    ${CERT_DIR}${/}expired_key.pem    -tls1_3
    ${output}=    Run OpenSSL Client    -tls1_3
    Should Contain    ${output}    certificate has expired
    Stop TLS Server    ${server_process}

TC_TLS_08: Reject Self-Signed Certificates
    [Documentation]    Test untrusted self-signed cert.
    ${server_process}=    Start TLS Server    ${CERT_DIR}${/}self_signed_cert.pem    ${CERT_DIR}${/}self_signed_key.pem    -tls1_3
    ${output}=    Run OpenSSL Client    -tls1_3
    Should Contain    ${output}    self-signed certificate
    Stop TLS Server    ${server_process}