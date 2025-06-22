create database LocadoraVeiculos;
use LocadoraVeiculos;

create table Ciente(
idCliente int primary key not null,
CPF varchar(20) not null,
nome varchar(50) not null,
telefone varchar(20) not null,
email varchar(50) not null,
endereco varchar(100) not null
);

create table Locacao(
idLocacao int primary key not null,
idCliente int not null,
idPagamento int not null,
dataInicio date not null,
dataFim date not null,
constraint fk_Pagamento
foreign key(idPagamento) references Pagamento(idPagamento)
);

create Table Pagamento(
idPagamento int primary key not null,
forma enum('Cartão', 'PIX', 'Dinheiro') not null,
dataPagamento date not null,
valorTotal decimal(7, 2) not null,
estado enum('Pago', 'Pendente') not null
);

create Table Veiculo(
idVeiculo int primary key not null,
modelo varchar(50) not null,
marca varchar(50) not null,
ano int not null,
placa varchar(10) not null,
valorDiaria decimal(7, 2) not null,
estado enum('Disponível', 'Alugado', 'Manutenção') not null
);

create Table LocacaoVeiculo(
idLocacao int primary key not null,
idVeiculo int primary key not null,
constraint fk_Locacao
foreign key(idLocacao) references Locacao(idLocacao),
constraint fk_Veiculo
foreign key(idVeiculo) references Veiculo(idVeiculo)
);

create table Manutencao(
idManutencao int primary key not null,
idVeiculo int not null,
descricao varchar(100) not null,
dataManutencao date not null,
custo decimal(7, 2) not null,
constraint fk_Veiculo
foreign key(idVeiculo) references Veiculo(idVeiculo)
);