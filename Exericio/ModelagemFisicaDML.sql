USE Biblioteca;

-- Inserindo autores
INSERT INTO Autor (AutorID, Nome, Nacionalidade) VALUES
(1, 'J.K. Rowling', 'Reino Unido'),
(2, 'George R.R. Martin', 'Estados Unidos'),
(3, 'Machado de Assis', 'Brasil');

-- Inserindo livros
INSERT INTO Livro (LivroID, Titulo, Genero, AnoPublicacao, FKAutorID) VALUES
(1, 'Harry Potter e a Pedra Filosofal', 'Fantasia', 1997, 1),
(2, 'As Crônicas de Gelo e Fogo', 'Fantasia', 1996, 2),
(3, 'Dom Casmurro', 'Romance', 1899, 3);

-- Inserindo clientes
INSERT INTO Cliente (ClienteID, Nome, Email, Telefone) VALUES
(1, 'Ana Souza', 'ana.souza@email.com', '1234-5678'),
(2, 'Carlos Pereira', 'carlos.pereira@email.com', '8765-4321');

-- Inserindo empréstimos
INSERT INTO Emprestimo (EmprestimoID, FKLivroID, FKClienteID, DataEmprestimo, DataDevolucao) VALUES
(1, 1, 1, '2024-10-01', '2024-10-15'),
(2, 3, 2, '2024-10-05', NULL);

SELECT * FROM autor;

SELECT Titulo FROM Livro
WHERE FKAutorID = 1;


SELECT Nome, Titulo, DataEmprestimo 
FROM Emprestimo 
JOIN Cliente ON Emprestimo.
FKClienteID = Cliente.ClienteID 
JOIN Livro ON Emprestimo.FKLivroID = Livro.LivroID 
WHERE DataDevolucao IS NULL;
