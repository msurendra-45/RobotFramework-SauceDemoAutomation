*** Settings ***
Documentation     SauceDemo E2E tests
Resource          ../resources/common.resource
Resource          ../resources/login.resource
Resource          ../resources/products.resource
Resource          ../resources/cart.resource
Resource          ../resources/checkout.resource

Suite Setup       Open SauceDemo
Suite Teardown    Close All Browsers

*** Test Cases ***
TC01_Login_With_Valid_Credentials
    Login With Valid Credentials

TC02_Verify_Product_Name_And_Price

    Verify Backpack Details

TC03_Add_Product_To_Cart


    Click Button    id:add-to-cart-sauce-labs-backpack

    Wait Until Element Is Visible
    ...    css:.shopping_cart_badge
    ...    timeout=10s

    Element Text Should Be
    ...    css:.shopping_cart_badge
    ...    1

    Log To Console    Product added to cart successfully

TC04_Verify_Shopping_Cart


   # Click Button    id:add-to-cart-sauce-labs-backpack
    Click Element    class:shopping_cart_link

    Wait Until Element Is Visible
    ...    css:.cart_item
    ...    timeout=10s

    Element Text Should Be
    ...    css:.inventory_item_name
    ...    ${PRODUCT_NAME}

    Element Text Should Be
    ...    css:.inventory_item_price
    ...    ${PRODUCT_PRICE}

    Element Text Should Be
    ...    css:.cart_quantity
    ...    1

    Log To Console    Cart details verified

TC05_Verify_Checkout_Information

    #Add Backpack And Open Cart
    Click Button    id:checkout

    Wait Until Element Is Visible
    ...    id:first-name
    ...    timeout=10s

    Input Text    id:first-name    ${FIRST_NAME}
    Input Text    id:last-name    ${LAST_NAME}
    Input Text    id:postal-code    ${POSTAL_CODE}

    Click Button    id:continue

    Wait Until Element Is Visible
    ...    css:.checkout_summary_container
    ...    timeout=10s

    Element Text Should Be
    ...    css:.inventory_item_name
    ...    ${PRODUCT_NAME}

    Element Text Should Be
    ...    css:.inventory_item_price
    ...    ${PRODUCT_PRICE}

    Page Should Contain    Payment Information
    Page Should Contain    Shipping Information

    Log To Console    Checkout overview verified

TC06_Complete_Order_And_Verify_Confirmation

#    #Add Backpack And Open Cart
#    Scroll Element Into View    id:checkout
#    Click Button    id:checkout
#
#    Input Text    id:first-name    ${FIRST_NAME}
#    Input Text    id:last-name    ${LAST_NAME}
#    Input Text    id:postal-code    ${POSTAL_CODE}
#
#    Click Button    id:continue

    Wait Until Element Is Visible
    ...    id:finish
    ...    timeout=10s

    Element Text Should Be
    ...    css:.inventory_item_name
    ...    ${PRODUCT_NAME}

    Click Button    id:finish

    Wait Until Element Is Visible
    ...    css:.complete-header
    ...    timeout=10s

    Element Text Should Be
    ...    css:.complete-header
    ...    Thank you for your order!

    Page Should Contain    Your order has been dispatched

    Capture Page Screenshot
    Log To Console    Order completed successfully

*** Keywords ***

Login To SauceDemo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    Wait Until Element Is Visible
    ...    id:user-name
    ...    timeout=15s

    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button

    Wait Until Element Is Visible
    ...    css:.inventory_list
    ...    timeout=15s

Add Backpack And Open Cart
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Element    class:shopping_cart_link

    Wait Until Element Is Visible
    ...    css:.cart_item
    ...    timeout=10s
