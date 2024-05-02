# Trabalho1_BD2_Parte1

## Instruções de Uso do Script

Este projeto consiste em um conjunto de scripts para criar e popular tabelas em um banco de dados PostgreSQL com informações de livros, editoras, gêneros, usuários e avaliações.

### Passos:

1. **Criar as tabelas no PostgreSQL:**
   Execute os scripts SQL localizados na pasta "sql" para criar as tabelas necessárias no PostgreSQL.

2. **Executar o Script 1:**
   Este script irá extrair informações de 1240 livros da API da Google Books e gerar um arquivo JSON chamado "livros.json".
   Para executar o script, utilize o comando `node 1_google_books_api.js` na linha de comando.

3. **Executar o Script 2:**
   O segundo script irá estruturar o JSON gerado no passo anterior em comandos SQL para inserir dados nas tabelas de livros, editoras e gêneros. Além disso, fará a relação N para N entre essas entidades.
   Para executar o script, utilize o comando `node 2_transforma_dados_api_em_sql.js` na linha de comando.

4. **Inserir dados no PostgreSQL:**
   Execute os comandos SQL gerados pelo Script 2 para inserir os dados nas tabelas do PostgreSQL.

5. **Executar o Script 3:**
   Este script criará 20 usuários e 1240 avaliações em SQL. Você pode ajustar a quantidade de usuários no próprio código, se necessário.
   Para executar o script, utilize o comando `node 3_insere_users_avaliacoes.js` na linha de comando.

6. **Inserir dados de usuários e avaliações no PostgreSQL:**
   Execute os comandos SQL gerados pelo Script 3 para inserir os dados de usuários e avaliações nas tabelas do PostgreSQL.

Com isso, o banco de dados estará pronto para uso.

# Trabalho1_BD2_Parte_2

## Instruções de Uso do Script:

Este projeto consiste em uma aplicação em um banco de dados MySQL com informações de livros, editoras, gêneros, usuários e avaliações, primariamente. O nosso objetivo principal foi o de criar uma aplicação API first, fazendo as APIs e consumindo o conteúdo delas no front.

### Passos:

#### Configurando o banco de dados:

1. **Abrir a pasta database_sheets:**
   Para o funcionamento completo da aplicação, deixamos os sql's organizados e completos nesta pasta. Siga o passo a passo a seguir para ter a correta utilização.

2. **Executar os scripts sql da pasta 3:**
   Na pasta 3, abra o arquivo 1_create-tables.sql no MySQL Workbench (lembre-se de utilizar o XAMPP com o modulo MYSQL ligado) e execute-o, isto irá criar as tabelas necessárias do nosso banco.
   Após isso, abra e execute o arquivo 2_insere_livros_generos_editoras_relacoes.sql, que irá inserir dados e relaçoes nas nossas tabelas.
   E por fim, abra e execute 3_insere_contagem_livros, que ira inserir dados na tabela contagem de livros com a quantidade de livros existentes no nosso banco.

3. **Executar os scripts sql da pasta 4:**
   Na pasta 4, abra os arquivos sql separadamente e execute-os um por um, isso irá criar as views necessárias para nosso banco.

4. **Executar os scripts sql da pasta 5:**
   Na pasta 5, abra os arquivos sql separadamente e execute-os um por um, isso irá criar as functions necessárias para nosso banco.

5. **Executar os scripts sql da pasta 6:**
   Na pasta 6, abra os arquivos sql separadamente e execute-os um por um, isso irá criar os procedures necessários para nosso banco.

6. **Executar os scripts sql da pasta 7:**
   Na pasta 7, abra os arquivos sql separadamente e execute-os um por um, isso irá criar os triggers necessários para nosso banco.

7. **Executar os scripts sql da pasta 8:**
   Na pasta 8, abra e execute o arquivo popula_usuarios.sql ,isto irá popular nossa tabela de usuários.
   Em seguida, abra e execute o arquivo popula_avaliacoes.sql, isto ira popular a nossa tabela de avaliações.

#### Configurando a aplicação Next:

1. **Instalar as dependências:**
   Caso não tenha as dependências instaladas, utilize o `npm i` ou `npm install` via terminal, para que todas as dependências sejam instaladas.

2. **Verificar as variáveis de ambiente para ver se condizem com o database criado por você:**
   Abra o .env.development e verifique se as variáveis de ambiente condizem com o que está no seu database, se sim, continue.

3. **Rodar a aplicação:**
   Execute o comando `npm run dev` no terminal para que o programa seja executado. Logo após isso, aparecerá o link para abrir a aplicação via navegador no terminal. Dê `Ctrl+clique no botão esquerdo do mouse` para abrir.

4. **Utilizar o programa no navegador:**
   Logo na página inicial, temos as opções do usuário: `Listar Livros, Listar Livro Específico, Listar Avaliações, Listar Avaliações por Usuário, Listar Usuários. Listar Autores, Mostrar Livro Mais Recente, Listar Livros por Autor, Listar Média de Avaliações por Livro, Inserir Livro, Inserir Avaliação, Deletar Livro, Mostrar Livros Deletados e Atualizar Autor`. Presume-se que já tenham sido feitas as operações pedidas no script fornecido, então, sinta-se livre para testar a aplicação! Caso ocorram eventuais bugs, não hesite em contatar-nos!



## Autores

- [David Vinícius](https://github.com/Ishinaru)
- [Igor Alex](https://github.com/Kronossss)
- [Thompson Raul](https://github.com/ThompsonRaul)
- [Andressa Peixoto](https://github.com/apnonato)
