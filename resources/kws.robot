***Settings***
Documentation       Aqui teremos todas as palavras chaves de automação e comportamentos
# Para mapear os elementos  -- https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
# Gerar dados fakes https://pypi.org/project/robotframework-faker/
# Documentação https://medium.com/rchlo-midway-tech/descomplicando-a-automatiza%C3%A7%C3%A3o-de-testes-com-robot-framework-af793f590ef1
# https://medium.com/@fmgprado/api-testing-with-robot-framework-part-1-997a3cb5bffe
# https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html
# https://stackoverflow.com/questions/30306963/create-a-dictionary-and-pass-it-as-a-map-to-a-java-method-in-robot-framework

Library    JSONLibrary
Library    FakerLibrary
Library    RequestsLibrary
Library    Collections
Library    String


Resource    elements.robot

***Variables***

${register}     http://demo.automationtesting.in/Register.html
${webTable}     http://demo.automationtesting.in/WebTable.html


${base_url}    https://api.mlab.com
${apiKey}      ?apiKey=YEX0M2QMPd7JWJw_ipMB3a5gDddt4B_X
${newtable}    /api/1/databases/userdetails/collections/newtable${apiKey}
${delete}      /api/1/databases/userdetails/collections/newtable/

***Keywords***
Dado que acesso o site
    Go To       ${register}   

Quando informar meus dados
    [Arguments]     ${fake_first_name}     ${fake_last_name}     ${fake_address}     
    ...             ${fake_email}          ${fake_phone}
    
    Wait Until Element Is Visible   ${first_name}   5
    
    Input Text         ${first_name}        ${fake_first_name}
    Input Text         ${last_name}         ${fake_last_name} 
    Input Text         ${email}             ${fake_email} 
    Input Text         ${phone}             ${fake_phone}  

    ## Iteração com Radio Button e checkboxes
    Select Radio Button      radiooptions       Male
    
    Select Checkbox          ${checkbox1}
    Select Checkbox          ${checkbox3}

    ## Iteração com selects e selects2(como))
    Select From List By Value       ${skills}          Javascript
    Select From List By Value       ${countries}       Argentina

#   Iteração com listas.
    Select From List By Value       ${yearbox}            1996
    Select From List By Value       ${monthbox}           February
    Select From List By Value       ${daybox}             10
    Input Text                      ${firstpassword}      Robot@123
    Input Text                      ${secondpassword}     Robot@123

#     //Adicionando arquivo img.

    Choose File         ${imagesrc}     ${CURDIR}/images/imagem-foto.png

    # capture page screenshot     formulario_cadastro.png
                                        
E salvar

########### Devido a uma limitação de quantidade de cadastro do site demo.automationtesting
########### Deletaremos por API algum user para liberarmos espaço para um novo cadastro.
########### Pode ocorrer erros porque outro usuario poderá inserir primeiro

    Create Session    API    ${base_url}

   ${response}=    get request   API  ${newtable}
   ${status_code}=   convert to string  ${response.status_code}  
   should be equal   ${status_code}      200
   ${body}=    to json    ${response.content}
   ${name_value}=    get value from json    ${body}    $[0]._id
   ${name_value}=   convert to string  ${name_value}
   ${name_value}=    Remove String        ${name_value}   [{'$oid': '       '}]

   ${response}=    delete request   API  ${delete}${name_value}${apiKey}

############

    Click Element       ${salvar}

Entao devo ser cadastrado com sucesso

    wait Until page contains     WebTable 
    Sleep       2

   ${response}    get request   API  ${newtable}
   ${status_code}=   convert to string  ${response.status_code}  
   should be equal   ${status_code}      200
   ${body}=    convert to string    ${response.content}

   should contain    ${body}        "FirstName" : "${fake_first_name}" , "LastName" : "${fake_last_name}"
   ...                              , "Email" : "${fake_email}" , "Phone" : "${fake_phone}" , "Gender" : "Male"
    


      