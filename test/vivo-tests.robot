*** Settings ***
Documentation   MEU VIVO
Force Tags      smoke-test-meu-vivo
Metadata    Responsavel        williamjablonski@dellemc.com
Library     Selenium2Library
*** Variables ***
${URL}=
${USERNAME}=
${PASSWORD}=
...
*** Test Cases ***
SMOKE TEST Login meu vivo
    Given o site esta aberto
    When eu seleciono o estado SP
    When eu clico em sou cliente
    When eu preencho o usuario
    When eu preencho a senha
    When eu clico em entrar
    Then o login é executado com sucesso

*** Keywords ***
o site esta aberto
|  |  Open Browser	|  ${URL}
eu seleciono o estado SP
|  |  Wait Until Element Is Enabled  |  id=campoRegional  |  timeout=60
|  |  Input Text    |  id=campoRegional  |  São Paulo
|  |  Click Element   |   xpath=//*[@class='ui-menu-item-custom']
eu clico em sou cliente
|  |  Click Element    |  xpath=//html/body/div[6]/div/div[2]/div[1]/div[6]/a[1]
eu preencho o usuario
|  |  Wait Until Page Contains Element |  xpath=//*[@id='campo_login']
|  |  Input Text      |  id=cpfOuEmail_we  |  ${USERNAME}
eu preencho a senha
|  |  Wait Until Element Is Enabled  |  id=passwordId_we_text  |  timeout=60
|  |  Click Element   |  xpath=//*[@id='passwordId_we_text']
|  |  Input Password      |  id=passwordId_we  |   ${PASSWORD}         #prod
eu clico em entrar
|  |  Wait Until Element Is Enabled  |  id=btn-entrar-login-we  |  timeout=60
|  |  Click Element    |  id=btn-entrar-login-we
o login é executado com sucesso
|  |  Wait Until Element Is Enabled  |  xpath=//*[@id='m1']/div/a  |  #timeout=60