const mysql = require("mysql2/promise"); // Importa o módulo mysql2/promise

// Configurações de conexão com o banco de dados
const connectionConfig = {
  host: "localhost", // Endereço do servidor do banco de dados
  user: "root", // Nome de usuário do banco de dados
  //password: "180420", // Senha do banco de dados
  database: "livros_felizes", // Nome do banco de dados
};

// Função para obter uma conexão do banco de dados
async function getConnection() {
  return await mysql.createConnection(connectionConfig); // Retorna uma conexão
}

// Função para executar consultas SQL
async function executeQuery({ query, values = [] }) {
  const connection = await getConnection();
  try {
    const [results] = await connection.query(query, values); // Executa a consulta com os valores
    return results;
  } finally {
    await connection.end(); // Fecha a conexão após a consulta
  }
}

module.exports = { executeQuery };
