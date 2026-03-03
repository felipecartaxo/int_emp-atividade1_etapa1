-- Popula a tabela de vendedores
CREATE TABLE vendedores (
    vendedor_id   INTEGER      NOT NULL,
    vendedor_nome VARCHAR(100) NOT NULL,
    CONSTRAINT pk_vendedores PRIMARY KEY (vendedor_id)
);