const fs = require("fs");

const filePath = "./2-json/livros.json";
const data = JSON.parse(fs.readFileSync(filePath, "utf8"));

let contlivro = 0;
let contautor = 0;
let conteditora = 0;
let contgenero = 0;

const autoresSet = new Set();
const editorasSet = new Set();
const generosSet = new Set();

const livroAutorRelations = new Set();
const livroEditoraRelations = new Set();
const livroGeneroRelations = new Set();

let sqlContent = "";

data.forEach((item) => {
  const { livro, autor, editora, genero } = item;

  // Ajustando a dataPublicacao
  let dataPublicacao = livro.dataPublicacao;
  if (dataPublicacao.match(/^\d{4}$/)) {
    // Apenas ano
    dataPublicacao += "-01-01 00:00:00";
  } else if (dataPublicacao.match(/^\d{4}-\d{2}$/)) {
    // Ano e mês
    dataPublicacao += "-01 00:00:00";
  } else {
    // Adiciona '00:00:00' no final da data
    dataPublicacao += " 00:00:00";
  }

  // Verifica se a data de publicação é anterior a 1970
  if (dataPublicacao < "1970-01-01 00:00:00") {
    // Define a data de publicação como 1970-01-01 00:00:00
    dataPublicacao = "1970-01-01 00:00:00";
  }

  sqlContent += `INSERT INTO Livros (Titulo, DataPublicacao, NumPaginas, Sinopse) VALUES ('${livro.titulo}', '${dataPublicacao}', ${livro.numPaginas}, '${livro.sinopse}');\n`;
  contlivro += 1;

  autor.nome_autor.forEach((nome) => {
    if (!autoresSet.has(nome)) {
      sqlContent += `INSERT INTO Autores (NomeAutor) VALUES ('${nome}');\n`;
      autoresSet.add(nome);
      contautor += 1;
    }
    livroAutorRelations.add(`(${contlivro}, ${contautor})`);
  });

  if (!editorasSet.has(editora.nome_editora)) {
    sqlContent += `INSERT INTO Editoras (NomeEditora) VALUES ('${editora.nome_editora}');\n`;
    editorasSet.add(editora.nome_editora);
    conteditora += 1;
  }
  livroEditoraRelations.add(`(${contlivro}, ${conteditora})`);

  genero.nome_genero.forEach((nome) => {
    if (!generosSet.has(nome)) {
      sqlContent += `INSERT INTO Generos (NomeGenero) VALUES ('${nome}');\n`;
      generosSet.add(nome);
      contgenero += 1;
    }
    livroGeneroRelations.add(`(${contlivro}, ${contgenero})`);
  });
});

livroAutorRelations.forEach((relation) => {
  sqlContent += `INSERT INTO LivrosAutores (LivroID, AutorID) VALUES ${relation};\n`;
});

livroEditoraRelations.forEach((relation) => {
  sqlContent += `INSERT INTO LivrosEditoras (LivroID, EditoraID) VALUES ${relation};\n`;
});

livroGeneroRelations.forEach((relation) => {
  sqlContent += `INSERT INTO LivrosGeneros (LivroID, GeneroID) VALUES ${relation};\n`;
});
const outputFile = "./3-sql/insere_livros_generos_editoras_relacoes.sql";
fs.writeFileSync(outputFile, sqlContent);

console.log(`Arquivo '${outputFile}' gerado com sucesso.`);
