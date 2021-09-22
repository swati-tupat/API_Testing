*** Settings ***
Documentation  These are some API tests
Resource  Trial/Example5/git.robot

*** Variables ***

*** Test Cases ***
Make a simple REST API call
    [Tags]  API
    Check Github Username
