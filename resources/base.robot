***Settings***
Documentation       Aqui teremos a estrutura base do projeto
...                 O selenium e FakerLibrary são importantos aqui
...                 Abrir e finalizar sessão
...                 Definir variaveis para os dados fakes

Library    SeleniumLibrary
Library    FakerLibrary

Resource    kws.robot

***Variables***

${Browser}      chrome
# ${headless}      headlesschrome

***Keywords***
Open Session
    # Open Browser    about:blank     ${headless}
    Open Browser    about:blank     ${Browser}
    maximize browser window

Close Session
    # Capture Page Screenshot
    Close Browser

Dados Fake
    ${fake_first_name}=                FakerLibrary.First Name Male
    ${fake_last_name}=                 FakerLibrary.Last Name Male
    ${fake_address}=                   FakerLibrary.Address
    ${fake_email}=                     FakerLibrary.Email
    ${fake_phone}=                     FakerLibrary.Random Number            digits=${10}	

    Set Suite Variable                  ${fake_first_name}                   children=true                   
    Set Suite Variable                  ${fake_last_name}
    Set Suite Variable                  ${fake_address}
    Set Suite Variable                  ${fake_email}  
    Set Suite Variable                  ${fake_phone}   