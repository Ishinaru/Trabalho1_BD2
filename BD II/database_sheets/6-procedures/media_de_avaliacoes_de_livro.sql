DELIMITER $$

CREATE PROCEDURE mostrar_info_livro(livro_id INT)
BEGIN
    DECLARE livro_titulo VARCHAR(255);
    DECLARE autor_nome VARCHAR(255);
    DECLARE avaliacao_media DECIMAL(2, 1);

 
    SELECT Titulo INTO livro_titulo FROM Livros WHERE LivroID = livro_id;


    SELECT NomeAutor INTO autor_nome
    FROM Autores
    JOIN LivrosAutores ON Autores.AutorID = LivrosAutores.AutorID
    WHERE LivrosAutores.LivroID = livro_id
    LIMIT 1;


    SET avaliacao_media = media_avaliacoes_livro(livro_id);

 
    SELECT livro_titulo AS Titulo, autor_nome AS Autor, avaliacao_media AS Media_Avaliacao;
END$$

DELIMITER ;
