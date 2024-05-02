DELIMITER //

CREATE TRIGGER AfterInsertAvaliacao
AFTER INSERT ON Avaliacoes
FOR EACH ROW
BEGIN
    DECLARE total_avaliacoes INT;

    -- Atualiza a quantidade de avaliações do usuário
    UPDATE Usuarios
    SET quantidade_avaliacoes = quantidade_avaliacoes + 1
    WHERE UsuarioID = NEW.UsuarioID;

    -- Obtém o total de avaliações do usuário
    SELECT quantidade_avaliacoes INTO total_avaliacoes
    FROM Usuarios
    WHERE UsuarioID = NEW.UsuarioID;

    -- Verifica e atualiza o nível do usuário conforme o número de avaliações
    IF total_avaliacoes >= 10 THEN
        UPDATE Usuarios
        SET nivel = 'Prata'
        WHERE UsuarioID = NEW.UsuarioID;
    ELSEIF total_avaliacoes >= 20 THEN
        UPDATE Usuarios
        SET nivel = 'Ouro'
        WHERE UsuarioID = NEW.UsuarioID;
    END IF;
END//

DELIMITER ;
