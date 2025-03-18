CREATE TABLE Paciente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Medico (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE Consulta (
    id INT PRIMARY KEY,
    data_consulta DATE,
    status VARCHAR(50),
    observacoes TEXT,
    paciente_id INT,
    medico_id INT,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (medico_id) REFERENCES Medico(id)
);

CREATE TABLE Prontuario (
    id INT PRIMARY KEY,
    data_criacao DATE,
    diagnostico TEXT,
    receita TEXT,
    consulta_id INT,
    FOREIGN KEY (consulta_id) REFERENCES Consulta(id)
);

INSERT INTO Paciente (id, nome, data_nascimento, endereco, telefone) VALUES (1, 'Ana Souza', '1990-05-15', 'Rua C, 789', '1122334455');
INSERT INTO Medico (id, nome, especialidade) VALUES (1, 'Dr. Pedro Silva', 'Cardiologia');
INSERT INTO Consulta (id, data_consulta, status, observacoes, paciente_id, medico_id) VALUES (1, '2024-11-05', 'Concluída', 'Consulta de rotina', 1, 1);
INSERT INTO Prontuario (id, data_criacao, diagnostico, receita, consulta_id) VALUES (1, '2024-11-05', 'Hipertensão', 'Medicamento X', 1);

-- Consultar todas as consultas de um paciente
SELECT Consulta.id, Consulta.data_consulta, Consulta.status 
FROM Consulta
WHERE Consulta.paciente_id = 1;

-- Consultar todos os prontuários de um paciente
SELECT Prontuario.diagnostico, Prontuario.receita 
FROM Prontuario
JOIN Consulta ON Prontuario.consulta_id = Consulta.id
WHERE Consulta.paciente_id = 1;
