*** Settings ***
Library        ../../Libraries/AgeLibrary/ageCalculator.py

*** Test Cases ***
Calculando idade
    Calcular idade    data_nascimento=14-05-1991
    
Calculando ano de nascimento
    Calcular ano de nascimento    idade=26

*** Keywords ***
Calcular idade
    [Arguments]    ${data_nascimento}
    ${IDADE}    Calculate Age In Years    ${data_nascimento}

Calcular ano de nascimento
    [Arguments]    ${idade}
    ${ANO}    Calculate Birth Year    ${idade}
