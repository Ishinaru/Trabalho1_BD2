DELIMITER //

CREATE TRIGGER BeforeInsertBook
BEFORE INSERT ON Livros
FOR EACH ROW
BEGIN
  DECLARE
    cnt INT;
  SELECT COUNT(*) INTO cnt FROM Livros WHERE Titulo = NEW.Titulo;
  IF cnt > 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Título duplicado não permitido.';
  END IF;
END //

DELIMITER ;
