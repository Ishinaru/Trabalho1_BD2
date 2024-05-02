DELIMITER //

CREATE FUNCTION media_avaliacoes_livro(livro_id INT) 
RETURNS DECIMAL(2, 1) DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(2, 1);
    SELECT AVG(Nota) INTO media FROM Avaliacoes WHERE LivroID = livro_id;
    RETURN COALESCE(media, 0); -- Retorna 0 se não houver avaliações para o livro
END //

DELIMITER ;
