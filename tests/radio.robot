*** Settings ***

Resource       ../resources/base.resource

*** Test Cases ***

Deve nagevar até tasks de checkbox e marcar linguagem preferida

    Start session
    Get started
    Navigate to     Check e Radio
    Go to item      Botões de radio           Botões de Radio
   
    Click Element      //android.widget.RadioButton[@resource-id="com.qaxperience.yodapp:id/radioButton" and @text="Javascript "]

    Sleep    3
    Close session