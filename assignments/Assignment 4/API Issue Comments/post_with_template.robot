*** Settings ***
Documentation       Exercício: cadastrar comentário em uma issue no Github
Library             RequestsLibrary
Library             Collections
Resource            ./variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}      https://api.github.com
${ISSUES_URI}       /repos/QAkarotto/robotframework-avancado/issues

*** Test Cases ***
Cadastra comentário em uma issue
    Conectar com autenticação por token na API do GitHub
    Comentar "Comentário cadastrado via Robot Framework!" na issue "2"

Consulta comentários de issues em um repositorio
    Conectar com autenticação por token na API do GitHub
    Consultar comentarios das issues

*** Keywords ***
Conectar com autenticação por token na API do GitHub
    ${HEADERS}          Create Dictionary    Authorization=Bearer ${MY_GITHUB_TOKEN}
    Create Session      alias=mygithubAuth   url=${GITHUB_HOST}     headers=${HEADERS}     disable_warnings=True
    
Comentar "${COMENTARIO}" na issue "${ISSUE_NUMBER}"
    ${HEADERS}          Create Dictionary    Accept=application/vnd.github+json
    ${MY_COMMENT}      Post on session    alias=mygithubAuth    url=${ISSUES_URI}/${ISSUE_NUMBER}/comments
    ...                                 data={"body": "${COMENTARIO}"}     headers=${HEADERS}
    Confere sucesso na requisição   ${MY_COMMENT}
    
Consultar comentarios das issues
    ${HEADERS}          Create Dictionary    Accept=application/vnd.github+json
    ${COMMENTS}      GET on session    alias=mygithubAuth    url=${ISSUES_URI}/comments?sort=updated&direction=desc
    ...                                  headers=${HEADERS}
    Confere sucesso na requisição   ${COMMENTS} 

Confere sucesso na requisição
    [Arguments]      ${RESPONSE}
    Should Be True   '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
    ...  msg=Erro na requisição! Verifique: ${RESPONSE}
