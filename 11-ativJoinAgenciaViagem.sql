-- ATIVIDADE 11 - PARTE 4
-- BANCO DE UMA AGENCIA DE VIAGENS

USE viagens_join;

-- 1) Todos os clientes e suas reservas,
-- incluindo clientes sem reservas.
SELECT
    c.nome AS cliente,
    r.id_reserva,
    r.data_viagem,
    r.valor
FROM Cliente c
LEFT JOIN Reserva r
ON c.id_cliente = r.id_cliente
ORDER BY c.nome, r.id_reserva;

-- 2) Reservas com nome do cliente e nome do destino.
SELECT
    r.id_reserva,
    c.nome AS cliente,
    d.nome_destino AS destino,
    r.data_viagem,
    r.valor
FROM Reserva r
INNER JOIN Cliente c
ON r.id_cliente = c.id_cliente
INNER JOIN Destino d
ON r.id_destino = d.id_destino
ORDER BY r.id_reserva;

-- 3) Destinos que ainda nao receberam reservas.
SELECT
    d.nome_destino,
    d.pais
FROM Destino d
LEFT JOIN Reserva r
ON d.id_destino = r.id_destino
WHERE r.id_reserva IS NULL
ORDER BY d.nome_destino;

-- 4) Clientes que ainda nao fizeram reservas.
SELECT
    c.nome AS cliente
FROM Cliente c
LEFT JOIN Reserva r
ON c.id_cliente = r.id_cliente
WHERE r.id_reserva IS NULL
ORDER BY c.nome;

-- 5) Todos os clientes e destinos, com ou sem reserva.
-- CROSS JOIN cria todas as combinacoes entre clientes e destinos.
-- LEFT JOIN acrescenta os dados da reserva quando ela existir.
SELECT
    c.nome AS cliente,
    d.nome_destino AS destino,
    r.id_reserva,
    r.data_viagem,
    r.valor
FROM Cliente c
CROSS JOIN Destino d
LEFT JOIN Reserva r
ON r.id_cliente = c.id_cliente
AND r.id_destino = d.id_destino
ORDER BY c.nome, d.nome_destino;