/*AULA 2*/

/******************************************************************/

CREATE PROCEDURE insert_produto
AS

INSERT INTO Produto(Nome,Preco,Quantidade, CategoriaID)
VALUES('Doritos','5.40',10,1),
('Fandangos','4.40',12,1);

GO

/* Teste de execução*/
/* EXEC insert_produto; */

/******************************************************************/
/******************************************************************/

CREATE PROCEDURE insert_pedido
AS

INSERT INTO Pedido(Horario,FormaPagamento)
VALUES('12:00:00','Dinheiro'),
('12:30:00','Cartão'),
('12:40:00','Dinheiro');

GO

/* Teste de execução*/
/* EXEC insert_pedido;*/

/******************************************************************/
/******************************************************************/

CREATE PROCEDURE update_nome_preco_produto
@codProd INT,
@nome VARCHAR(45),
@preco DECIMAL(18,0)

AS

UPDATE Produto SET 
Nome = @nome,
Preco = @preco
WHERE ProdutoID = @codProd;

GO

/* Teste de execução*/
/* EXEC update_produto 1,'COCA',100.00; */

/******************************************************************/
/******************************************************************/

CREATE PROCEDURE lista_produto_valor_mult_quant
AS

SELECT Nome,(Preco*Quantidade) AS ValorQuantidade  
FROM Produto

GO

/* Teste de execução*/
/* EXEC lista_produto_valor_mult_quant;*/

/******************************************************************/
/******************************************************************/

CREATE PROCEDURE lista_pedido
AS

SELECT p.PedidoID,p.Horario,(pp.preco*pp.quantidade)as ValorTotal
FROM Pedido as p
JOIN PedidoProduto as pp
ON p.PedidoID = pp.PedidoProdutoID;

GO

/* Teste de execução*/
/* EXEC lista_pedido;*/

/******************************************************************/
/******************************************************************/