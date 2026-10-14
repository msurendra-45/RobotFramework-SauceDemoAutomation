
*** Settings ***
Resource    common.resource

*** Variables ***
${CART_LINK}           class:shopping_cart_link
${CART_ITEM}           css:.cart_item
${CART_ITEM_NAME}      css:.inventory_item_name
${CART_ITEM_PRICE}     css:.inventory_item_price
${CART_QUANTITY}       css:.cart_quantity
${CHECKOUT_BUTTON}     id:checkout

*** Keywords ***
Open Shopping Cart
    Click Element    ${CART_LINK}
    Wait Until Element Is Visible    ${CART_ITEM}

Verify Backpack In Cart
    Element Text Should Be    ${CART_ITEM_NAME}    ${PRODUCT_NAME}
    Element Text Should Be    ${CART_ITEM_PRICE}    ${PRODUCT_PRICE}
    Element Text Should Be    ${CART_QUANTITY}    1

Proceed To Checkout
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Element Is Visible    id:first-name
