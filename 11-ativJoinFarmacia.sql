-- =====================================================
-- BANCO FARMÁCIA
-- =====================================================

DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS Medicamento;
DROP TABLE IF EXISTS Fornecedor;

-- =====================================================
-- TABELAS
-- =====================================================

CREATE TABLE Medicamento (
    id_medicamento INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    validade DATE NOT NULL,
    laboratorio VARCHAR(100) NOT NULL
);

CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Compra (
    id_compra INT PRIMARY KEY,
    id_medicamento INT,
    id_fornecedor INT,
    quantidade INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (id_medicamento)
        REFERENCES Medicamento(id_medicamento),
    FOREIGN KEY (id_fornecedor)
        REFERENCES Fornecedor(id_fornecedor)
);

-- =====================================================
-- DADOS
-- =====================================================

INSERT INTO Medicamento VALUES
(1,'Paracetamol',12.50,'2027-12-31','EMS'),
(2,'Dipirona',8.90,'2028-05-20','Neo Quimica'),
(3,'Ibuprofeno',18.75,'2027-10-15','Medley'),
(4,'Amoxicilina',35.00,'2027-08-01','Eurofarma'),
(5,'Vitamina C',22.50,'2028-03-10','Cimed'),
(6,'Omeprazol',15.90,'2028-06-30','Aché');

INSERT INTO Fornecedor VALUES
(1,'Distribuidora Saude','Belo Horizonte'),
(2,'Farmalog','Sao Paulo'),
(3,'MedCenter','Rio de Janeiro');

INSERT INTO Compra VALUES
(1,1,1,100,'2026-01-10'),
(2,2,2,80,'2026-02-15'),
(3,3,1,50,'2026-03-20'),
(4,1,2,30,'2026-04-18');

-- =====================================================
-- EXERCÍCIO 21
-- Liste todos os medicamentos com o nome do fornecedor
-- que os forneceu, incluindo medicamentos sem compra.
-- =====================================================

SELECT
    m.nome AS medicamento,
    f.nome AS fornecedor
FROM Medicamento m
LEFT JOIN Compra c
    ON m.id_medicamento = c.id_medicamento
LEFT JOIN Fornecedor f
    ON c.id_fornecedor = f.id_fornecedor
ORDER BY m.nome;

-- =====================================================
-- EXERCÍCIO 22
-- Medicamentos sem fornecedor e que foram comprados.
-- =====================================================

SELECT
    m.nome AS medicamento
FROM Medicamento m
INNER JOIN Compra c
    ON m.id_medicamento = c.id_medicamento
WHERE c.id_fornecedor IS NULL;

-- =====================================================
-- EXERCÍCIO 23
-- Medicamentos com fornecedor e sem compra.
-- =====================================================

SELECT
    m.nome AS medicamento,
    f.nome AS fornecedor
FROM Medicamento m
LEFT JOIN Compra c
    ON m.id_medicamento = c.id_medicamento
LEFT JOIN Fornecedor f
    ON c.id_fornecedor = f.id_fornecedor
WHERE c.id_compra IS NULL
  AND f.id_fornecedor IS NOT NULL;

-- =====================================================
-- EXERCÍCIO 24
-- Medicamentos sem fornecedor e sem compra.
-- =====================================================

SELECT
    m.nome AS medicamento
FROM Medicamento m
LEFT JOIN Compra c
    ON m.id_medicamento = c.id_medicamento
WHERE c.id_compra IS NULL;

-- =====================================================
-- EXERCÍCIO 25
-- Todos os dados dos medicamentos, compras
-- e fornecedores.
-- =====================================================

SELECT
    m.id_medicamento,
    m.nome AS medicamento,
    m.preco,
    m.validade,
    m.laboratorio,

    c.id_compra,
    c.quantidade,
    c.data_compra,

    f.id_fornecedor,
    f.nome AS fornecedor,
    f.cidade

FROM Medicamento m
LEFT JOIN Compra c
    ON m.id_medicamento = c.id_medicamento
LEFT JOIN Fornecedor f
    ON c.id_fornecedor = f.id_fornecedor

ORDER BY m.nome;