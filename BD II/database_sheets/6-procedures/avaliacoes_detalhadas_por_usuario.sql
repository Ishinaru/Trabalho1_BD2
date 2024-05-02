DELIMITER //

CREATE PROCEDURE ObterAvaliacoesDetalhadasPorUsuario(IN UsuarioIDParam INT)
BEGIN
    SELECT * FROM AvaliacoesDetalhadas WHERE UsuarioID = UsuarioIDParam;
END //

DELIMITER ;
