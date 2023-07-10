SELECT * 
FROM produto;

SELECT * 
FROM cliente;

SELECT * 
FROM pedido;

SELECT * 
FROM produto 
WHERE valor > 50;

SELECT * 
FROM pedido 
WHERE status_pedido = 'Confirmado';

SELECT * 
FROM cliente 
WHERE is_pessoa_juridica = 1;

SELECT pedido_id_pedido, SUM(quantidade * valor) AS preco_total
FROM pedido_has_produto
JOIN produto ON pedido_has_produto.produto_id_produto = produto.id_produto
GROUP BY pedido_id_pedido;


SELECT * 
FROM produto 
ORDER BY valor ASC;

SELECT * 
FROM pedido 
ORDER BY cliente_id_cliente DESC;

SELECT produto_id_produto, SUM(quantidade) AS total_estoque
FROM produto_has_estoque
GROUP BY produto_id_produto
HAVING total_estoque > 5;

SELECT pedido.id_pedido, cliente.nome AS nome_cliente, produto.nome AS nome_produto
FROM pedido
INNER JOIN cliente ON pedido.cliente_id_cliente = cliente.id_cliente
INNER JOIN pedido_has_produto ON pedido.id_pedido = pedido_has_produto.pedido_id_pedido
INNER JOIN produto ON pedido_has_produto.produto_id_produto = produto.id_produto;

SELECT produto.nome, COALESCE(SUM(produto_has_estoque.quantidade), 0) AS quantidade_estoque
FROM produto
LEFT JOIN produto_has_estoque ON produto.id_produto = produto_has_estoque.produto_id_produto
GROUP BY produto.id_produto;

SELECT pedido.id_pedido, cliente.nome AS nome_cliente, produto.nome AS nome_produto, pedido_has_produto.quantidade, produto.valor, pedido_has_produto.quantidade * produto.valor AS valor_total
FROM pedido
INNER JOIN cliente ON pedido.cliente_id_cliente = cliente.id_cliente
INNER JOIN pedido_has_produto ON pedido.id_pedido = pedido_has_produto.pedido_id_pedido
INNER JOIN produto ON pedido_has_produto.produto_id_produto = produto.id_produto
WHERE pedido.status_pedido = 'Concluído'
HAVING valor_total > 100
ORDER BY valor_total DESC;

