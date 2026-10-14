
*** Settings ***
Resource    common.resource

*** Variables ***
${LOGIN_USERNAME}    id:user-name
${LOGIN_PASSWORD}    id:password
${LOGIN_BUTTON}      id:login-button
${LOGIN_ERROR}       css:[data-test="error"]

*** Keywords ***
Login With Valid Credentials

    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${VALID_USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${VALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    css:.inventory_list
    Element Text Should Be    css:.title    Products

Login With Credentials
    [Arguments]    ${username}    ${password}
    Open SauceDemo
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${username}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    Click Button    ${LOGIN_BUTTON}
