CREATE DATABASE banco;

USE banco;

CREATE TABLE categoria_cliente(
	id_categoria_cliente INT NOT NULL AUTO_INCREMENT,
    nome_categoria_cliente VARCHAR (100),
    PRIMARY KEY (id_categoria_cliente)
);

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR (100),
    cpf BIGINT,
    cnpj BIGINT,
    numero_celular BIGINT,
    rua VARCHAR (65),
	numero INT,
    bairro VARCHAR (45),
    cep INT,
    cidade VARCHAR (45),
    estado VARCHAR(2),
    id_categoria_cliente INT,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE agencia(
	id_agencia INT NOT NULL AUTO_INCREMENT,
    nome_agencia VARCHAR (100),
    PRIMARY KEY (id_agencia)
);

CREATE TABLE tipo_conta(
	id_tipo_conta INT NOT NULL AUTO_INCREMENT,
    descricao_tipo_conta TEXT,
    PRIMARY KEY (id_tipo_conta)
);

CREATE TABLE conta(
	id_conta INT NOT NULL AUTO_INCREMENT,
    valor_conta DECIMAL,
    id_tipo_conta INT,
    id_cliente INT,
    id_agencia INT,
    PRIMARY KEY (id_conta)
);

ALTER TABLE cliente
ADD FOREIGN KEY (id_categoria_cliente)
REFERENCES categoria_cliente(id_categoria_cliente);

RENAME TABLE cateoria_cliente TO categoria_cliente;

ALTER TABLE conta
ADD FOREIGN KEY (id_tipo_conta)
REFERENCES tipo_conta(id_tipo_conta);

ALTER TABLE conta
ADD FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);

ALTER TABLE conta
ADD FOREIGN KEY (id_agencia)
REFERENCES agencia (id_agencia);

INSERT INTO cliente
(nome_cliente, cpf, cnpj, numero_celular, rua, numero, bairro, cep, cidade, estado)
VALUES
('Tiago', 10623056090, 12345678000195, 48991440327, 'Intendente joão Nunes Vieira', 143, 'Ingleses', 88058100, 'Florianópolis', 'SC' ),
('Bundovisque', 23042160042, 48522365000210, 48996462330, 'Paulo Marcondes', 51, 'Jardim Paulista', 190122200, 'São Paulo', 'SP' ),
('Charlote', 27058286977, 50235458000348, 61302902462, 'Rua Jarmando Marçal', 02, 'Taguatinga', 702530075, 'Brasilía', 'DF' ),
('coringa', 27058286952, 20804932000492, 71500604723, 'Rua Do Seu Jardim Do lado', 1562, 'Gotham', 201525900, 'Salvador', 'BA' ),
('Charling capling', 10642186952, 52485874000599, 82345859545, 'Catapimbas', 9236, 'Gotham', 458721602, 'Nova York', 'NY' ),
('Michael Jackson', 87912354612, '32624745000614', 14125214485, 'Carambas', 101151, 'Hollywood', 10000100, 'Los Angeles', 'CA' ),
('Dexter Morgan', 13345698723, 85458122000750, 87954612323, 'Chirufunculos', 879546123, 'Centro de Miami', 84755300, 'Miami', 'FL' ),
('Cristiano Ronaldo', 56456187565, 65123564000832, 98765412354, 'birilim Birilum', 413123456, 'Alfama', 61542564, 'Lisboa', 'LX' );

SELECT * FROM cliente;

INSERT INTO categoria_cliente
(nome_categoria_cliente)
VALUES
('Private'),
('Exclusive'),
('Gold'),
('Básico');

SELECT * FROM categoria_cliente;

INSERT INTO agencia
(nome_agencia)
VALUES
('Ingleses'),
('Centro'),
('Campeche');

SELECT * FROM agencia;

INSERT INTO conta
(valor_conta, id_tipo_conta, id_cliente, id_agencia)
VALUES
(100.00, 2, 1, 1),
(201.54, 1, 2, 3),
(325.21, 1, 3, 2),
(25000.00, 1, 4, 3),  
(50000.25, 2, 5, 2),
(1000000000.000, 2, 6, 2),
(000.000, 1, 7, 3),
(1000000000.000, 2, 8, 2);

SELECT * FROM conta;

SELECT * FROM tipo_conta;

INSERT INTO tipo_conta
(descricao_tipo_conta)
VALUES
('Poupança'),
('Corrente');