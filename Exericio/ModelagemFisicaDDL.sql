DROP DATABASE IF EXISTS Biblioteca; -- Exclusão do banco de dados Biblioteca, caso exista
CREATE DATABASE Biblioteca; -- Criação do banco de dados Biblioteca
USE Biblioteca; -- Seleção do banco de dados Biblioteca

-- Criação da tabela Autor
CREATE TABLE Autor (
    AutorID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do autor, auto incrementado
    Nome VARCHAR(100) NOT NULL, -- Nome do autor, campo obrigatório
    Nacionalidade VARCHAR(50) -- Nacionalidade do autor
);

-- Criação da tabela Livro
CREATE TABLE Livro (
    LivroID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do livro, auto incrementado
    Titulo VARCHAR(150) NOT NULL, -- Título do livro, campo obrigatório
    Genero VARCHAR(50), -- Gênero do livro
    AnoPublicacao INT, -- Ano de publicação do livro
    FKAutorID INT, -- Referência ao autor do livro
    FOREIGN KEY (FKAutorID) REFERENCES Autor(AutorID) ON DELETE CASCADE -- Chave estrangeira referenciando Autor, com exclusão em cascata
);

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do cliente, auto incrementado
    Nome VARCHAR(100) NOT NULL, -- Nome do cliente, campo obrigatório
    Email VARCHAR(100) NOT NULL, -- E-mail do cliente, campo obrigatório
    Telefone VARCHAR(20) -- Telefone do cliente
);

-- Criação da tabela Empréstimo
CREATE TABLE Emprestimo (
    EmprestimoID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único do empréstimo, auto incrementado
    FKLivroID INT, -- Referência ao livro emprestado
    FKClienteID INT, -- Referência ao cliente que realizou o empréstimo
    DataEmprestimo DATE NOT NULL, -- Data do empréstimo, campo obrigatório
    DataDevolucao DATE, -- Data de devolução do livro
    FOREIGN KEY (FKLivroID) REFERENCES Livro(LivroID) ON DELETE CASCADE, -- Chave estrangeira referenciando Livro, com exclusão em cascata
    FOREIGN KEY (FKClienteID) REFERENCES Cliente(ClienteID) ON DELETE CASCADE -- Chave estrangeira referenciando Cliente, com exclusão em cascata
);