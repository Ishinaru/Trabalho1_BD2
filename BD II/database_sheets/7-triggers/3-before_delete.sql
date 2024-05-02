DELIMITER //

CREATE TRIGGER BeforeDeleteBook
BEFORE DELETE ON Livros
FOR EACH ROW
BEGIN
    DECLARE total_avaliacoes INT;

    -- Remover referências de LivrosAutores
    DELETE FROM LivrosAutores WHERE LivroID = OLD.LivroID;

    -- Remover referências de LivrosEditoras
    DELETE FROM LivrosEditoras WHERE LivroID = OLD.LivroID;

    -- Remover referências de LivrosGeneros
    DELETE FROM LivrosGeneros WHERE LivroID = OLD.LivroID;

    -- Obtém o total de avaliações do livro
    SELECT COUNT(*) INTO total_avaliacoes
    FROM Avaliacoes
    WHERE LivroID = OLD.LivroID;

    -- Decrementa o total_avaliacoes dos usuários
    UPDATE Usuarios
    SET quantidade_avaliacoes = quantidade_avaliacoes - 1
    WHERE UsuarioID IN (SELECT UsuarioID FROM Avaliacoes WHERE LivroID = OLD.LivroID);

    -- Verifica e atualiza o nível dos usuários
    UPDATE Usuarios
    SET nivel =
        CASE
            WHEN quantidade_avaliacoes < 10 THEN 'Bronze'
            WHEN quantidade_avaliacoes >= 10 AND quantidade_avaliacoes < 20 THEN 'Prata'
            ELSE 'Ouro'
        END
    WHERE UsuarioID IN (SELECT UsuarioID FROM Avaliacoes WHERE LivroID = OLD.LivroID);
    
    -- Remover avaliações associadas ao livro
    DELETE FROM Avaliacoes WHERE LivroID = OLD.LivroID;
END //

DELIMITER ;
