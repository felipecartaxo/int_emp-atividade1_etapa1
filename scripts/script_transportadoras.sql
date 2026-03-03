-- Popula a tabela de transportadoras
CREATE TABLE transportadoras (
    transportadora_id   INTEGER      NOT NULL,
    transportadora_nome VARCHAR(100) NOT NULL,
    CONSTRAINT pk_transportadoras PRIMARY KEY (transportadora_id)
);