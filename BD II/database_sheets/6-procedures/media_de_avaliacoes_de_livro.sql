DELIMITER $$

CREATE PROCEDURE mostrar_info_livro(livro_id INT)
BEGIN
    DECLARE livro_titulo VARCHAR(255);
    DECLARE autor_nome VARCHAR(255);
    DECLARE avaliacao_media DECIMAL(2, 1);

    -- Obtendo o título do livro
    SELECT Titulo INTO livro_titulo FROM Livros WHERE LivroID = livro_id;

    -- Obtendo o nome do autor
    SELECT NomeAutor INTO autor_nome
    FROM Autores
    JOIN LivrosAutores ON Autores.AutorID = LivrosAutores.AutorID
    WHERE LivrosAutores.LivroID = livro_id
    LIMIT 1;

    -- Obtendo a média de avaliação do livro
    SET avaliacao_media = media_avaliacoes_livro(livro_id);

    -- Exibindo os resultados em tabelas separadas
    SELECT livro_titulo AS Titulo, autor_nome AS Autor, avaliacao_media AS Media_Avaliacao;
END$$

DELIMITER ;
