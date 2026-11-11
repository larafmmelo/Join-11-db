-- ATIVIDADE 11 - PARTE 3
-- BANCO DE UMA PADARIA

USE padaria_join;

-- 1) Todos os clientes e seus pedidos,
-- incluindo clientes que ainda nao fizeram pedidos.
SELECT
    c.nome AS cliente,
    p.id_pedido,
    p.data_pedido,
    p.total
FROM Cliente c
LEFT JOIN Pedido p
ON c.id_cliente = p.id_cliente
ORDER BY c.nome, p.id_pedido;

-- 2) Cada pedido com o nome do cliente e o valor total.
SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.total
FROM Pedido p
INNER JOIN Cliente c
ON p.id_cliente = c.id_cliente
ORDER BY p.id_pedido;

-- 3) Produtos vendidos em cada pedido,
-- com quantidade e valor total do item.
SELECT
    ip.id_pedido,
    pr.nome AS produto,
    ip.quantidade,
    pr.preco,
    (ip.quantidade * pr.preco) AS total_item
FROM ItemPedido ip
INNER JOIN Produto pr
ON ip.id_produto = pr.id_produto
ORDER BY ip.id_pedido, pr.nome;

-- 4) Clientes que nunca fizeram pedidos.
SELECT
    c.nome AS cliente
FROM Cliente c
LEFT JOIN Pedido p
ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY c.nome;

-- 5) Nome do cliente, numero do pedido e total,
-- considerando apenas pedidos acima de R$ 80,00.
SELECT
    c.nome AS cliente,
    p.id_pedido,
    p.total
FROM Cliente c
INNER JOIN Pedido p
ON c.id_cliente = p.id_cliente
WHERE p.total > 80.00
ORDER BY p.total DESC;