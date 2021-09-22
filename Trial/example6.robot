*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Url}    https://reqres.in
${page_path}    $.page
${id_path}    $.id

*** Test Cases ***
post request demo
    create session    session1    ${Url}    disable_warnings=1
    ${endpoint}=    set variable    /api/users
    ${body}=    create dictionary    name=S    job=SE
    ${response}=    POST On Session    session1    ${endpoint}    data=${body}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #validations
    ${status_code}    convert to string    ${response.status_code}
    should be equal    ${status_code}    201

    ${json_response}=    convert string to json    ${response.content}
    ${contents}=    get value from json    ${json_response}    ${id_path}
    should not be empty    ${contents}

