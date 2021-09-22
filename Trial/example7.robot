*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${Url}=    http://thetestingworldapi.com/

*** Test Cases ***
deleting resource
    create session    DeleteData    ${Url}
    ${response}=    DELETE On Session    DeleteData    /api/studentsDetails/453427
    log to console    ${response.status_code}
    log to console    ${response.content}

    ${json_response}=    to json    ${response.content}
    ${status_list}=    JSONLibrary.Get Value From Json    ${json_response}    status
    ${msg}=    get from list    ${status_list}    0
    should be equal    ${msg}    true

