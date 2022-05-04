/* Lógico_1: */

CREATE TABLE organizacao (
    id_org INTEGER PRIMARY KEY
);

CREATE TABLE registro_de_curriculos_pessoais (
    id_reg INTEGER PRIMARY KEY,
    nome VARCHAR (60),
    idade INTEGER,
    email VARCHAR (60)
);

CREATE TABLE atividade (
    id_atv INTEGER PRIMARY KEY,
    data_de_inicio INTEGER,
    data_de_fim INTEGER
);

CREATE TABLE producao_CTeA (
    codigo_id_ctea INTEGER PRIMARY KEY,
    titulo VARCHAR (60),
    ano INTEGER
);

CREATE TABLE cientifica (
    fk_producao_CTeA_codigo_id_ctea INTEGER,
    id_cient INTEGER,
    local_da_publicacao VARCHAR (60),
    PRIMARY KEY (id_cient, fk_producao_CTeA_codigo_id_ctea)
);

CREATE TABLE tecnica (
    fk_producao_CTeA_codigo_id_ctea INTEGER,
    id_tec INTEGER,
    numero INTEGER,
    data_de_registro INTEGER,
    PRIMARY KEY (numero, id_tec, fk_producao_CTeA_codigo_id_ctea)
);

CREATE TABLE artistica (
    fk_producao_CTeA_codigo_id_ctea INTEGER,
    id_art INTEGER,
    PRIMARY KEY (id_art, fk_producao_CTeA_codigo_id_ctea)
);

CREATE TABLE endereco (
    id_end INTEGER PRIMARY KEY
);

CREATE TABLE residencial_ (
    id_residencial INTEGER,
    fk_endereco_id_end INTEGER,
    PRIMARY KEY (id_residencial, fk_endereco_id_end)
);

CREATE TABLE comercial (
    id_comercial INTEGER,
    fk_endereco_id_end INTEGER,
    PRIMARY KEY (id_comercial, fk_endereco_id_end)
);

CREATE TABLE autores (
    id_aut INTEGER PRIMARY KEY,
    palavra_chave VARCHAR (60)
);

CREATE TABLE trabalhou (
    fk_registro_de_curriculos_pessoais_id_reg INTEGER,
    fk_organizacao_id_org INTEGER
);

CREATE TABLE exerceu_ (
    fk_organizacao_id_org INTEGER,
    fk_atividade_id_atv INTEGER
);

CREATE TABLE categorizada_ (
    fk_atividade_id_atv INTEGER,
    fk_producao_CTeA_codigo_id_ctea INTEGER
);

CREATE TABLE registro_end (
    fk_registro_de_curriculos_pessoais_id_reg INTEGER,
    fk_endereco_id_end INTEGER
);

CREATE TABLE registro_autores (
    fk_producao_CTeA_codigo_id_ctea INTEGER,
    fk_autores_id_aut INTEGER
);
 
ALTER TABLE cientifica ADD CONSTRAINT FK_cientifica_2
    FOREIGN KEY (fk_producao_CTeA_codigo_id_ctea)
    REFERENCES producao_CTeA (codigo_id_ctea)
    ON DELETE CASCADE;
 
ALTER TABLE tecnica ADD CONSTRAINT FK_tecnica_2
    FOREIGN KEY (fk_producao_CTeA_codigo_id_ctea)
    REFERENCES producao_CTeA (codigo_id_ctea)
    ON DELETE CASCADE;
 
ALTER TABLE artistica ADD CONSTRAINT FK_artistica_2
    FOREIGN KEY (fk_producao_CTeA_codigo_id_ctea)
    REFERENCES producao_CTeA (codigo_id_ctea)
    ON DELETE CASCADE;
 
ALTER TABLE residencial_ ADD CONSTRAINT FK_residencial__2
    FOREIGN KEY (fk_endereco_id_end)
    REFERENCES endereco (id_end)
    ON DELETE CASCADE;
 
ALTER TABLE comercial ADD CONSTRAINT FK_comercial_2
    FOREIGN KEY (fk_endereco_id_end)
    REFERENCES endereco (id_end)
    ON DELETE CASCADE;
 
ALTER TABLE trabalhou ADD CONSTRAINT FK_trabalhou_1
    FOREIGN KEY (fk_registro_de_curriculos_pessoais_id_reg)
    REFERENCES registro_de_curriculos_pessoais (id_reg)
    ON DELETE RESTRICT;
 
ALTER TABLE trabalhou ADD CONSTRAINT FK_trabalhou_2
    FOREIGN KEY (fk_organizacao_id_org)
    REFERENCES organizacao (id_org)
    ON DELETE RESTRICT;
 
ALTER TABLE exerceu_ ADD CONSTRAINT FK_exerceu__1
    FOREIGN KEY (fk_organizacao_id_org)
    REFERENCES organizacao (id_org)
    ON DELETE RESTRICT;
 
ALTER TABLE exerceu_ ADD CONSTRAINT FK_exerceu__2
    FOREIGN KEY (fk_atividade_id_atv)
    REFERENCES atividade (id_atv)
    ON DELETE RESTRICT;
 
ALTER TABLE categorizada_ ADD CONSTRAINT FK_categorizada__1
    FOREIGN KEY (fk_atividade_id_atv)
    REFERENCES atividade (id_atv)
    ON DELETE RESTRICT;
 
ALTER TABLE categorizada_ ADD CONSTRAINT FK_categorizada__2
    FOREIGN KEY (fk_producao_CTeA_codigo_id_ctea)
    REFERENCES producao_CTeA (codigo_id_ctea)
    ON DELETE RESTRICT;
 
ALTER TABLE registro_end ADD CONSTRAINT FK_registro_end_1
    FOREIGN KEY (fk_registro_de_curriculos_pessoais_id_reg)
    REFERENCES registro_de_curriculos_pessoais (id_reg)
    ON DELETE RESTRICT;
 
ALTER TABLE registro_end ADD CONSTRAINT FK_registro_end_2
    FOREIGN KEY (fk_endereco_id_end)
    REFERENCES endereco (id_end)
    ON DELETE RESTRICT;
 
ALTER TABLE registro_autores ADD CONSTRAINT FK_registro_autores_1
    FOREIGN KEY (fk_producao_CTeA_codigo_id_ctea)
    REFERENCES producao_CTeA (codigo_id_ctea)
    ON DELETE SET NULL;
 
ALTER TABLE registro_autores ADD CONSTRAINT FK_registro_autores_2
    FOREIGN KEY (fk_autores_id_aut)
    REFERENCES autores (id_aut)
    ON DELETE SET NULL;