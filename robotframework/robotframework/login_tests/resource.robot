*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        chrome
${DELAY}          1
${VALID USER}     bank
${VALID PASSWORD} 123
${LOGIN URL}      http://${SERVER}/LoginPage
${WELCOME URL}    http://${SERVER}/DashboardPage
${ERROR URL}      http://${SERVER}/LoginPage

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Page Contains Element    css=input.w-96.min-h-12    timeout=10s

Input Username
    [Arguments]    ${username}
    Input Text    css=input.w-96.min-h-12    ${username}

Input Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    xpath=//input[@type='password']    timeout=10s
    Input Text    xpath=//input[@type='password']    ${password}

Submit Credentials
    Wait Until Element Is Visible    css=button.bg-primary    timeout=10s
    Click Button    css=button.bg-primary

Welcome Page Should Be Open
    Wait Until Page Contains    ลงรับหนังสือ    timeout=15s
    Location Should Be    ${WELCOME URL}
