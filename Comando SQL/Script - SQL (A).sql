drop table conta;
drop table cliente;

create table cliente
	(cod_cliente integer,
   	nome varchar(50),
   	cidade varchar(50),
   	uf varchar(2),
   	data_nasc date,
   	endereco varchar(100));

alter  table cliente  add constraint pk_cliente primary key  (cod_cliente);

create table conta
  	(cod_conta integer,
   	cod_agencia integer,
   	cod_cliente integer,
   	saldo numeric,
   	data_criacao date);		

alter  table conta add constraint pk_conta primary key  (cod_conta);

alter table conta add constraint fk_cliente foreign key (cod_cliente) references cliente (cod_cliente);


insert into cliente (cod_cliente, nome, cidade, data_nasc) values (1, 'Cliente 1', 'Araranguá', '1976-10-5');
insert into cliente (cod_cliente, nome, cidade, data_nasc) values (2, 'Cliente 2', 'Arroio do Silva', '1980-09-11');
insert into cliente (cod_cliente, nome, cidade, data_nasc) values (3, 'Cliente 3', 'Araranguá', '1952-01-29');
insert into cliente (cod_cliente, nome, cidade, data_nasc) values (4, 'Cliente 4', 'Turvo', '1980-03-21');
insert into cliente (cod_cliente, nome, cidade, data_nasc) values (5, 'Cliente 5', 'Araranguá', '1983-04-11');
insert into cliente (cod_cliente, nome, cidade, data_nasc) values (6, 'Cliente 5', 'Araranguá', '1974-04-11');

insert into conta (cod_conta, cod_agencia, cod_cliente, saldo, data_criacao) values (1, 1, 1, 100.0, '1996-2-10');
insert into conta (cod_conta, cod_agencia, cod_cliente, saldo, data_criacao) values (2, 1, 2, 250.0, '2003-4-19');
insert into conta (cod_conta, cod_agencia, cod_cliente, saldo, data_criacao) values (3, 1, 3, 250.0, '1978-3-21');
insert into conta (cod_conta, cod_agencia, cod_cliente, saldo, data_criacao) values (4, 2, 5, 185.0, '2010-6-02');

