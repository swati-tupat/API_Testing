*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${Url}    https://www.google.com

*** Test Cases ***

Quick Get Request Test
    session creation
    ${response}=    GET On Session    get_request    about.html
    log to console    ${response.status_code}
    log    ${response.content}
    log to console    ${response.history}
    log     ${response.headers}

validations
    session creation
    ${response}=    GET On Session    get_request    about.html

    ${Status_code}=    convert to string    ${response.status_code}
    should be equal    ${Status_code}    200

    ${Body}=   convert to string  ${response.content}
    should contain    ${Body}    Google

    ${content_type_value}=    get from dictionary    ${response.headers}    Content-Type
    should be equal    ${content_type_value}    text/html

*** Keywords ***
session creation
    create session    get_request    ${Url}
