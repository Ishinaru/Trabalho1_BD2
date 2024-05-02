DELIMITER //

CREATE TRIGGER AfterUpdateAutor
AFTER UPDATE ON Autores
FOR EACH ROW
BEGIN
    IF OLD.NomeAutor = NEW.NomeAutor THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O nome do autor não foi alterado.';
    END IF;
END //

DELIMITER ;
