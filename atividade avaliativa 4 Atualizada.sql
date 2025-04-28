CREATE DATABASE livraria2;

USE livraria2;

CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(45) NOT NULL,
	rg_cliente BIGINT,
    cpf_cliente BIGINT UNIQUE,
    pais VARCHAR(45) DEFAULT 'Brasil',
    PRIMARY KEY (id_cliente)
);

CREATE TABLE financiador(
	id_financiador INT NOT NULL AUTO_INCREMENT,
    nome_finaciador VARCHAR(45) DEFAULT 'Financiador Público',
    cnpj_financiador BIGINT,
    PRIMARY KEY (id_financiador)
);

CREATE TABLE livro(
	id_livro INT NOT NULL AUTO_INCREMENT,
    isbn_livro INT,
    titulo_livro VARCHAR(45),
    preco_livro DECIMAL,
    categoria_livro ENUM ('Horror', 'Ficção', 'Romance', 'Ação') ,
	id_editora INT,
    id_autor INT,
    id_finaciador INT,
    CHECK (preco_livro >= 0),
    PRIMARY KEY (id_livro)
);

CREATE TABLE pedido(
	id_pedido INT NOT NULL AUTO_INCREMENT,
    id_livro INT,
    qtd_pedido INT,
    id_cliente INT,
    CHECK (qtd_pedido >= 0),
    PRIMARY KEY (id_pedido)
);

CREATE TABLE autor(
	id_autor INT NOT NULL AUTO_INCREMENT,
    nome_autor VARCHAR(45) NOT NULL,
    rg_autor BIGINT,
    PRIMARY KEY (id_autor)
);

CREATE TABLE editora(
	id_editora INT NOT NULL AUTO_INCREMENT,
    nome_editora VARCHAR (45) NOT NULL,
    nomeFantasia_editora ENUM('Editora a','Editora b','Editora c'),
    razaoSocial_editora VARCHAR(100),
    rua VARCHAR (45),
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    pais VARCHAR(45) DEFAULT 'Brasil',
    telefone BIGINT,
    PRIMARY KEY (id_editora)
);

ALTER TABLE pedido
ADD FOREIGN KEY (id_livro)
REFERENCES livro (id_livro);

ALTER TABLE pedido
ADD FOREIGN KEY (id_cliente)
REFERENCES cliente (id_cliente);

ALTER TABLE livro
ADD FOREIGN KEY (id_editora)
REFERENCES editora (id_editora);

ALTER TABLE livro
ADD FOREIGN KEY (id_autor)
REFERENCES autor (id_autor);

ALTER TABLE financiador
ADD FOREIGN KEY (id_financiador)
REFERENCES financiador (id_financiador);