*** Settings ***

Resource     ../resources/base.resource

*** Variables ***

${CAMPO_EMAIL}    id=com.qaxperience.yodapp:id/etEmail 
${CAMPO_SENHA}    id=com.qaxperience.yodapp:id/etPassword 
${BOTAO_LOGIN}    id=com.qaxperience.yodapp:id/btnSubmit

${ALERTA_ERRO}          id=com.qaxperience.yodapp:id/textinput_error
${EMAIL_INVALIDO}   Email válido você deve informar!
${SENHA_INVALIDA}   Uma senha você deve informar!
${CREDENCIAIS_INCORRETAS}   Oops! Credenciais incorretas.

${EMAIL}    yoda@qax.com
${SENHA}    jedi


*** Test Cases ***

Deve logar com sucesso

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Login     Olá Padawan, vamos testar o login?

    Input Text       ${CAMPO_EMAIL}        ${EMAIL}
    Input Text       ${CAMPO_SENHA}        ${SENHA}
    Click Element    ${BOTAO_LOGIN}

    Wait Until Page Contains    Boas vindas, logado você está.

Não deve logar com senha incorreta

    Start session

    Get started
    Navigate to     Formulários
    Go to item      Login     Login

    Input Text       ${CAMPO_EMAIL}        ${EMAIL}
    Input Text       ${CAMPO_SENHA}        ${SENHA}
    Click Element    ${BOTAO_LOGIN}

    Wait Until Page Contains    ${CREDENCIAIS_INCORRETAS}   3

Não deve logar com email invalido

    Start session

    Get started
    Navigate to     Formulários
    Go to item   Login     Login

    Input Text       ${CAMPO_EMAIL}         1234
    Input Text       ${CAMPO_SENHA}         ${SENHA}
    Click Element    ${BOTAO_LOGIN}

    Wait Until Element Is Visible       ${ALERTA_ERRO} 
    ${mensagem_obtida}      Get Text    ${ALERTA_ERRO}

    Should Be Equal         ${mensagem_obtida}        ${EMAIL_INVALIDO} 

Não deve logar com senha vazia

    Start session

    Get started
    Navigate to     Formulários
    Go to item      Login     Login

    Input Text      ${CAMPO_EMAIL}        ${EMAIL}
    Click Element   ${BOTAO_LOGIN}

    Wait Until Element Is Visible         ${ALERTA_ERRO} 
    ${mensagem_obtida}      Get Text      ${ALERTA_ERRO}

    Should Be Equal     ${mensagem_obtida}    ${SENHA_INVALIDA}

Não deve logar com email vazio

    Start session

    Get started
    Navigate to     Formulários
    Go to item      Login     Login

    Input Text      ${CAMPO_SENHA}    ${SENHA}
    Click Element   ${BOTAO_LOGIN}

    Wait Until Element Is Visible           ${ALERTA_ERRO} 
    ${mensagem_obtida}      Get Text        ${ALERTA_ERRO}

    Should Be Equal         ${mensagem_obtida}      ${EMAIL_INVALIDO} 
