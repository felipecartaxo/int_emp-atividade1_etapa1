-- Popula a tabela de fornecedores
CREATE TABLE fornecedores (
    fornecedor_id   INTEGER      NOT NULL,
    fornecedor_nome VARCHAR(100) NOT NULL,
    CONSTRAINT pk_fornecedores PRIMARY KEY (fornecedor_id)
);
