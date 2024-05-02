DELIMITER //

CREATE TRIGGER AfterInsertLivro
AFTER INSERT ON Livros
FOR EACH ROW
BEGIN
    -- Incrementa o número de livros em 1 na tabela ContagemLivros
    UPDATE ContagemLivros
    SET TotalLivros = TotalLivros + 1;
END //

DELIMITER ;
