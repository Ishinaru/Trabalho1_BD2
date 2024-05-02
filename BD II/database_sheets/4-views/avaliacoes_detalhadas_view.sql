CREATE OR REPLACE VIEW AvaliacoesDetalhadas AS
SELECT A.LivroID, L.Titulo, U.Nome, U.UsuarioID, A.Nota, A.Comentario, A.DataAvaliacao
FROM Avaliacoes A
JOIN Livros L ON A.LivroID = L.LivroID
JOIN Usuarios U ON A.UsuarioID = U.UsuarioID;
