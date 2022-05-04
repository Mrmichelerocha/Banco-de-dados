
CREATE TABLE cliente (
cod_cliente integer PRIMARY KEY,
nome varchar(50),
cidade varchar(50),
uf varchar(2),
data_nasc timestamp,
endereco varchar(50)
);

CREATE TABLE nota (
num_nota integer PRIMARY KEY,
data timestamp,
num_parcela integer,
cod_cliente integer NOT NULL,
FOREIGN KEY(cod_cliente) REFERENCES cliente (cod_cliente)
);

CREATE TABLE produto (
cod_produto integer PRIMARY KEY,
qtde_estoque integer,
descricao varchar(50),
valor numeric
);

CREATE TABLE venda (
num_nota integer,
data_vencto date,
data_pagto date,
multa_juro numeric,
valor numeric,
desconto numeric,
PRIMARY KEY(num_nota,data_vencto),
FOREIGN KEY(num_nota) REFERENCES nota (num_nota)
);

CREATE TABLE nota_produto (
num_nota integer,
cod_produto integer,
valor numeric,
qtde integer,
PRIMARY KEY(num_nota,cod_produto),
FOREIGN KEY(num_nota) REFERENCES nota (num_nota),
FOREIGN KEY(cod_produto) REFERENCES produto (cod_produto)
);


insert into cliente (cod_cliente, nome, cidade, data_nasc, uf, endereco) values (1, 'Cliente 1', 'Araranguá', '1976-10-5', 'SC', 'Endereço 1');
insert into cliente (cod_cliente, nome, cidade, data_nasc, uf, endereco) values (2, 'Cliente 2', 'Arroio do Silva', '1980-09-11', 'SC', 'Endereço 2');
insert into cliente (cod_cliente, nome, cidade, data_nasc, uf, endereco) values (3, 'Cliente 3', 'Araranguá', '1990-08-02','SC', 'Endereço 3');
insert into produto values (1, 10, 'Produto 1', 12.00);
insert into produto values (2, 21, 'Produto 2', 33.00);

insert into nota values (1, '2020-09-02', 0, 1);
insert into nota_produto values (1, 1, 12.00, 3);
insert into nota_produto values (1, 2, 33.00, 8);
insert into venda values (1, '2020-09-02', '2020-09-02', null, 300, null);

insert into nota values (6, '2020-09-21', 0, 1);
insert into nota_produto values (6, 1, 12.00, 3);
insert into nota_produto values (6, 2, 33.00, 8);
insert into venda values (6, '2020-09-21', '2020-09-21', null, 300, null);
 
insert into nota values (4, '2020-10-18', 0, 1);
insert into nota_produto values (4, 1, 23.00, 2);
insert into nota_produto values (4, 2, 33.00, 2);
insert into venda values (1, '2020-10-18', '2020-10-18', null, 112, null);

insert into nota values (2, '2020-10-02', 2, 1);
insert into nota_produto values (2, 1, 12.00, 3);
insert into venda values (2, '2020-11-02', null, null, 18, null);
insert into venda values (2, '2020-12-03', null, null, 18, null);

insert into nota values (3, '2020-10-02', 2, 2);
insert into nota_produto values (3, 1, 12.00, 1);
insert into nota_produto values (3, 2, 33.00, 1);
insert into venda values (3, '2020-11-02', null, null, 22.5, null);
insert into venda values (3, '2020-12-03', null, null, 22.5, null);

insert into nota values (5, '2020-09-21', 2, 2);
insert into nota_produto values (5, 1, 12.00, 1);
insert into nota_produto values (5, 2, 33.00, 1);
insert into venda values (5, '2020-10-21', null, null, 22.5, null);
insert into venda values (5, '2020-11-21', null, null, 22.5, null);

insert into nota values (7, '2020-10-15', 0, 3);
insert into nota_produto values (7, 1, 12.00, 3);
insert into nota_produto values (7, 2, 33.00, 8);
insert into venda values (7, '2020-10-15', '2020-10-15', null, 300, null);

commit;

