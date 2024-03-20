# Trabalho1_BD2

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

**Observação:** Certifique-se de ter configurado corretamente as conexões com o PostgreSQL nos scripts e de ter instalado todas as dependências necessárias.

## Autores

- [David Vinícius](https://github.com/Ishinaru)
- [Igor Alex](https://github.com/Kronossss)
- [Thompson Raul](https://github.com/ThompsonRaul)
- [Andressa Peixoto](https://github.com/apnonato)
