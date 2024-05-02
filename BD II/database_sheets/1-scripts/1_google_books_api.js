const fs = require("fs");
const https = require("https");

const temas = [
  "Ação",
  "Comédia",
  "Aventura",
  "Romance",
  "Drama",
  "Ficção",
  "Thriller Psicológico",
  "Horror Cósmico",
  "Fantasia Urbana",
  "Romance de Época",
  "Ficção Científica Distópica",
  "Comédia de Erros",
  "Western Espacial",
  "Aventura Submarina",
  "Drama Familiar",
  "Suspense Policial",
  "Terror Gótico",
  "Romance Paranormal",
  "Sci-Fi Cyberpunk",
  "Comédia Romântica",
  "Mistério de Assassinato",
  "Fantasia Heroica",
  "Ação Pós-Apocalíptica",
  "Drama Médico",
  "Romance de Viagem no Tempo",
  "Ficção Científica Militar",
  "Comédia de Fantasia",
  "Thriller de Espionagem",
  "Horror de Sobrevivência",
  "Romance LGBT+",
  "Sci-Fi Steampunk",
];

console.log(temas);

function fetchWithHttps(url) {
  return new Promise((resolve, reject) => {
    https
      .get(url, (response) => {
        let data = "";

        response.on("data", (chunk) => {
          data += chunk;
        });

        response.on("end", () => {
          resolve(JSON.parse(data));
        });
      })
      .on("error", (error) => {
        reject(error);
      });
  });
}

function removeApostrophes(value) {
  if (typeof value === "string") {
    return value.replace(/'/g, "");
  } else if (Array.isArray(value)) {
    // Se for um array, remove apóstrofos para cada elemento do array. (Pelo que parece, Postgres não aceita declaração com aspas duplas)
    return value.map((element) => removeApostrophes(element));
  } else if (value !== null && value !== undefined) {
    // Converte outros tipos para string antes de aplicar replace.
    return String(value).replace(/'/g, "");
  }
  return value; // Retorna o valor como está se for null/undefined.
}

function formatAuthors(authors) {
  if (!authors) return ["N/A"];
  return authors
    .join(", ")
    .split(", ")
    .map((author) => removeApostrophes(author.trim()));
}

async function fetchBooksForTheme(theme) {
  const apiUrl = "https://www.googleapis.com/books/v1/volumes";
  const maxResults = 40;

  try {
    const data = await fetchWithHttps(
      `${apiUrl}?q=${theme}&printType=books&maxResults=${maxResults}`
    );

    return data.items.map((item) => {
      const volumeInfo = item.volumeInfo;
      const searchInfo = item.searchInfo;
      return {
        livro: {
          titulo: removeApostrophes(volumeInfo.title) || "N/A",
          dataPublicacao: volumeInfo.publishedDate || "1970-01-01",
          numPaginas: volumeInfo.pageCount || 0,
          sinopse:
            searchInfo && searchInfo.textSnippet
              ? removeApostrophes(searchInfo.textSnippet)
              : "N/A",
        },
        autor: {
          nome_autor: volumeInfo.authors
            ? formatAuthors(volumeInfo.authors)
            : ["N/A"],
        },
        editora: {
          nome_editora: volumeInfo.publisher
            ? removeApostrophes(volumeInfo.publisher)
            : "N/A",
        },
        genero: {
          nome_genero: volumeInfo.categories
            ? volumeInfo.categories.map((category) =>
                removeApostrophes(category)
              )
            : ["N/A"],
        },
      };
    });
  } catch (error) {
    console.error(`Erro ao recuperar os livros para o tema ${theme}:`, error);
    return [];
  }
}

async function fetchAllBooks() {
  let allBooks = [];

  for (let tema of temas) {
    const booksForTheme = await fetchBooksForTheme(tema);
    allBooks = allBooks.concat(booksForTheme);
    console.log(`Livros coletados para o tema ${tema}:`, booksForTheme.length);
  }
  const outputFile = "./2-json/livros.json";
  fs.writeFileSync(outputFile, JSON.stringify(allBooks, null, 2));
  console.log(
    `Arquivo ${outputFile} criado com sucesso com ${allBooks.length} livros.`
  );
}

fetchAllBooks();
