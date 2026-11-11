-- =====================================================
-- BANCO CLÍNICA
-- =====================================================

DROP TABLE IF EXISTS Consulta;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Paciente;

-- =====================================================
-- TABELAS
-- =====================================================

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE Consulta (
    id_consulta INT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    data_consulta DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

-- =====================================================
-- DADOS
-- =====================================================

INSERT INTO Paciente VALUES
(1,'Ana Silva','31999990001'),
(2,'Bruno Souza','31999990002'),
(3,'Carlos Lima','31999990003'),
(4,'Daniela Rocha','31999990004'),
(5,'Eduardo Alves','31999990005');

INSERT INTO Medico VALUES
(1,'Dr. João Pereira','Cardiologia'),
(2,'Dra. Maria Santos','Pediatria'),
(3,'Dr. Pedro Oliveira','Ortopedia'),
(4,'Dra. Fernanda Costa','Dermatologia');

INSERT INTO Consulta VALUES
(1,1,1,'2026-01-15',200.00),
(2,2,2,'2026-02-10',150.00),
(3,1,3,'2026-03-05',300.00),
(4,3,1,'2026-04-20',250.00),
(5,2,4,'2026-05-12',180.00);

-- =====================================================
-- EXERCÍCIO 26
-- Liste todos os pacientes e suas consultas,
-- incluindo pacientes sem consultas.
-- =====================================================

SELECT
    p.nome AS paciente,
    c.id_consulta,
    c.data_consulta,
    c.valor,
    m.nome AS medico,
    m.especialidade
FROM Paciente p
LEFT JOIN Consulta c
    ON p.id_paciente = c.id_paciente
LEFT JOIN Medico m
    ON c.id_medico = m.id_medico
ORDER BY p.nome;