CREATE DATABASE  loja;

USE loja;

CREATE TABLE pedido(
    id_pedido INT NOT NULL AUTO_INCREMENT,
    data_horario DATETIME,
    tipo_entrega ENUM('Normal', 'Urgente'),
    preco DECIMAL(8,2),
    quantidade INT,
    valor_total DECIMAL(8,2),
    valor_total_com_desconto DECIMAL(8,2),
    PRIMARY KEY(id_pedido)
);

INSERT INTO pedido 
(data_horario, tipo_entrega, preco, quantidade)
VALUES 
('2025-05-05 14:30:00', 'Urgente', 10, 6);

INSERT INTO pedido
(data_horario, tipo_entrega, preco, quantidade)
VALUES 
('2024-01-29 20:40:00','Normal',150, 8),
('2025-10-30 20:40:00','Urgente',130, 15),
('2026-08-04 20:40:00','Normal',80, 3),
('2027-03-10 19:20:00','Urgente',90, 4),
('2030-06-20 06:30:00','Normal',15, 5);

select* FROM pedido;

DELIMITER $$
CREATE TRIGGER valor_total_atualizado
BEFORE INSERT ON pedido 
FOR EACH ROW 
BEGIN
SET new.valor_total = new.preco * new.quantidade;
SET new.valor_total_com_desconto = new.valor_total - (new.valor_total * 0.1);
END;
$$

DELIMITER $$
CREATE TRIGGER valor_total_com_desconto_atualizado
BEFORE INSERT ON pedido 
FOR EACH ROW 
BEGIN
SET new.valor_total_com_desconto = new.valor_total - (new.valor_total * 0.1);
END;
$$

