*** Settings ***
Library    RequestsLibrary

*** Variables ***
${Url}    https://www.google.com

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET    ${Url}
    log to console    ${response.status_code}
    log    ${response.content}



