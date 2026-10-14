
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}         https://www.saucedemo.com/
${BROWSER}          chrome
${VALID_USERNAME}   standard_user
${VALID_PASSWORD}   secret_sauce
${FIRST_NAME}       Test
${LAST_NAME}        User
${POSTAL_CODE}      500001
${PRODUCT_NAME}     Sauce Labs Backpack
${PRODUCT_PRICE}    $29.99

*** Keywords ***
Open SauceDemo
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${FALSE}
    ...    profile.password_manager_enabled=${FALSE}
    ...    profile.password_manager_leak_detection=${FALSE}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    10s
    Set Selenium Speed    0.5s
