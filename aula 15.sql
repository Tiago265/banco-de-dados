CREATE DATABASE garagem2;

USE garragem2;

CREATE TABLE estacionamento(
	id_estacionamento INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    capacidade INT NOT NULL,
    subsolo VARCHAR (3),
    especial VARCHAR(3),
    PRIMARY KEY (id_estacionamento)
);

INSERT INTO estacionamento
(nome,capacidade,subsolo,especial)
VALUES
("Estacionamento A", 20, "Não","Não"),
("Estacionamento B", 35, "Sim","Sim"),
("Estacionamento C", 40, "Sim","Sim"),
("Estacionamento D", 50, "Sim","Sim"),
("Estacionamento E", 15, "Sim","Não"),
("Estacionamento F", 85, "Sim","Sim"),
("Estacionamento G", 100, "Não","Não");

SELECT nome, capacidade FROM estacionamento
WHERE capacidade >= 20 AND capacidade <= 40 AND subsolo = 'Sim' AND especial = 'Sim'
ORDER BY capacidade ASC;    

SELECT nome,capacidade FROM	 estacionamento
WHERE capacidade > 50
ORDER BY capacidade DESC;

SELECT nome,capacidade FROM estacionamento
WHERE capacidade > 80 OR nome = 'Estacionamento B'
ORDER BY capacidade ASC;

SELECT * FROM estacionamento
WHERE subsolo = 'Sim' AND especial = 'Sim'
ORDER BY subsolo ASC;

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(45),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE mensalidade(
	id_mensalidade INT NOT NULL AUTO_INCREMENT,
    valor DECIMAL,
    status_pagamento VARCHAR(45),
	id_cliente INT,
    PRIMARY KEY (id_mensalidade)
);

ALTER TABLE mensalidade
ADD FOREIGN KEY (id_cliente)
REFERENCES cliente (id_cliente);

INSERT INTO cliente
(nome)
VALUES
("José"),
("Carlos"),
("Marcos");

SELECT * FROM cliente;

INSERT INTO mensalidade
(id_cliente, valor, status_pagamento)
VALUES
(1, 650.00, "Fatura paga"),
(2, 670.00, "Fatura paga"),
(3, 690.00, "Fatura paga"),
(1, 720.00, "Em débito"),
(2, 740.00, "Em débito"),
(3, 760.00, "Em débito"),
(3, 800.00, "Em débito");
  
SELECT * FROM mensalidade;

-- SUM = vem de soma

SELECT cliente.nome, sum(valor) AS valor_total_mensalidade FROM mensalidade
JOIN cliente 
ON cliente.id_cliente = mensalidade.id_cliente
GROUP BY cliente.nome;

SELECT count(mensalidade.status_pagamento) FROM mensalidade;

-- count = Contagem

SELECT cliente.nome, count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.id_cliente
GROUP BY cliente.nome;

-- AVG = Média

SELECT cliente.nome, AVG(mensalidade.valor) AS valor_total_mensalidade FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.id_cliente
GROUP BY cliente.nome;

SELECT cliente.nome, max(mensalidade.valor) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.id_cliente
GROUP BY cliente.nome;

-- max = Máximo

SELECT cliente.nome, max(mensalidade.valor) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.id_cliente
GROUP BY cliente.nome;

-- min = Minimo 

SELECT cliente.nome, min(mensalidade.valor) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.id_cliente
GROUP BY cliente.nome;


SELECT DISTINCT cliente.nome FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.id_cliente;

CREATE DATABASE senai;

USE senai;

CREATE TABLE aluno(
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    PRIMARY KEY (id_aluno)
);

CREATE TABLE curso(
	id_curso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
	duracao INT,
    PRIMARY KEY (id_curso)
);

CREATE TABLE inscricao(
	id_inscricao INT NOT NULL AUTO_INCREMENT,
    id_aluno INT,
    data_inscricao DATE,
    id_curso INT,
    PRIMARY KEY (id_inscricao)
);

CREATE TABLE mensalidade(
	id_mensalidade INT NOT NULL AUTO_INCREMENT,
    id_inscricao INT,
    data_vencimento DATE,
    valor DECIMAL,
    status_pagamento ENUM('Pago','Não pago'),
    PRIMARY KEY (id_mensalidade)
);

ALTER TABLE curso
MODIFY COLUMN duracao DECIMAL;

ALTER TABLE inscricao
ADD FOREIGN KEY (id_curso)
REFERENCES curso (id_curso);

ALTER TABLE inscricao 
ADD FOREIGN KEY (id_aluno)
REFERENCES aluno (id_aluno);

ALTER TABLE mensalidade
ADD FOREIGN KEY (id_inscricao)
REFERENCES inscricao (id_inscricao);

INSERT INTO aluno
(nome)
VALUES 
('Tiago'),
('Rafael'),
('Bruna'),
('Leticia'),
('Jackson'),
('Julia');

SELECT * FROM aluno;

INSERT INTO curso
(nome, duracao)
VALUES
('Curso técnico de desenvolvimento de sistemas',912.5),
('Curso técnico de análise de sistemas', 547.5),
('Curso rápido de PYTHON', 120),
('Curso rápido de Javascript',120),
('Curso técnico de programação de jogos', 438),
('Graduação de segurança cybernética', 1095);

SELECT * FROM curso;


INSERT INTO inscricao
(data_inscricao, id_aluno, id_curso)
VALUES 
('2020-01-02',4,4),
('2020-01-20',3,3),
('2020-01-02',2,2),
('2020-06-02',4,4),
('2020-06-02',3,3),
('2020-06-02',2,2);

INSERT INTO inscricao
(data_inscricao)
VALUES 
('2020-06-02');

SELECT * FROM inscricao;

INSERT INTO mensalidade 
(data_vencimento, valor, status_pagamento,id_inscricao)
VALUES
('2020-01-10',550,'Pago',1),
('2020-01-10',540,'Pago',2),
('2020-01-10',530,'Pago',3),
('2020-06-10',580,'Não pago',4),
('2020-06-10',570,'Não pago',5),
('2020-06-10',560,'Não pago',6);

SELECT * FROM mensalidade;

SELECT aluno.nome, sum(valor) AS valor_total_mensalidade FROM mensalidade
JOIN inscricao
ON inscricao.id_inscricao = mensalidade.id_inscricao
JOIN aluno
ON aluno.id_aluno = inscricao.id_aluno
GROUP BY aluno.nome;



