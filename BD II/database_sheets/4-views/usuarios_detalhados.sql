CREATE VIEW UsuariosDetalhados AS
SELECT 
    UsuarioID AS UsuarioID,
    Nome AS Nome,
    Email AS Email,
    Senha AS Senha,
    Nivel AS Nivel,
    Quantidade_Avaliacoes AS QuantidadeAvaliacoes
FROM Usuarios;
