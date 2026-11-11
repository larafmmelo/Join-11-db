-- ATIVIDADE 11 - PARTE 2
-- JOINS COM FILTROS E ORDENACAO

USE empresa_join;

-- 1) Produtos com preco maior que R$ 50,00 e seus fornecedores.
SELECT
    p.nome AS produto,
    e.preco,
    f.nome AS fornecedor
FROM Produto p
INNER JOIN Fornecedor f
ON p.cnpj_fornecedor = f.cnpj
INNER JOIN Estoque e
ON p.id = e.id_produto
WHERE e.preco > 50.00
ORDER BY p.nome;

-- 2) Fornecedores cujo nome comeca com A e seus produtos.
SELECT
    f.nome AS fornecedor,
    p.nome AS produto
FROM Fornecedor f
LEFT JOIN Produto p
ON f.cnpj = p.cnpj_fornecedor
WHERE f.nome LIKE 'A%'
ORDER BY f.nome, p.nome;

-- 3) Fornecedores e produtos em ordem decrescente pelo fornecedor.
SELECT
    f.nome AS fornecedor,
    p.nome AS produto
FROM Fornecedor f
LEFT JOIN Produto p
ON f.cnpj = p.cnpj_fornecedor
ORDER BY f.nome DESC, p.nome;

-- 4) Fornecedores e produtos com preco entre R$ 20,00 e R$ 100,00.
SELECT
    f.nome AS fornecedor,
    p.nome AS produto,
    e.preco
FROM Fornecedor f
INNER JOIN Produto p
ON f.cnpj = p.cnpj_fornecedor
INNER JOIN Estoque e
ON p.id = e.id_produto
WHERE e.preco BETWEEN 20.00 AND 100.00
ORDER BY f.nome, p.nome;

-- 5) Fornecedores, produtos, quantidade em estoque e filiais.
-- LEFT JOIN inclui fornecedores que nao possuem produtos.
SELECT
    f.nome AS fornecedor,
    p.nome AS produto,
    e.quantidade,
    fl.nome AS filial
FROM Fornecedor f
LEFT JOIN Produto p
ON f.cnpj = p.cnpj_fornecedor
LEFT JOIN Estoque e
ON p.id = e.id_produto
LEFT JOIN Filial fl
ON e.cnpj_filial = fl.cnpj
ORDER BY f.nome, p.nome, fl.nome;