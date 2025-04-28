CREATE DATABASE	aula_03_25;

USE aula_03_25;

CREATE TABLE aluno(
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
	matricula INT,
    data_nascimento DATE,
    PRIMARY KEY (id_aluno)
);

INSERT INTO aluno
(nome, matricula, data_nascimento)
VALUES
('Bundovisque', 123456,'2008-10-06'),
('Maria',123456789,'2004-06-10');

SELECT * FROM aluno;
--     ⬆️ Tudo

