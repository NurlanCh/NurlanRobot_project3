*** Settings ***
Library    SeleniumLibrary
Documentation    Expliquer la mechanisme d'attente statique et dynamique
...    (Sleep, explicit wait, implicit wait)

*** Variables ***
${URL}    https://demowebshop.tricentis.com/register
${BROWSER}    chrome

*** Test Cases ***
Test synchronisation


*** Keywords ***



//input[@id='gender-male']