CREATE TABLE Usuario (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(50),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Livro (
    id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(100),
    ISBN VARCHAR(20),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

CREATE TABLE Emprestimo (
    id INT PRIMARY KEY,
    data_emprestimo DATE,
    data_devolucao DATE,
    multa FLOAT,
    usuario_id INT,
    livro_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (livro_id) REFERENCES Livro(id)
);

CREATE TABLE Reserva (
    id INT PRIMARY KEY,
    data_reserva DATE,
    livro_id INT,
    FOREIGN KEY (livro_id) REFERENCES Livro(id)
);



INSERT INTO Usuario (id, nome, tipo, endereco, telefone) VALUES (1, 'João Silva', 'Aluno', 'Rua A, 123', '123456789');
INSERT INTO Categoria (id, nome) VALUES (1, 'Ficção');
INSERT INTO Livro (id, titulo, autor, ISBN, categoria_id) VALUES (1, 'Dom Casmurro', 'Machado de Assis', '978-8525406572', 1);
INSERT INTO Emprestimo (id, data_emprestimo, data_devolucao, multa, usuario_id, livro_id) VALUES (1, '2024-11-01', '2024-11-15', 0.0, 1, 1);
INSERT INTO Reserva (id, data_reserva, livro_id) VALUES (1, '2024-11-05', 1);


-- Consultar todos os livros e suas categorias
SELECT Livro.titulo, Categoria.nome 
FROM Livro 
JOIN Categoria ON Livro.categoria_id = Categoria.id;

-- Consultar empréstimos de um usuário
SELECT Emprestimo.id, Livro.titulo, Emprestimo.data_emprestimo, Emprestimo.data_devolucao 
FROM Emprestimo
JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE Emprestimo.usuario_id = 1;
