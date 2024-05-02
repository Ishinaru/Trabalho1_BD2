CREATE VIEW LivrosDetalhados AS
SELECT 
    L.LivroID,
    L.Titulo,
    L.DataPublicacao,
    L.NumPaginas,
    L.Sinopse,
    GROUP_CONCAT(A.NomeAutor SEPARATOR ', ') AS Autores,
    E.NomeEditora
FROM 
    Livros L
JOIN 
    LivrosAutores LA ON L.LivroID = LA.LivroID
JOIN 
    Autores A ON LA.AutorID = A.AutorID
JOIN 
    LivrosEditoras LE ON L.LivroID = LE.LivroID
JOIN 
    Editoras E ON LE.EditoraID = E.EditoraID
GROUP BY 
    L.LivroID,
    L.Titulo,
    L.DataPublicacao,
    L.NumPaginas,
    L.Sinopse,
    E.NomeEditora;
