*** Settings ***

Library          AppiumLibrary

*** Variables ***

${START}    QAX

*** Test Cases ***

Deve realizar um clique simples

    # Step 1 - Star session
    Open Application    http://localhost:4723    
    ...                 platformName=Android
    ...                 automationName=UiAutomator2
    ...                 deviceName=R9XX801GP8Z
    ...                 platformVersion=15.0
    ...                 autoGrantPermissions=true
    ...                 app=${EXECDIR}/app/yodapp-beta.apk

    # Step 2 - Get started
    Wait Until Page Contains            ${START}    3    
    Click Text                          ${START}

    # Step 3 - Navigate to
    ${icone_open_menu}       Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible      ${icone_open_menu}    3
    Click Element                      ${icone_open_menu} 

    ${menu_item}    Set Variable       xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Clique em Botões"]
    
    Wait Until Element Is Visible      ${menu_item}    3
    Click Element                      ${menu_item}

    # Step 4 - Go to item clique simples
    Wait Until Page Contains           Clique simples    3  
    Click Text                         Clique simples
    Wait Until Page Contains           Botão clique simples

    # Step 5 - Test body
    Click Text                         CLIQUE SIMPLES
    Wait Until Page Contains           Isso é um clique simples

    # Step 6 - Close session
    Close Application

