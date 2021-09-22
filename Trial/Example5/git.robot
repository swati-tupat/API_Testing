*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library  # only used to display something we get back from API test

*** Variables ***
${Url}    https://api.github.com
*** Keywords ***
Check Github Username
    # Create the Session
    Create Session  my_github_session  ${Url}

    # Make the call (and capture the response in a variable)
    ${response} =  Get Request  my_github_session  users/robotframeworktutorial

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}  200

    # Check the Response body
    ${json} =  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${json['login']}  robotframeworktutorial
    Log  ${json}
