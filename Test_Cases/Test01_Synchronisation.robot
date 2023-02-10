*** Settings ***
Library    SeleniumLibrary
Documentation    Expliquer la mechanisme d'attente statique et dynamique
...    (Sleep, explicit wait, implicit wait)
Test Setup    Lancer le navigateur
Test Teardown    Close Browser

*** Variables ***
${URL}    https://demowebshop.tricentis.com/register
${BROWSER}    chrome
${vGenre}    M

*** Test Cases ***
Test synchronisation
    ##   ${Attente1}=    Get Selenium Timeout
    ##   Log To Console    ${Attente1}

    ## Set Selenium Timeout    10

    ##     ${Attente1}=    Get Selenium Timeout
    ##     Log To Console    ${Attente1}

    #Set Selenium Speed    2

    #${Attente}=    Get Selenium Implicit Wait 
    #Log To Console    ${Attente}   
    
    ### Set Selenium Implicit Wait    20
    When Selectionner un genre    ${vGenre}
    #Sleep    60
    Wait Until Element Is Visible    id:FirstName
    And Saisir first name
    And Saisir last name
    And Saisir email
    And Saisir password
    And Confirmer password
    And Cliquer enregistrer
    Then Valider que le message de confirmation d'enregistrement est affiche


*** Keywords ***
Lancer le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
Selectionner un genre
    [Arguments]    ${Genre}
    Select Radio Button    Gender    ${vGenre}
Saisir first name
    Clear Element Text    id:FirstName
    Input Text    id:FirstName    Nurlan7
Saisir last name
    Clear Element Text    id:LastName
    Input Text    id:LastName    Chulakov7
Saisir email
    Clear Element Text    id:Email
    Input Text    id:Email    chulakov7@yahoo.com
Saisir password
    Clear Element Text    id:Password
    Input Text    id:Password    12345678
Confirmer password
    Clear Element Text    id:ConfirmPassword
    Input Text    id:ConfirmPassword    12345678
Cliquer enregistrer
    Click Element    id:register-button
Valider que le message de confirmation d'enregistrement est affiche
    Page Should Contain    Your registration completed