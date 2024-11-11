CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Garcom (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    data_pedido DATE,
    status VARCHAR(50),
    cliente_id INT,
    garcom_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (garcom_id) REFERENCES Garcom(id)
);

CREATE TABLE Prato (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao VARCHAR(255),
    preco FLOAT
);

CREATE TABLE Item_Pedido (
    id INT PRIMARY KEY,
    quantidade INT,
    preco_unitario FLOAT,
    pedido_id INT,
    prato_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (prato_id) REFERENCES Prato(id)
);

INSERT INTO Cliente (id, nome, telefone, endereco) VALUES (1, 'Juliana Silva', '9988776655', 'Av. D, 1010');
INSERT INTO Garcom (id, nome) VALUES (1, 'Lucas Pereira');
INSERT INTO Pedido (id, data_pedido, status, cliente_id, garcom_id) VALUES (1, '2024-11-05', 'Em preparo', 1, 1);
INSERT INTO Prato (id, nome, descricao, preco) VALUES (1, 'Feijoada', 'Feijoada completa', 35.50);
INSERT INTO Item_Pedido (id, quantidade, preco_unitario, pedido_id, prato_id) VALUES (1, 2, 35.50, 1, 1);

-- Consultar todos os pratos pedidos por um cliente
SELECT Prato.nome, Item_Pedido.quantidade, Item_Pedido.preco_unitario 
FROM Item_Pedido
JOIN Prato ON Item_Pedido.prato_id = Prato.id
JOIN Pedido ON Item_Pedido.pedido_id = Pedido.id
WHERE Pedido.cliente_id = 1;

-- Consultar todos os pedidos atendidos por um garçom
SELECT Pedido.id, Pedido.data_pedido, Pedido.status
FROM Pedido
WHERE Pedido.garcom_id = 1;
