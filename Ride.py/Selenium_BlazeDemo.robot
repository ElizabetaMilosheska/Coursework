*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://blazedemo.com
${BROWSER}        chrome

*** Test Cases ***
tc_dropdown
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Select From List By Value    name:fromPort    Boston
    Select From List By Value    name:toPort    London
    Click Button    xpath://html/body/div[3]/form/div/input
    Close Browser

tc_choose_flight
    openwebsite
    Select From List By Value    name:fromPort    Boston
    Select From List By Value    name:toPort    London
    Click Button    xpath://html/body/div[3]/form/div/input
    Click Button    xpath://html/body/div[2]/table/tbody/tr[1]/td[1]/input
    Close Browser

tc_submit_the_form
    openwebsite
    Select From List By Value    name:fromPort    Boston
    Select From List By Value    name:toPort    London
    Click Button    xpath://html/body/div[3]/form/div/input
    Wait Until Element Is Visible    xpath://html/body/div[2]/h3
    Click Button    xpath://html/body/div[2]/table/tbody/tr[1]/td[1]/input
    Input Text    name:inputName    Elizabeta Milosheska
    Input Text    id:address    123 Main Street
    Input Text    id:city    London
    Input Text    id:state    England
    Input Text    id:zipCode    12345
    Select From List By Value    id:cardType    visa
    Input Text    id:creditCardNumber    123456
    Input Text    id:creditCardMonth    10
    Input Text    id:creditCardYear    2025
    Input Text    id:nameOnCard    Elizabeta Milosheska
    Select Checkbox    id:rememberMe
    Click Button    xpath://html/body/div[2]/form/div[11]/div/input
    Wait Until Element Is Visible    xpath://html/body/div[2]/div/h1
    Close Browser

tc_login
    openwebsite
    Click Element    xpath://html/body/div[1]/div/div/a[3]
    Input Text    id:email    biba407@ibtrades.com
    Input Password    id:password    14407
    Select Checkbox    name:remember
    Click Button    xpath://html/body/div/div/div/div/div/div[2]/form/div[4]/div/button
    Wait Until Element Is Visible    xpath://html/body/div/div[2]
    ${got}=    Get Text    class:message
    Log    ${got}
    Should be equal    Page Expired    ${got}
    Close Browser

tc_register
    openwebsite
    Click Element    xpath://html/body/div[1]/div/div/a[3]
    Click Element    xpath://html/body/div/nav/div/div[2]/ul[2]/li[2]/a
    Wait Until Element Is Visible    xpath://html/body/div/div/div/div/div/div[1]
    Input Text    id:name    Elizabeta
    Input Text    id:company    Unknown
    Input Text    id:email    secretemail@gmail.com
    Input Password    id:password    123secret
    Input Password    id:password-confirm    123secret
    Click Button    xpath://html/body/div/div/div/div/div/div[2]/form/div[6]/div/button
    Close Browser

tc_destination_of_the_week
    openwebsite
    Click Link    xpath://html/body/div[2]/div/p[2]/a
    Page Should Contain Image    class:img-rounded
    Close Browser

tc_forgot_password
    openwebsite
    Click Element    xpath://html/body/div[1]/div/div/a[3]
    Click Link    xpath://html/body/div/div/div/div/div/div[2]/form/div[4]/div/a
    Input Text    id:email    secretemail@gmail.com
    Click Button    xpath://html/body/div/div/div/div/div/div[2]/form/div[2]/div/button
    ${got}=    Get Text    class:message
    Log    ${got}
    Should be equal    Page Expired    ${got}
    Close Browser

*** Keywords ***
openwebsite
    Open Browser    https://blazedemo.com    chrome
    Maximize Browser Window
