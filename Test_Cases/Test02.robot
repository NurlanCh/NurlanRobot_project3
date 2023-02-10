*** Settings ***
Library    SeleniumLibrary
Documentation    Expliquer 
Test Setup    Lancer le navigateur
Test Teardown    Close Browser

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome


*** Test Cases ***
Test Reserver une demo gratuite
    Cliquer le lien OrangeHRM.Inc
    Switcher vers une autre fenetre
    Reserver sur une demo gratuite
    

*** Keywords ***
Lancer le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10
Cliquer le lien OrangeHRM.Inc
    Set Selenium Timeout    10
    Sleep     5
    Click Element    xpath://a[@href='http://www.orangehrm.com' and text()='OrangeHRM, Inc']             
Switcher vers une autre fenetre
    @{ListFenetres}=    Get Window Handles
    Log To Console    @{ListFenetres}
    Switch Window    ${ListFenetres}[1]
Reserver sur une demo gratuite
    Click Button    xpath://div[@class='d-flex web-menu-btn']//button[@class='btn btn-ohrm btn-contact-sales']
    Input text    id:Form_getForm_FullName    Nurla
    Input Text    css:#Form_getForm_Email    chulakov11@yahoo.com
    Input Text    css:#Form_getForm_Contact    5142223333
    #Wait Until Element Is Visible    css:#Form_getForm_Country
    #Click Element    //select[@id='Form_getForm_Country']            #css:#Form_getForm_Country
    #Click Element    xpath://option[@value='Canada']
    #Click Element    //div[@class='recaptcha-checkbox-border']
    #Sleep    3
    
    Click Element    xpath://input[@value='Submit' and @id='Form_getForm_action_submitForm']
    Page Should Contain    See the endless posibilities with OrangeHRM.

