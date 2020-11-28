***Settings*** 

Documentation       Como usuário, desejo realizar um cadastro
...                 para que possa acessar o sistema automationtesting


Resource        ../resources/base.robot

Test Setup      Open Session
Test Teardown   Close Session
Suite Setup     Dados Fake

***Test Cases***

Cenario 01: Cadastro de usuário no site
    Dado que acesso o site
    Quando informar meus dados  
    ...      ${fake_first_name}     ${fake_last_name}     ${fake_address}     ${fake_email}     ${fake_phone}	  
    E salvar
    Entao devo ser cadastrado com sucesso
 