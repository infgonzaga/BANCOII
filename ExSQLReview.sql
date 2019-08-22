CREATE DATABASE Aula01;

CREATE TABLE Cliente
(
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(45)
);

CREATE TABLE Pedido
(
    PedidoID INT IDENTITY(1,1) PRIMARY KEY,
    Horario VARCHAR(45),
    FormaPagamento VARCHAR(45),
    ClienteID INT FOREIGN KEY REFERENCES Cliente(ClienteID)
);

CREATE TABLE Categoria
(
	CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(45)
);

CREATE TABLE Produto
(
	ProdutoID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(45),
    Preco DECIMAL,
    Quantidade INT,
    CategoriaID INT FOREIGN KEY REFERENCES Categoria(CategoriaID)
);

CREATE TABLE PedidoProduto
(
	PedidoProdutoID INT IDENTITY(1,1) PRIMARY KEY,
	Preco DECIMAL,
	Quantidade INT,
	PedidoID INT FOREIGN KEY REFERENCES Pedido(PedidoID),
	ProdutoID INT FOREIGN KEY REFERENCES Produto(ProdutoID)
);

/*************************************************************/

INSERT INTO Categoria(Nome)
VALUES('Bebida'),
('Limpeza'),
('Fiambreria');


INSERT INTO Cliente(Nome)
VALUES('João'),
('José'),
('Pedro');

INSERT INTO Pedido(Horario,FormaPagamento)
VALUES('12:00:00','Dinheiro'),
('12:30:00','Cartão'),
('12:40:00','Dinheiro');

INSERT INTO Produto(Nome,Preco,Quantidade, CategoriaID)
VALUES('Polar','3.40',10,1),
('Antartica','2.35',12,1),
('Água tônica','2.90',20,1);

