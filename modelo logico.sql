create database Brewlab;
use Brewlab; 

CREATE TABLE Plano (
    cod_plano INT PRIMARY KEY AUTO_INCREMENT,
    anual VARCHAR(3) DEFAULT 'N',   
    mensal VARCHAR(3) DEFAULT 'N',
    semanal VARCHAR(3) DEFAULT 'N',
    valor DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Cliente (
    cod_cliente INT PRIMARY KEY AUTO_INCREMENT,
    cod_plano INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tipo_de_plano VARCHAR(20) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    FOREIGN KEY (cod_plano) REFERENCES Plano(cod_plano)
);


CREATE TABLE Cerveja (
    cod_cerveja INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    teor_alcoolico DECIMAL(4,2) NOT NULL,
    estilo VARCHAR(50) NOT NULL,
    origem VARCHAR(50) NOT NULL,
    data_de_validade DATE NOT NULL
);


CREATE TABLE Pedido (
    cod_pedido INT PRIMARY KEY AUTO_INCREMENT,
    cod_cliente INT NOT NULL,
    produto VARCHAR(100) NOT NULL,
    data_de_pedido DATE NOT NULL,
    FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente)
);


CREATE TABLE Item_de_pedido (
    cod_pedido INT NOT NULL,
    cod_cerveja INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (cod_pedido, cod_cerveja),
    FOREIGN KEY (cod_pedido) REFERENCES Pedido(cod_pedido),
    FOREIGN KEY (cod_cerveja) REFERENCES Cerveja(cod_cerveja)
);
