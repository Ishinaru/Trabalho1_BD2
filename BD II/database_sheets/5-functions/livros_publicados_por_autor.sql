DELIMITER //

CREATE FUNCTION contar_livros_por_autor(autor_id INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE num_livros INT;
    SELECT COUNT(*) INTO num_livros FROM LivrosAutores WHERE AutorID = autor_id;
    RETURN num_livros;
END //

DELIMITER ;
