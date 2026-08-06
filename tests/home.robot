*** Settings ***

Library          AppiumLibrary

*** Test Cases ***

Deve abrir a tela principal do app
   
    Open Application    http://localhost:4723    
    ...                 platformName=Android
    ...                 automationName=UiAutomator2
    ...                 deviceName=R9XX801GP8Z
    ...                 platformVersion=15.0
    ...                 autoGrantPermissions=true
    ...                 app=${EXECDIR}/app/yodapp-beta.apk

    Wait Until Page Contains            Yodapp
    Wait Until Page Contains            Mobile Training
    Wait Until Page Contains            by Papito

    Close Application