*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/Login.robot
Resource            ../resources/PO/Carrinho.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    Carrinho.Excluir o produto do carrinho
    Carrinho.Conferir se o carrinho fica vazio

### EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    Home.Acessar a página home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
