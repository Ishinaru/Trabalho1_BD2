const fs = require("fs");

// Gera uma data aleatória dentro de um intervalo de dias
function randomDate(start, end) {
  return new Date(
    start.getTime() + Math.random() * (end.getTime() - start.getTime())
  );
}

// Gera um número inteiro aleatório dentro de um intervalo
function randomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// Gera comandos de inserção para usuários
function generateUserInserts(numUsers) {
  let inserts = "";
  for (let i = 1; i <= numUsers; i++) {
    inserts += `INSERT INTO Usuarios (Nome, Email, Senha) VALUES ('Usuário ${i}', 'usuario${i}@exemplo.com', 'senha${i}');\n`;
  }
  return inserts;
}

// Gera comandos de inserção para avaliações
function generateReviewInserts(numReviews, numUsers, numBooks) {
  let inserts = "";
  for (let i = 1; i <= numReviews; i++) {
    const userId = randomInt(1, numUsers);
    const livroId = ((i - 1) % numBooks) + 1; // Incrementa o livroID de 1 até 150
    const nota = randomInt(0, 50) / 10; // Nota aleatória de 0.0 a 5.0
    const comentario = `Comentário sobre o livro ${livroId} pelo usuário ${userId}`;
    const dataAvaliacao = randomDate(new Date(2020, 0, 1), new Date());
    inserts += `INSERT INTO Avaliacoes (LivroID, UsuarioID, Nota, Comentario, DataAvaliacao) VALUES (${livroId}, ${userId}, ${nota}, '${comentario}', '${dataAvaliacao.toISOString()}');\n`;
  }
  return inserts;
}

// Número de usuários e avaliações a serem gerados
const numUsers = 20;
const numReviews = 1240;

// Gera comandos de inserção
const userInserts = generateUserInserts(numUsers);
const reviewInserts = generateReviewInserts(numReviews, numUsers, 1240);

// Escreve os comandos de inserção em um arquivo
const outputFile = "./sql/insere_users_avaliacoes.sql";
fs.writeFileSync(outputFile, userInserts + reviewInserts);

console.log(`Arquivo '${outputFile}' gerado com sucesso.`);
