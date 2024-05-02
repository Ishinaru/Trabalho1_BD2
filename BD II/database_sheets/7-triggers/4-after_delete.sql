DELIMITER //

CREATE TRIGGER AfterDeleteBookLogHistory
AFTER DELETE ON Livros
FOR EACH ROW
BEGIN
    -- Insere o registro na tabela de histórico de livros deletados
    INSERT INTO HistoricoLivrosDeletados (LivroID, Titulo, DataDeletado)
    VALUES (OLD.LivroID, OLD.Titulo, NOW());

    -- Decrementa o número de livros em 1 na tabela ContagemLivros
    UPDATE ContagemLivros
    SET TotalLivros = TotalLivros - 1;
END //

DELIMITER ;
