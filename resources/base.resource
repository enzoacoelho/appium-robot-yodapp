*** Settings ***

Library          AppiumLibrary

*** Variables ***

${START}    QAX

*** Keywords ***

Start session
    Open Application    http://localhost:4723    
    ...                 platformName=Android
    ...                 automationName=UiAutomator2
    ...                 deviceName=R9XX801GP8Z
    ...                 platformVersion=15.0
    ...                 autoGrantPermissions=true
    ...                 app=${EXECDIR}/app/yodapp-beta.apk

Get started
    Wait Until Page Contains            ${START}    3    
    Click Text                          ${START}

Navigate to 
    [Arguments]                         ${item_text}
    ${icone_open_menu}       Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible      ${icone_open_menu}    2
    Click Element                      ${icone_open_menu} 

    ${menu_item}    Set Variable       xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${item_text}"]
    
    Wait Until Element Is Visible      ${menu_item}    2
    Click Element                      ${menu_item}

Go to item 
    [Arguments]         ${item}        ${checkpoint}
    Wait Until Page Contains           ${item}    2  
    Click Text                         ${item}
    Wait Until Page Contains           ${checkpoint}

Close session
    Close Application
