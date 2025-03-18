CREATE TABLE Evento (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    data DATE,
    local VARCHAR(100),
    descricao TEXT
);

CREATE TABLE Participante (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Palestrante (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Inscricao (
    id INT PRIMARY KEY,
    data_inscricao DATE,
    evento_id INT,
    participante_id INT,
    FOREIGN KEY (evento_id) REFERENCES Evento(id),
    FOREIGN KEY (participante_id) REFERENCES Participante(id)
);

CREATE TABLE Certificado (
    id INT PRIMARY KEY,
    data_emissao DATE,
    participante_id INT,
    FOREIGN KEY (participante_id) REFERENCES Participante(id)
);

INSERT INTO Evento (id, nome, data, local, descricao) VALUES (1, 'Conferência de Tecnologia', '2024-11-15', 'Centro de Convenções', 'Evento sobre inovações em tecnologia');
INSERT INTO Participante (id, nome, email) VALUES (1, 'Carlos Santos', 'carlos@email.com');
INSERT INTO Palestrante (id, nome, especialidade) VALUES (1, 'Roberta Lima', 'Inteligência Artificial');
INSERT INTO Inscricao (id, data_inscricao, evento_id, participante_id) VALUES (1, '2024-11-01', 1, 1);
INSERT INTO Certificado (id, data_emissao, participante_id) VALUES (1, '2024-11-16', 1);

-- Consultar todos os palestrantes de um evento
SELECT Palestrante.nome 
FROM Palestrante
JOIN Evento_Palestrante ON Palestrante.id = Evento_Palestrante.palestrante_id
WHERE Evento_Palestrante.evento_id = 1;

-- Consultar todos os participantes inscritos em um evento
SELECT Participante.nome, Participante.email
FROM Participante
JOIN Inscricao ON Participante.id = Inscricao.participante_id
WHERE Inscricao.evento_id = 1;
