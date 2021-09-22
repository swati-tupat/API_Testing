*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${Url}=    http://thetestingworldapi.com/

*** Test Cases ***
adding new resource using post
    create session    AddData    ${Url}
    ${body}    create dictionary    first_name=s    middle_name=B    last_name=C    date_of_birth=24
    ${response}=    post on session    AddData    /api/studentsDetails    data=${body}
    log to console    ${response.status_code}
    log to console    ${response.content}
