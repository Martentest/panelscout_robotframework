*** Settings ***
Library    SeleniumLibrary
Documentation   Suite description #automated tests for scout website
Library SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://dareit.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[(text()='Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${ADDPLAYER_Button}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a/button
${PAGE_ADDPLAYER}       xpath=//*[@title='Logo Scouts Panel']

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
#    Assert dashboard
    [Teardown]    Close Browser

Check login title
    Open login page
    Assert dashboard
    [Teardown]    Close Browser

Check dashboard title
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

Go to Add Player page
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on The AddPlayer button
    Assert add_player
    [Teardown]    Close Browser

Check Add Player title
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on The AddPlayer button
    Assert add_player
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element       xpath=//*[(text()= 'Sign in')]
Assert dashboard
    wait until element is visible       ${PAGELOGO}
    title should be     Scouts panel
    Capture Page Screenshot     alert.png
Click on The AddPlayer button
    Wait Until Element Is Visible       ${ADDPLAYER_Button}
    Click Element       ${ADDPLAYER_Button}
Assert add_player
    Title Should Be     Add player
    Capture Page Screenshot     alert.png
