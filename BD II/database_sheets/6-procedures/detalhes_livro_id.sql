DELIMITER //

CREATE PROCEDURE ObterDetalhesLivro(IN LivroIDParam INT)
BEGIN
    SELECT * FROM LivrosDetalhados WHERE LivroID = LivroIDParam;
END //

DELIMITER ;
