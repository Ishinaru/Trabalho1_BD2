DELIMITER //

CREATE PROCEDURE encontrar_livro_mais_recente()
BEGIN
    DECLARE titulo_mais_recente VARCHAR(255);
    
    SET titulo_mais_recente = livro_mais_recente();
    
    SELECT titulo_mais_recente AS Livro_Mais_Recente;
END //

DELIMITER ;
