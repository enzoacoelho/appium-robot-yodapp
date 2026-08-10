*** Settings ***

Resource       ../../resources/base.resource

*** Variables ***

${NOME}     Enzo
${EMAIL}    enzo@dev.com
${SENHA}    1234

${SELECIONAR_NIVEL}        id=com.qaxperience.yodapp:id/spinnerJob
${LISTA_NIVEIS}            class=android.widget.ListView

${CAMPO_NOME}              id=com.qaxperience.yodapp:id/etUsername
${CAMPO_EMAIL}             id=com.qaxperience.yodapp:id/etEmail 
${CAMPO_SENHA}             id=com.qaxperience.yodapp:id/etPassword
${BOTAO_CADASTRAR}         id=com.qaxperience.yodapp:id/btnSubmit

${MENSAGEM_BOAS_VINDAS}    Tudo certo, boas vindas ao Yodapp!

${ALERTA_ERRO}             id=com.qaxperience.yodapp:id/textinput_error

*** Test Cases ***

Deve cadastrar com sucesso

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Cadastro     Crie sua conta.

    Input Text                        ${CAMPO_NOME}        ${NOME}
    Input Text                        ${CAMPO_EMAIL}       ${EMAIL}
    Input Text                        ${CAMPO_SENHA}       ${SENHA}

    Click Element                     ${SELECIONAR_NIVEL} 
    Wait Until Element Is Visible     ${LISTA_NIVEIS} 
    Click Text                        Jedi
    
    Click Element                     ${BOTAO_CADASTRAR}

    Wait Until Page Contains          ${MENSAGEM_BOAS_VINDAS}

Não deve cadastrar com nome vazio

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Cadastro     Crie sua conta.

    Input Text                          ${CAMPO_EMAIL}       ${EMAIL}
    Input Text                          ${CAMPO_SENHA}       ${SENHA}

    Click Element                       ${SELECIONAR_NIVEL} 
    Wait Until Element Is Visible       ${LISTA_NIVEIS} 
    Click Text                          Jedi
    
    Click Element                       ${BOTAO_CADASTRAR}

    Wait Until Element Is Visible       ${ALERTA_ERRO} 
    ${msg_obtida}      Get Text         ${ALERTA_ERRO} 
    Should Be Equal    ${msg_obtida}    Seu nome você deve informar!

Não deve cadastrar com email vazio

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Cadastro     Crie sua conta.

    Input Text                          ${CAMPO_NOME}        ${NOME}
    Input Text                          ${CAMPO_SENHA}       ${SENHA}

    Click Element                       ${SELECIONAR_NIVEL} 
    Wait Until Element Is Visible       ${LISTA_NIVEIS} 
    Click Text                          Jedi
    
    Click Element                       ${BOTAO_CADASTRAR}

    Wait Until Element Is Visible       ${ALERTA_ERRO} 
    ${msg_obtida}      Get Text         ${ALERTA_ERRO} 
    Should Be Equal    ${msg_obtida}    Email válido você deve informar!

Não deve cadastrar com email inválido

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Cadastro     Crie sua conta.

    Input Text                          ${CAMPO_NOME}        ${NOME}
    Input Text                          ${CAMPO_EMAIL}       1234
    Input Text                          ${CAMPO_SENHA}       ${SENHA}

    Click Element                       ${SELECIONAR_NIVEL} 
    Wait Until Element Is Visible       ${LISTA_NIVEIS} 
    Click Text                          Jedi
    
    Click Element                       ${BOTAO_CADASTRAR}

    Wait Until Element Is Visible       ${ALERTA_ERRO} 
    ${msg_obtida}      Get Text         ${ALERTA_ERRO} 
    Should Be Equal    ${msg_obtida}    Email válido você deve informar!

Não deve cadastrar com senha vazia

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Cadastro     Crie sua conta.

    Input Text                        ${CAMPO_NOME}        ${NOME}
    Input Text                        ${CAMPO_EMAIL}       ${EMAIL}

    Click Element                     ${SELECIONAR_NIVEL} 
    Wait Until Element Is Visible     ${LISTA_NIVEIS} 
    Click Text                        Jedi
    
    Click Element                     ${BOTAO_CADASTRAR}

    Wait Until Element Is Visible       ${ALERTA_ERRO} 
    ${msg_obtida}      Get Text         ${ALERTA_ERRO} 
    Should Be Equal    ${msg_obtida}    Uma senha você deve informar!
