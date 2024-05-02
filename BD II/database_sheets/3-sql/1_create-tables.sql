CREATE TABLE Livros (
    LivroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    DataPublicacao TIMESTAMP NOT NULL,
    NumPaginas INT NOT NULL,
    Sinopse TEXT NOT NULL
);

CREATE TABLE Autores (
    AutorID INT AUTO_INCREMENT PRIMARY KEY,
    NomeAutor VARCHAR(150) NOT NULL
);

CREATE TABLE Editoras (
    EditoraID INT AUTO_INCREMENT PRIMARY KEY,
    NomeEditora VARCHAR(150) NOT NULL 
);

CREATE TABLE Generos (
    GeneroID INT AUTO_INCREMENT PRIMARY KEY,
    NomeGenero VARCHAR(50) NOT NULL
);

CREATE TABLE LivrosAutores (
    LivroID INT NOT NULL,
    AutorID INT NOT NULL,
    PRIMARY KEY(LivroID, AutorID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);

CREATE TABLE LivrosEditoras (
    LivroID INT NOT NULL,
    EditoraID INT NOT NULL,
    PRIMARY KEY(LivroID, EditoraID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (EditoraID) REFERENCES Editoras(EditoraID)
);

CREATE TABLE LivrosGeneros (
    LivroID INT NOT NULL,
    GeneroID INT NOT NULL,
    PRIMARY KEY(LivroID, GeneroID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (GeneroID) REFERENCES Generos(GeneroID)
);

CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Senha VARCHAR(150) NOT NULL,
    Nivel VARCHAR(20) NOT NULL DEFAULT 'Bronze',
    Quantidade_Avaliacoes INT NOT NULL DEFAULT 0
);

CREATE TABLE Avaliacoes (
    AvaliacaoID INT AUTO_INCREMENT PRIMARY KEY,
    LivroID INT NOT NULL,
    UsuarioID INT NOT NULL,
    Nota DECIMAL(2, 1) NOT NULL CHECK (Nota >= 0 AND Nota <= 5),
    Comentario TEXT NOT NULL,
    DataAvaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    UNIQUE (LivroID, UsuarioID)
);

CREATE TABLE HistoricoLivrosDeletados (
    DeletadoID INT AUTO_INCREMENT PRIMARY KEY,
    LivroID INT,
    Titulo VARCHAR(255),
    DataDeletado DATETIME
);

CREATE TABLE ContagemLivros (
    TotalLivros INT
);
