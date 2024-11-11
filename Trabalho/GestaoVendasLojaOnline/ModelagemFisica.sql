CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Categoria (
    id INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Produto (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    preco FLOAT,
    quantidade_estoque INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

CREATE TABLE Pedido (
    id INT PRIMARY KEY,
    data_pedido DATE,
    status VARCHAR(50),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE Item_Pedido (
    id INT PRIMARY KEY,
    quantidade INT,
    preco_unitario FLOAT,
    pedido_id INT,
    produto_id INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

INSERT INTO Cliente (id, nome, email, telefone, endereco) VALUES (1, 'Maria Oliveira', 'maria@email.com', '987654321', 'Rua B, 456');
INSERT INTO Categoria (id, nome) VALUES (1, 'Eletrônicos');
INSERT INTO Produto (id, nome, descricao, preco, quantidade_estoque, categoria_id) VALUES (1, 'Smartphone', 'Modelo X', 1200.50, 10, 1);
INSERT INTO Pedido (id, data_pedido, status, cliente_id) VALUES (1, '2024-11-02', 'Em andamento', 1);
INSERT INTO Item_Pedido (id, quantidade, preco_unitario, pedido_id, produto_id) VALUES (1, 2, 1200.50, 1, 1);


-- Consultar todos os produtos de uma categoria
SELECT Produto.nome, Produto.preco 
FROM Produto
JOIN Categoria ON Produto.categoria_id = Categoria.id
WHERE Categoria.nome = 'Eletrônicos';

-- Consultar pedidos de um cliente
SELECT Pedido.id, Pedido.data_pedido, Pedido.status
FROM Pedido
WHERE Pedido.cliente_id = 1;
