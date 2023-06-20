create database locadora;
use locadora;

create table veiculo(
id_veiculo int not null auto_increment,
marca varchar (30),
modelo varchar (30),
descrição varchar (30),
cor varchar (30),
placa varchar (30),
primary key(id_veiculo)
);

create table contrato(
id_contrato int not null auto_increment,
cod_veiculo int,
cod_cliente int,
data_locacao date,
preço_diaria varchar(30),
valor_seguro varchar (30),
primary key(id_contrato)
);

create table cliente(
id_cliente int not null auto_increment,
nome varchar (30),
endereço varchar (30),
cpf varchar (30),
primary key(id_cliente)
);

create table endereço(
id_endereço int not null auto_increment,
cod_cliente int,
rua varchar (30),
numero varchar (30),
cidade varchar (30),
estado varchar (30),
cpf varchar(30),
primary key(id_endereço)
);

create table telefone(
id_telefone int not null auto_increment,
cod_cliente int,
numero varchar (30),
primary key(id_telefone)
);

create table manutençao(
id_manutençao int not null auto_increment,
cod_veiculo int,
modelo varchar (30),
custo varchar (30),
primary key(id_manutençao)
);

alter table telefone add constraint FK_cliente1 foreign key(cod_cliente)references cliente(id_cliente);
alter table endereço add constraint FK_cliente2 foreign key(cod_cliente) references cliente(id_cliente);
alter table contrato add constraint FK_veiculo1 foreign key(cod_veiculo) references veiculo(id_veiculo);
alter table contrato add constraint FK_cliente3 foreign key(cod_cliente) references cliente(id_cliente);
alter table manutençao add constraint FK_veiculo3 foreign key(cod_veiculo) references veiculo(id_veiculo);

insert into telefone(cod_cliente,numero)values 
('1','41985225702');
insert into telefone(cod_cliente,numero)values 
('2','41984777991');

insert into endereço(cod_cliente,rua,numero,cidade,estado,cpf)values 
('1','Rua Das Flores','2050','Paranagua','Parana','12345678954');
insert into endereço(cod_cliente,rua,numero,cidade,estado,cpf)values 
('2','Rua Das Flores','2050','Paranagua','Parana','12345678954');

insert into veiculo(marca,modelo,descrição,cor,placa)values 
('Porshe','911 turbo','carro novo','Preto','MIO-011');
insert into veiculo(marca,modelo,descrição,cor,placa)values 
('Fiat','Punto','carro novo','Branco','6TU0-73');


insert into contrato(cod_veiculo,cod_cliente,data_locacao,preço_diaria,valor_seguro)values
('1','1','2023-10-22','R$1.500,00','R$15.700,00');
insert into contrato(cod_veiculo,cod_cliente,data_locacao,preço_diaria,valor_seguro)values 
('2','2','2022-01-10','R$1.000,00','R$2.900,00');


insert into cliente (nome,endereço,cpf)values 
('Miguel','Rua Miguel R. de Araujo','23742857815');
insert into cliente (nome,endereço,cpf)values 
('Maria','Rua Alipio dos Santos','24076012063');


insert into manutençao(cod_veiculo,modelo,custo)
values ('1','911 turbo','R$1.000,00');
insert into manutençao(cod_veiculo,modelo,custo)
values ('2','Punto','R$600,00');


select * from veiculo;
select * from contrato;
select * from cliente;
select * from manutençao;
select * from telefone;
select * from endereço;

select cliente.nome as NomeCliente, veiculo.marca as Marca, veiculo.modelo as Modelo , contrato.preço_diaria as valor from veiculo
inner join contrato on veiculo.id_veiculo = contrato.cod_veiculo
inner join cliente on  cliente.id_cliente = contrato.cod_cliente
inner join manutençao on veiculo.id_veiculo = manutençao.cod_veiculo
inner join telefone on cliente.id_cliente = telefone.cod_cliente
inner join endereço on cliente.id_cliente = endereço.cod_cliente


