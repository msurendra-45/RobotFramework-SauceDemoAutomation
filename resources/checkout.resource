
*** Settings ***
Resource    common.resource

*** Variables ***
${CHECKOUT_FIRST_NAME}    id:first-name
${CHECKOUT_LAST_NAME}     id:last-name
${CHECKOUT_POSTAL_CODE}   id:postal-code
${CONTINUE_BUTTON}        id:continue
${FINISH_BUTTON}          id:finish
${SUMMARY_CONTAINER}      css:.checkout_summary_container
${CONFIRMATION_HEADER}    css:.complete-header

*** Keywords ***
Enter Checkout Information
    Input Text    ${CHECKOUT_FIRST_NAME}    ${FIRST_NAME}
    Input Text    ${CHECKOUT_LAST_NAME}     ${LAST_NAME}
    Input Text    ${CHECKOUT_POSTAL_CODE}   ${POSTAL_CODE}
    Click Button    ${CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${SUMMARY_CONTAINER}

Verify Checkout Overview
    Element Text Should Be    css:.inventory_item_name    ${PRODUCT_NAME}
    Element Text Should Be    css:.inventory_item_price    ${PRODUCT_PRICE}
    Page Should Contain    Payment Information
    Page Should Contain    Shipping Information

Finish Order
    Click Button    ${FINISH_BUTTON}
    Wait Until Element Is Visible    ${CONFIRMATION_HEADER}
    Element Text Should Be
    ...    ${CONFIRMATION_HEADER}
    ...    Thank you for your order!
    Page Should Contain    Your order has been dispatched
