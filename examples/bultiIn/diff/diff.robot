*** Settings ***
Library     DiffLibrary

*** Test Cases ***
Comparar dois conteúdos
     Compare "meu_arquivo.txt" e "meu_outro_arquivo.txt"

*** Keywords ***
Compare "${ONE}" e "${TWO}"
     Diff Files     ${ONE}     ${TWO}