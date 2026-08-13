# 📱 Automação Mobile com Appium & Robot Framework — Yoda App

Projeto de automação de testes mobile para Android utilizando o **Yoda App**, aplicação fornecida durante meu curso de automação mobile, desenvolvido com **Robot Framework** e **AppiumLibrary**.

## 📲 Aplicativo sob Teste

Os testes foram construídos sobre o **Yoda App**, aplicativo Android disponibilizado pelo curso para praticar cenários comuns de automação mobile: navegação, formulários, cliques, checkboxes e radio buttons.

O arquivo `.apk` (`yodapp-beta.apk`) está localizado na pasta `app/` deste repositório.

## 📌 Funcionalidades Testadas

Os testes estão organizados por funcionalidade dentro da pasta `tests/`:

* **`homepage/`** — Navegação inicial e validações da tela principal.
* **`clicks/`** — Interações simples com botões e elementos clicáveis.
* **`formularios/`** — Preenchimento de campos de texto e validação de dados inseridos.
* **`check_radio/`** — Seleção de checkboxes e radio buttons.
* **`star_wars/`** — Cenários envolvendo a seção temática de Star Wars do app.

## 🛠️ Tecnologias e Ferramentas

* **Framework de Testes:** Robot Framework
* **Biblioteca de Automação Mobile:** AppiumLibrary
* **Linguagem base:** Python
* **Driver Mobile:** Appium (com UiAutomator2)
* **Organização:** Keywords reutilizáveis centralizadas em `resources/base.resource`

## 🏗️ Estrutura do Projeto

```
appium-robot-yodapp/
├── app/                  # APK do Yoda App (yodapp-beta.apk)
├── logs/                 # Relatórios gerados após a execução (log.html, output.xml, report.html)
├── resources/
│   └── base.resource     # Keywords compartilhadas: abertura/fechamento de sessão, navegação
└── tests/
    ├── check_radio/
    ├── clicks/
    ├── formularios/
    ├── homepage/
    └── star_wars/
```

O arquivo `resources/base.resource` centraliza as keywords principais usadas em todos os testes, entre elas:

* `Start session` — inicia a sessão do Appium com as capabilities do dispositivo/emulador.
* `Get started` — aguarda e clica na tela inicial do app.
* `Navigate to` — abre o menu de navegação e acessa um item específico.
* `Go to item` — navega até um item e valida um checkpoint na tela seguinte.
* `Close session` — encerra a sessão do Appium.

## 🚀 Como Executar o Projeto Localmente

### Pré-requisitos

1. Python 3.8 ou superior
2. Java JDK (com a variável de ambiente `JAVA_HOME` configurada)
3. Android Studio (com SDK e Emulador configurados, `ANDROID_HOME` definido) — ou um dispositivo físico com depuração USB habilitada
4. Node.js (necessário para o Appium Server)
5. Appium Server instalado globalmente (`npm i -g appium`) e o driver Android instalado (`appium driver install uiautomator2`)

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/enzoacoelho/appium-robot-yodapp.git
   cd appium-robot-yodapp
   ```

2. **Crie um ambiente virtual (opcional, mas recomendado):**
   ```bash
   python -m venv venv
   source venv/bin/activate   # Linux/Mac
   venv\Scripts\activate      # Windows
   ```

3. **Instale as dependências Python:**
   ```bash
   pip install robotframework robotframework-appiumlibrary
   ```

4. **Configure seu emulador ou dispositivo Android:**

   Inicie um emulador pelo Android Studio, ou conecte um dispositivo físico com depuração USB habilitada. Rode `adb devices` para confirmar que ele está visível e anote o `deviceName`/UDID exibido.

5. **Ajuste as capabilities em `resources/base.resource`:**

   ⚠️ **Importante:** a keyword `Start session` está configurada com o dispositivo usado no desenvolvimento original (`deviceName=R9XX801GP8Z`, `platformVersion=15.0`). Você **precisa alterar esses valores** para os do seu próprio emulador/dispositivo:

   ```robotframework
   Start session
       Open Application    http://localhost:4723
       ...                 platformName=Android
       ...                 automationName=UiAutomator2
       ...                 deviceName=SEU_DEVICE_AQUI
       ...                 platformVersion=SUA_VERSAO_AQUI
       ...                 autoGrantPermissions=true
       ...                 app=${EXECDIR}/app/yodapp-beta.apk
   ```

6. **Inicie o servidor do Appium** em um terminal separado:
   ```bash
   appium
   ```

7. **Execute todos os testes:**
   ```bash
   robot -d logs tests/
   ```

8. **Ou execute os testes de uma funcionalidade específica** (ex: formulários):
   ```bash
   robot -d logs tests/formularios/
   ```

9. **Verifique os resultados:**

   O Robot Framework gera `log.html`, `output.xml` e `report.html` na pasta `logs/` com o detalhamento completo da execução.

## 👤 Autor

Desenvolvido por **Enzo Coelho**

* GitHub: [enzoacoelho](https://github.com/enzoacoelho)
* LinkedIn: [enzoaugustocoelho](https://www.linkedin.com/in/enzoaugustocoelho/)
