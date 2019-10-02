/*AULA 7*/
/******************************************************************/

SELECT p.ProdutoID, p.Nome, p.quantidade
FROM Produto as p
	WHERE EXISTS(SELECT * FROM PedidoProduto AS pp
					WHERE pp.ProdutoID = p.ProdutoID)

/******************************************************************/
/******************************************************************/



/******************************************************************/
/******************************************************************/
SELECT p.Nome 
FROM Categoria AS c
	WHERE EXISTS (SELECT * FROM Produto AS p
			WHERE p.CategoriaID = c.CategoriaID)



SELECT c.Nome AS Categoria, AVG(p.Preco) as Media FROM Categoria AS c
INNER JOIN Produto AS p
ON p.CategoriaID = c.CategoriaID
WHERE 
WHERE (p.Preco)(SELECT AVG(p.Preco) FROM Produto AS p)
			WHERE p.CategoriaID = c.CategoriaID)