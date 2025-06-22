create database LocadoraVeiculos;
use LocadoraVeiculos;

create table Ciente(
	idCliente int primary key not null,
    CPF varchar(20) not null,
    nome varchar(50) not null,
    telefone varchar(20),
    email varchar(50),
    endereco varchar(100)
);