DELIMITER //
CREATE TRIGGER BeforeUpdateBook
BEFORE UPDATE ON Livros
FOR EACH ROW
BEGIN
  IF NEW.NumPaginas < 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O número de páginas deve ser pelo menos 1.';
  END IF;
END //
DELIMITER ;