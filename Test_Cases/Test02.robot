*** Settings ***
Library    SeleniumLibrary
Documentation    Expliquer 
Test Setup    Lancer le navigateur
Test Teardown    Close Browser

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome


*** Test Cases ***
Test01
    Cliquer le lien OrangeHRM.Inc
    Switcher vers une autre fenetre
#Reserver sur une demo gratuite
    

*** Keywords ***
Lancer le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    3
Cliquer le lien OrangeHRM.Inc
    Click Element    xpath://a[@href='http://www.orangehrm.com']
    Sleep    4
    Input Text    id:placeholder    text
Switcher vers une autre fenetre
    @{ListWindows}=    Get Window Handles
    Log To Console    @{ListWindows}
    Switch Window    ${ListWindows}[1]
#Reserver sur une demo gratuite
  #  Click Button    
  #  Input text
   # Click Element    locator
