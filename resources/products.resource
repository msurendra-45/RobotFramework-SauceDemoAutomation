
*** Settings ***
Resource    common.resource

*** Variables ***
${INVENTORY_LIST}       css:.inventory_list
${PRODUCTS_TITLE}       css:.title
${BACKPACK_NAME}        id:item_4_title_link
${BACKPACK_PRICE}       xpath://div[@class="inventory_item"][.//div[normalize-space()="Sauce Labs Backpack"]]//div[@class="inventory_item_price"]
${ADD_BACKPACK_BUTTON}  id:add-to-cart-sauce-labs-backpack

*** Keywords ***
Verify Products Page
    Wait Until Element Is Visible    ${INVENTORY_LIST}
    Element Text Should Be    ${PRODUCTS_TITLE}    Products

Verify Backpack Details
    Element Text Should Be    ${BACKPACK_NAME}    ${PRODUCT_NAME}
    Element Text Should Be    ${BACKPACK_PRICE}    ${PRODUCT_PRICE}

Add Backpack To Cart
    Click Button    ${ADD_BACKPACK_BUTTON}
    Wait Until Element Is Visible    css:.shopping_cart_badge
    Element Text Should Be    css:.shopping_cart_badge    1
