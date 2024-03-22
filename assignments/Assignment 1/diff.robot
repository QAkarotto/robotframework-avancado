*** Settings ***
Library         DiffLibrary

*** Test Cases ***
Comparando dois arquivos iguais
    Comparar arquivos    FILE1_PATH=C:/Workspaces/STUDIES/ROBOT FRAMEWORK/robotframework-avancado/Assignments/Assignment 1/my_files/arquivo_texto_1.txt    FILE2_PATH=C:/Workspaces/STUDIES/ROBOT FRAMEWORK/robotframework-avancado/Assignments/Assignment 1/my_files/arquivo_texto_2.txt

Comparando dois arquivos diferentes
    Comparar arquivos    FILE1_PATH=C:/Workspaces/STUDIES/ROBOT FRAMEWORK/robotframework-avancado/Assignments/Assignment 1/my_files/arquivo_texto_1.txt    FILE2_PATH=C:/Workspaces/STUDIES/ROBOT FRAMEWORK/robotframework-avancado/Assignments/Assignment 1/my_files/arquivo_texto_3.txt    FAIL=False
    

*** Keywords ***
Comparar arquivos
    [Arguments]     ${FILE1_PATH}   ${FILE2_PATH}    ${FAIL}=True
    ## Lembrando: O GET FILE retorna o conteúdo do arquivo em STRING!
        Diff Files    file1=${FILE1_PATH}    file2=${FILE2_PATH}    fail=${FAIL}
