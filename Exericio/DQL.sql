-- 1. Criação do Banco de Dados e Estrutura de Tabelas (DDL)

-- Criar o banco de dados
CREATE DATABASE hospital;
USE hospital;

-- Criar a tabela Pacientes
CREATE TABLE Pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

-- Criar a tabela Medicos
CREATE TABLE Medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    telefone VARCHAR(15)
);

-- Criar a tabela Consultas
CREATE TABLE Consultas (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    data_consulta DATETIME NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

-- Criar a tabela Exames
CREATE TABLE Exames (
    id_exame INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta INT,
    tipo_exame VARCHAR(100),
    data_exame DATETIME NOT NULL,
    resultado TEXT,
    FOREIGN KEY (id_consulta) REFERENCES Consultas(id_consulta)
);


-- 2. Inserção de Dados (DML)

-- Inserir dados na tabela Pacientes
INSERT INTO Pacientes (nome, data_nascimento, telefone, endereco) VALUES
('João Silva', '1985-05-15', NULL, 'Rua A, 123, Belo Horizonte'),
('Maria Oliveira', '1990-07-20', '31987654322', 'Rua B, 234, Belo Horizonte'),
('Carlos Pereira', '1978-03-12', '31987654323', 'Rua C, 345, Belo Horizonte'),
('Ana Souza', '1995-12-01', NULL, 'Rua D, 456, Belo Horizonte'),
('Pedro Santos', '2000-01-15', '31987654325', 'Rua E, 567, Belo Horizonte');

-- Inserir dados na tabela Medicos
INSERT INTO Medicos (nome, especialidade, telefone) VALUES
('Dr. Ricardo Alves', 'Cardiologia', '31987654330'),
('Dra. Fernanda Lima', 'Pediatria', '31987654331'),
('Dr. Marcos Gomes', 'Ortopedia', '31987654332'),
('Dra. Tatiane Costa', 'Ginecologia', '31987654333'),
('Dr. Felipe Mendes', 'Cardiologia', '31987654334');

-- Inserir dados na tabela Consultas
INSERT INTO Consultas (id_paciente, id_medico, data_consulta, observacoes) VALUES
(1, 1, '2024-11-10 09:00:00', 'Consulta de rotina'),
(2, 2, '2024-11-11 10:30:00', 'Exame de acompanhamento'),
(3, 3, '2024-11-12 14:00:00', 'Dor no joelho'),
(4, 4, '2024-11-13 11:00:00', 'Check-up geral'),
(5, 5, '2024-11-14 15:30:00', 'Consulta oftalmológica');

-- Inserir dados na tabela Exames
INSERT INTO Exames (id_consulta, tipo_exame, data_exame, resultado) VALUES
(1, 'Exame de sangue', '2024-11-10 09:00:00', 'Normal'),
(2, 'Consulta de rotina', '2024-11-11 10:30:00', 'Normal'),
(3, 'Raio-X do joelho', '2024-11-12 14:00:00', 'Fratura detectada'),
(4, 'Ultrassonografia', '2024-11-13 11:00:00', 'Sem anormalidades'),
(5, 'Teste de visão', '2024-11-14 15:30:00', 'Ajuste de óculos necessário');


-- 3. Consultas (DQL)
-- Consultas Básicas
-- Lista todos os pacientes e suas respectivas consultas
SELECT P.nome AS Paciente, C.data_consulta, C.observacoes 
FROM Pacientes P
JOIN Consultas C ON P.id_paciente = C.id_paciente;


-- Operadores
-- Lista todos os pacientes sem números de telefone registrados usando IS NULL
SELECT nome FROM Pacientes WHERE telefone IS NULL;

-- Encontra todos os médicos com especialidades específicas usando IN
SELECT * FROM Medicos WHERE especialidade IN ('Cardiologia', 'Pediatria');

-- Mostra todas as consultas agendadas em um intervalo de datas usando BETWEEN
SELECT * FROM Consultas WHERE data_consulta BETWEEN '2024-11-10' AND '2024-11-13';

-- Filtra pacientes cujo nome comece com "A" usando LIKE
SELECT * FROM Pacientes WHERE nome LIKE 'A%';

-- Usa DISTINCT para listar as especialidades únicas dos médicos
SELECT DISTINCT especialidade FROM Medicos;


-- Funções de Agregação
-- Calcula a idade média dos pacientes
SELECT AVG(YEAR(CURDATE()) - YEAR(data_nascimento)) AS idade_media FROM Pacientes;

-- Conta o número total de consultas realizadas
SELECT COUNT(*) AS total_consultas FROM Consultas;

-- Encontra o valor máximo e mínimo de datas de consulta
SELECT MAX(data_consulta) AS ultima_consulta, MIN(data_consulta) AS primeira_consulta FROM Consultas;

-- Soma o total de exames realizados
SELECT COUNT(*) AS total_exames FROM Exames;


-- Cláusulas Avançadas
-- Lista todos os pacientes ordenados por data de nascimento
SELECT * FROM Pacientes ORDER BY data_nascimento;

-- Lista o número de consultas por médico, mostrando apenas os médicos com mais de uma consulta
SELECT M.nome, COUNT(C.id_consulta) AS total_consultas 
FROM Medicos M
JOIN Consultas C ON M.id_medico = C.id_medico
GROUP BY M.nome
HAVING total_consultas > 1;

-- Lista os exames com dados dos pacientes e médicos envolvidos usando INNER JOIN
SELECT P.nome AS Paciente, M.nome AS Medico, E.tipo_exame, E.data_exame 
FROM Exames E
INNER JOIN Consultas C ON E.id_consulta = C.id_consulta
INNER JOIN Pacientes P ON C.id_paciente = P.id_paciente
INNER JOIN Medicos M ON C.id_medico = M.id_medico;

-- Combina uma lista de médicos e pacientes em uma única lista usando UNION
SELECT nome AS pessoa, 'Medico' AS tipo FROM Medicos
UNION
SELECT nome AS pessoa, 'Paciente' AS tipo FROM Pacientes;

-- Lista todos os pacientes e suas consultas, incluindo pacientes que ainda não têm consulta (LEFT JOIN)
SELECT P.nome AS Paciente, C.data_consulta, C.observacoes 
FROM Pacientes P
LEFT JOIN Consultas C ON P.id_paciente = C.id_paciente;

-- Lista todos os médicos e suas consultas, incluindo médicos que ainda não realizaram consulta (RIGHT JOIN)
SELECT M.nome AS Medico, C.data_consulta, C.observacoes 
FROM Consultas C
RIGHT JOIN Medicos M ON C.id_medico = M.id_medico;

-- Lista todas as consultas e exames correspondentes, incluindo consultas sem exames (LEFT JOIN)
SELECT C.id_consulta, E.tipo_exame, E.data_exame, E.resultado 
FROM Consultas C
LEFT JOIN Exames E ON C.id_consulta = E.id_consulta;

-- Lista todos os médicos e os pacientes atendidos por cada um, incluindo médicos que ainda não atenderam pacientes (RIGHT JOIN)
SELECT M.nome AS Medico, P.nome AS Paciente 
FROM Pacientes P
RIGHT JOIN Consultas C ON P.id_paciente = C.id_paciente
RIGHT JOIN Medicos M ON C.id_medico = M.id_medico;
