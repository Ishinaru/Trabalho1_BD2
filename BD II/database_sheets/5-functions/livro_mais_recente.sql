DELIMITER //

CREATE FUNCTION livro_mais_recente() 
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE recente_info VARCHAR(500); 
    DECLARE recente_titulo VARCHAR(255);
    DECLARE recente_autor VARCHAR(255); 
    DECLARE recente_data_publicacao TIMESTAMP; 
    
    
    SELECT Titulo, NomeAutor, DataPublicacao INTO recente_titulo, recente_autor, recente_data_publicacao 
    FROM Livros 
    JOIN LivrosAutores ON Livros.LivroID = LivrosAutores.LivroID 
    JOIN Autores ON LivrosAutores.AutorID = Autores.AutorID 
    ORDER BY DataPublicacao DESC LIMIT 1;
   
    SET recente_info = CONCAT('Título: ', recente_titulo, ', Autor: ', recente_autor, ', Data de Publicação: ', recente_data_publicacao);
    
    RETURN recente_info; 
END //

DELIMITER ;
