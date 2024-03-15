*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${LOGIN_HEADER_SIGIN}                   xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
${LOGIN_FIELD_EMAIL}                    id=email_create
${LOGIN_SUBMIT}                         id=SubmitCreate
${LOGIN_FORM_TITLE}                     xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${LOGIN_FIELD_GENDER}                   id=id_gender2
${LOGIN_FIELD_CUSTOMER_FIRST_NAME}      id=customer_firstname
${LOGIN_FIELD_CUSTOMER_LAST_NAME}       id=customer_lastname
${LOGIN_FIELD_PASSWORD}                 id=passwd
${LOGIN_FIELD_ADDRESS}                  id=address1 
${LOGIN_FIELD_CITY}                     id=city
${LOGIN_FIELD_STATE}                    id=id_state
${LOGIN_FIELD_POST_CODE}                id=postcode
${LOGIN_FIELD_PHONE_MOBILE}             id=phone_mobile
${LOGIN_WELCOME_MESSAGE}                xpath=//*[@id="center_column"]/p
${LOGIN_LOGGED_USER_NAME}               xpath=//*[@id="header"]/div[2]//div[1]/a/span



*** Keywords ***
Clicar em "Sign in"
    Click Element    ${LOGIN_HEADER_SIGIN}   

Informar um e-mail válido
    Wait Until Element Is Visible   ${LOGIN_FIELD_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${LOGIN_FIELD_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    ${LOGIN_SUBMIT}

Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${LOGIN_FORM_TITLE}
    Click Element                   ${LOGIN_FIELD_GENDER}
    Input Text                      ${LOGIN_FIELD_CUSTOMER_FIRST_NAME}    May
    Input Text                      ${LOGIN_FIELD_CUSTOMER_LAST_NAME}     Fernandes
    Input Text                      ${LOGIN_FIELD_PASSWORD}                123456
    Input Text                      ${LOGIN_FIELD_ADDRESS}              Rua Framework, Bairro Robot
    Input Text                      ${LOGIN_FIELD_CITY}                  Floripa
    Set Focus To Element            ${LOGIN_FIELD_STATE}
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   ${LOGIN_FIELD_STATE}
    Select From List By Index       ${LOGIN_FIELD_STATE}              9
    Input Text                      ${LOGIN_FIELD_POST_CODE}              12345
    Input Text                      ${LOGIN_FIELD_PHONE_MOBILE}          99988877

Submeter cadastro
    Click Button    submitAccount

### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${LOGIN_WELCOME_MESSAGE}
    Element Text Should Be           ${LOGIN_WELCOME_MESSAGE}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           ${LOGIN_LOGGED_USER_NAME}    May Fernandes