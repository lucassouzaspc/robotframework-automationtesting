# Sobre o projeto
 
O projeto consiste na automação de testes de interface e API ao site http://demo.automationtesting.in/ utilizando Robotframework. Realizando o cadastro de novo usuário por tela com dados fakes gerados aleatoriamente interagindo com diversos elementos web.
Além do cadastro por tela o projeto executa por API a exclusão de um usuário da base de dados e a consulta do novo usuário cadastrado.

# Setup 🛠️

Primeiramente, é necessário instalar o Python (versão utilizada 3.7.2).
Instale o chormedriver https://chromedriver.chromium.org/downloads
Mapeando variável de ambiente no Windows:
$ export PATH="$PATH:/caminho/do/chromedriver"
Instale as dependências com o comand: pip install -r requirements.txt

# Execução do Projeto

Neste projeto, foi implementado o Robotframework.

Para executá-lo, acesse o diretório robotframework-automationtesting\tests e execute o comando: robot .\cadastro.robot

# Reports 📄

Para analise dos logs serão gerados automaticamente os seguintes arquivos:

•	log.html
•	output.xml
•	report.html

Observação: Aparentemente existe uma limitação de quantidade de usuários cadastrados no site automatizado. Quando excedido esse limite, novos usuários não conseguem ser cadastrados. Antes de salvar o cadastro, deletamos algum usuário cadastrado para liberar espaço. 
Caso apresente erro na primeira tentativa execute novamente o projeto.

