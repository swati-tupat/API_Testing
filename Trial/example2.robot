*** Settings ***
Library    RequestsLibrary

*** Variables ***
${Url}    https://www.google.com

*** Test Cases ***

Quick Get Request Test
    create session    get_request    ${Url}
    ${response}=    GET On Session    get_request    about.html
    log to console    ${response.status_code}
    log    ${response.content}
    log to console    ${response.history}



