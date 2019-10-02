/*************************************/

DELIMITER $

CREATE TRIGGER atualiza_estoque_venda AFTER INSERT
ON pedido_produto
FOR EACH ROW 
BEGIN
	UPDATE produtos SET 
    	produtos.quantidade = produtos.quantidade - NEW.quantidade
    WHERE produtos.id = NEW.codProduto;

END$

DELIMITER ;


INSERT INTO pedido_produto (codPedido,codProduto,preco,quantidade)
VALUES(1,1,4.99,2);



/*******/
DELIMITER $

CREATE TRIGGER atualiza_estoque_exclusao AFTER DELETE
ON pedido_produto
FOR EACH ROW 
BEGIN
	UPDATE produtos SET 
    	produtos.quantidade = produtos.quantidade + OLD.quantidade
    WHERE produtos.id = OLD.codProduto;

END$

DELIMITER ;

DELETE FROM pedido_produto
WHERE pedido_produto.id = 1;
/****/
DELIMITER $

CREATE TRIGGER atualiza_estoque_alterado AFTER UPDATE
ON pedido_produto
FOR EACH ROW 
BEGIN
	UPDATE produtos SET 
    	produtos.quantidade = produtos.quantidade + OLD.quantidade - NEW.quantidade
    WHERE produtos.id = NEW.codProduto;

END$

DELIMITER ;

UPDATE pedido_produto
SET quantidade = 1
WHERE pedido_produto.id = 2;
/****/
ALTER TABLE pedidos
ADD COLUMN total DOUBLE NOT NULL;

INSERT INTO pedidos (total)
VALUE(0);

/********/
DELIMITER $

CREATE TRIGGER atualiza_total_pedido_atuatiza_total BEFORE INSERT
ON pedido_produto
FOR EACH ROW 
BEGIN
	UPDATE pedidos SET 
    	pedidos.total = pedidos.total + (NEW.preco * NEW.quantidade)
	WHERE pedidos.id = NEW.codPedido;    

END$

DELIMITER ;


INSERT INTO pedido_produto (codPedido,codProduto,preco,quantidade)
VALUES(1,1,4.99,10);

/*********/
DELIMITER $

CREATE TRIGGER atualiza_total_pedido_produto_removido BEFORE DELETE
ON pedido_produto
FOR EACH ROW 
BEGIN
	UPDATE pedidos SET 
    	pedidos.total = pedidos.total - (OLD.preco * OLD.quantidade)
	WHERE pedidos.id = OLD.codPedido;    

END$

DELIMITER ;



DELETE FROM pedido_produto
WHERE pedido_produto.id = 3;

/*************************************/
