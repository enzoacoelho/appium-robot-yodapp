*** Settings ***

Resource       ../resources/base.resource

*** Test Cases ***

Deve abrir a tela principal do app
   
    Start session

    Wait Until Page Contains            Yodapp
    Wait Until Page Contains            Mobile Training
    Wait Until Page Contains            by Papito

    Close session