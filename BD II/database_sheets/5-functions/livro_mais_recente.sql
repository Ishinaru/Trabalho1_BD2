DELIMITER //

CREATE FUNCTION livro_mais_recente() 
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE recente_info VARCHAR(500); -- Aumentamos o tamanho do VARCHAR para acomodar todas as informações
    DECLARE recente_titulo VARCHAR(255);
    DECLARE recente_autor VARCHAR(255); -- Adicionamos uma variável para o autor
    DECLARE recente_data_publicacao TIMESTAMP; -- Adicionamos uma variável para a data de publicação
    
    -- Selecionamos os dados do livro mais recente
    SELECT Titulo, NomeAutor, DataPublicacao INTO recente_titulo, recente_autor, recente_data_publicacao 
    FROM Livros 
    JOIN LivrosAutores ON Livros.LivroID = LivrosAutores.LivroID -- Junta com a tabela de autores
    JOIN Autores ON LivrosAutores.AutorID = Autores.AutorID -- Obtém o nome do autor
    ORDER BY DataPublicacao DESC LIMIT 1;
    
    -- Concatenamos as informações em uma única string
    SET recente_info = CONCAT('Título: ', recente_titulo, ', Autor: ', recente_autor, ', Data de Publicação: ', recente_data_publicacao);
    
    RETURN recente_info; -- Retornamos a string contendo as informações
END //

DELIMITER ;
