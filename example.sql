-- Criação do banco (opcional, mas recomendado)
CREATE DATABASE IF NOT EXISTS empresa_grill;
USE empresa_grill;

-- Criação das tabelas
CREATE TABLE funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    edv CHAR(8) UNIQUE,
    salario DECIMAL(10,2)
);

CREATE TABLE grill (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100),
    valor DECIMAL(5,2) DEFAULT 16.40
);

CREATE TABLE grill_consumo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT,
    grill_id INT,
    data_consumo DATE,
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id),
    FOREIGN KEY (grill_id) REFERENCES grill(id)
);

-- Inserção de funcionários
INSERT INTO funcionarios (nome, edv, salario) VALUES
('Allison', '92904567', 3500.00),
('Brunna', '92901234', 4200.00),
('Cris', '92909999', 3450.00),
('Deborah', '92907890', 3900.00),
('Geovana', '92905678', 3100.00),
('Jiulia', '92901122', 4600.00),
('Jonathan', '92904321', 3200.00),
('Larissa', '92906789', 3700.00),
('Lucas', '92903456', 3400.00),
('Marcia', '92907777', 4000.00),
('Maria Eduarda (gatinha)', '92908901', 9999.00),
('Maria Eloisa', '92901212', 4100.00),
('Nicole', '92904444', 3600.00),
('Rafael', '92902222', 3850.00),
('Vinicius', '92906666', 4300.00);

-- Inserção de pratos do dia
INSERT INTO grill (descricao) VALUES
('Picanha com salmão'),
('Hamburguer cancerigeno'),
('Rato ao molho de ervas'),
('Feijoada completa'),
('Macarrão com larvas');

-- Inserção do id funcionário e seus consumos
INSERT INTO grill_consumo (funcionario_id, grill_id, data_consumo) VALUES
(1, 1, '2025-04-01'),
(1, 2, '2025-04-03'),
(1, 3, '2025-04-04'),
(1, 4, '2025-04-08'),
(1, 5, '2025-04-11'),

(2, 2, '2025-04-02'),
(2, 2, '2025-04-05'),

(3, 1, '2025-04-01'),
(3, 3, '2025-04-06'),
(3, 3, '2025-04-09'),
(3, 5, '2025-04-10'),

(4, 4, '2025-04-01'),
(4, 1, '2025-04-02'),

(5, 5, '2025-04-03'),
(5, 2, '2025-04-07'),

(6, 3, '2025-04-05'),
(6, 1, '2025-04-08'),
(6, 5, '2025-04-11'),

(7, 2, '2025-04-04'),
(7, 2, '2025-04-05'),

(8, 4, '2025-04-03'),
(8, 5, '2025-04-07'),

(9, 1, '2025-04-01'),
(9, 3, '2025-04-02'),
(9, 4, '2025-04-05'),

(10, 5, '2025-04-04'),

(11, 3, '2025-04-06'),
(11, 1, '2025-04-07'),

(12, 2, '2025-04-08'),
(12, 2, '2025-04-10'),

(13, 1, '2025-04-03'),
(13, 5, '2025-04-05'),

(14, 4, '2025-04-02'),
(14, 3, '2025-04-04'),

(15, 2, '2025-04-01'),
(15, 2, '2025-04-06'),
(15, 2, '2025-04-11');

-- Inner Join para ver a pessoa e o que ela consumiu
SELECT nome, descricao, data_consumo, valor
FROM grill_consumo
INNER JOIN funcionarios ON grill_consumo.funcionario_id = funcionarios.id
INNER JOIN grill ON grill_consumo.grill_id = grill.id;
