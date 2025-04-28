CREATE DATABASE livraria;

USE livraria;

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(45),
	rg_cliente BIGINT,
    cpf_cliente BIGINT,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE financiador(
	id_financiador INT NOT NULL AUTO_INCREMENT,
    nome_finaciador VARCHAR(45),
    cnpj_financiador BIGINT,
    PRIMARY KEY (id_financiador)
);

CREATE TABLE livro(
	id_livro INT NOT NULL AUTO_INCREMENT,
    isbn_livro INT,
    titulo_livro VARCHAR(45),
    preco_livro DECIMAL,
    categoria_livro VARCHAR(45),
	id_editora INT AUTO_INCREMENT,
    id_autor INT AUTO_INCREMENT,
    id_finaciador INT AUTO_INCREMENT,
    PRIMARY KEY (id_livro)
);

CREATE TABLE pedido(
	id_pedido INT NOT NULL AUTO_INCREMENT,
    id_livro INT AUTO_INCREMENT,
    qtd_pedido INT,
    id_cliente INT AUTO_INCREMENT,
    PRIMARY KEY (id_pedido)
);

CREATE TABLE autor(
	id_autor INT NOT NULL AUTO_INCREMENT,
    nome_autor VARCHAR(45),
    rg_autor BIGINT,
    PRIMARY KEY (id_autor)
);

CREATE TABLE editora(
	id_editora INT NOT NULL AUTO_INCREMENT,
    nomeFantasia_editora VARCHAR(45),
    razaoSocial_editora VARCHAR(100),
    rua VARCHAR (45),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    pais VARCHAR(45),
    telefone BIGINT,
    PRIMARY KEY (id_editora)
);

ALTER TABLE livro
ADD FOREIGN KEY  (id_editora)
REFERENCES editora(id_editora);

ALTER TABLE livro
ADD FOREIGN KEY (id_autor)
REFERENCES autor(id_autor);

ALTER TABLE livro
ADD FOREIGN KEY (id_financiador)
REFERENCES financiador(id_financiador);

ALTER TABLE pedido
ADD FOREIGN KEY (id_livro)
REFERENCES livro(id_livro);

ALTER TABLE pedido
ADD FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente);

INSERT INTO cliente
(nome_cliente,rg_cliente,cpf_cliente)
VALUES
("Tiago", 82515010, 10642186952),
("Homem Aranha", 252545553, 74125836989),
("Batman", 5787394572,14894509312),
("Charlin Chaplin", 979664654, 78348574392),
("Dexter", 3247345745, 89843201830);

SELECT * FROM cliente;

INSERT INTO autor
(nome_autor,rg_autor)
VALUES
("Robert Ribtson", 785412395),
("Cristiano Ronaldo", 1029485849),
("Mickay Mause", 48349523849),
("Bundovsque", 144446464654),
("Miag-Doo", 4326748376);

SELECT *FROM autor;

INSERT INTO financiador
(nome_financiador, cnpj_financiador)
VALUES
("MC Donald", 234434092),
("Monster",29979875897),
("Burguer King",342089235),
("Lamborguini", 32490090345),
("Coca Cola", 239728302984);

SELECT * FROM financiador;

INSERT INTO livro 
(isbn_livro, titulo_livro, preco_livro, categoria_livro, id_editora,id_autor,id_finaciador)
VALUES
(01, "O incrivel mundo de Gumbal", 20.30, "Comédia"),
(02, "Hora de aventura", 30.50, "Aventura"),
(03, "O velho oeste", 50.99, "Ação"),
(04, "Apenas um Show", 20.90, "Ação, Aventura"),
(05, "Invecível", 100.00, "Ação, Aventura, Violência Extrema");

SELECT * FROM livro;

