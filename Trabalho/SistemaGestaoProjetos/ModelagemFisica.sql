CREATE TABLE Projeto (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,
    status VARCHAR(50)
);

CREATE TABLE Tarefa (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    status VARCHAR(50),
    data_inicio DATE,
    data_fim DATE,
    projeto_id INT,
    FOREIGN KEY (projeto_id) REFERENCES Projeto(id)
);

CREATE TABLE Colaborador (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO Projeto (id, nome, descricao, data_inicio, data_fim, status) VALUES (1, 'Projeto A', 'Desenvolvimento de Sistema', '2024-11-01', '2024-12-31', 'Em andamento');
INSERT INTO Tarefa (id, nome, descricao, status, data_inicio, data_fim, projeto_id) VALUES (1, 'Planejamento', 'Definir escopo', 'Concluída', '2024-11-01', '2024-11-10', 1);
INSERT INTO Colaborador (id, nome, cargo, email) VALUES (1, 'Ricardo Costa', 'Desenvolvedor', 'ricardo@email.com');
INSERT INTO Cliente (id, nome, email) VALUES (1, 'TechCorp', 'techcorp@email.com');


-- Consultar todas as tarefas de um projeto
SELECT Tarefa.nome, Tarefa.status 
FROM Tarefa
WHERE Tarefa.projeto_id = 1;

-- Consultar todos os colaboradores de um projeto
SELECT Colaborador.nome, Colaborador.cargo 
FROM Colaborador
JOIN Tarefa ON Colaborador.id = Tarefa.id
WHERE Tarefa.projeto_id = 1;
