DELIMITER $$
CREATE PROCEDURE contar_livros_por_autor(autor_id INT)
BEGIN
    DECLARE quantidade_livros INT;
    DECLARE nome_autor VARCHAR(255);
    DECLARE lista_livros TEXT;

    -- Obtém a quantidade de livros do autor
    SET quantidade_livros = contar_livros_por_autor(autor_id);

    -- Obtém o nome do autor
    SELECT NomeAutor INTO nome_autor FROM Autores WHERE AutorID = autor_id;

    -- Concatena os títulos dos livros em uma única string separada por vírgula
    SELECT GROUP_CONCAT(Titulo SEPARATOR ', ') INTO lista_livros FROM Livros WHERE LivroID IN (SELECT LivroID FROM LivrosAutores WHERE AutorID = autor_id);

    -- Retorna o resultado
    SELECT nome_autor AS Nome_Autor, quantidade_livros AS Quantidade_Livros, lista_livros AS Livros_Por_Autor;
END$$
DELIMITER ;
