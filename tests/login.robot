*** Settings ***

Resource       ../resources/base.resource

*** Variables ***
${ALERTA_ERRO}    id=com.qaxperience.yodapp:id/textinput_error
${msg_email_invalido}    Email válido você deve informar!
${msg_senha_invalida}    Uma senha você deve informar!
${msg_credenciais_incorretas}    Oops! Credenciais incorretas.
${email}    yoda@qax.com
${senha}    jedi


*** Test Cases ***

Deve logar com sucesso

    Start session

    Get started
    Navigate to    Formulários
    Go to item     Login     Login

    Input Text       id=com.qaxperience.yodapp:id/etEmail       ${email}
    Input Text       id=com.qaxperience.yodapp:id/etPassword    ${senha}
    Click Element    id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    Boas vindas, logado você está.

Não deve logar com senha incorreta

    Start session

    Get started
    Navigate to     Formulários
    Go to item      Login     Login

    Input Text       id=com.qaxperience.yodapp:id/etEmail        ${email}
    Input Text       id=com.qaxperience.yodapp:id/etPassword     ${senha}
    Click Element    id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    ${msg_credenciais_incorretas}   3

Não deve logar com email invalido

    Start session

    Get started
    Navigate to     Formulários
    Go to item   Login     Login

    Input Text       id=com.qaxperience.yodapp:id/etEmail        1234
    Input Text       id=com.qaxperience.yodapp:id/etPassword     ${senha}
    Click Element    id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Element Is Visible       ${ALERTA_ERRO} 
    ${mensagem_obtida}      Get Text    ${ALERTA_ERRO}

    Should Be Equal         ${mensagem_obtida}        ${msg_email_invalido} 

Não deve logar com senha vazia

    Start session

    Get started
    Navigate to     Formulários
    Go to item      Login     Login

    Input Text      id=com.qaxperience.yodapp:id/etEmail       ${email}
    Click Element   id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Element Is Visible         ${ALERTA_ERRO} 
    ${mensagem_obtida}      Get Text      ${ALERTA_ERRO}

    Should Be Equal     ${mensagem_obtida}    ${msg_senha_invalida}

Não deve logar com email vazio

    Start session

    Get started
    Navigate to     Formulários
    Go to item      Login     Login

    Input Text      id=com.qaxperience.yodapp:id/etPassword    ${senha}
    Click Element   id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Element Is Visible           ${ALERTA_ERRO} 
    ${mensagem_obtida}      Get Text        ${ALERTA_ERRO}

    Should Be Equal         ${mensagem_obtida}      ${msg_email_invalido} 
