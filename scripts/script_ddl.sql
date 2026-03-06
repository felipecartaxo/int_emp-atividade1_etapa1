/*
	Script para criar a estrutura das tabelas e
	seus respectivos relacionamentos
*/

-- Estrutura a tabela de Transportadoras
CREATE TABLE transportadoras (
    transportadora_id   INTEGER      NOT NULL,
    transportadora_nome VARCHAR(100) NOT NULL,
    CONSTRAINT pk_transportadoras PRIMARY KEY (transportadora_id)
);

-- Estrutura a tabela de Fornecedores
CREATE TABLE fornecedores (
	fornecedor_id   INTEGER      NOT NULL,
	fornecedor_nome VARCHAR(100) NOT NULL,
	CONSTRAINT pk_fornecedores PRIMARY KEY (fornecedor_id)
);

-- Estrutura a tabela de Vendedores
CREATE TABLE vendedores (
	vendedor_id   INTEGER      NOT NULL,
	vendedor_nome VARCHAR(100) NOT NULL,
	CONSTRAINT pk_vendedores PRIMARY KEY (vendedor_id)
);

--  Estrutura a tabela de Vendas Globais
CREATE TABLE vendas_globais (
	venda_id            SERIAL          NOT NULL,
	pedido_id           INTEGER         NOT NULL,
	categoria_id        INTEGER,
	categoria_nome      VARCHAR(100),
	categoria_descricao VARCHAR(200),
	cliente_id          INTEGER,
	cliente_nome        VARCHAR(150),
	cliente_contato     VARCHAR(150),
	cliente_cidade      VARCHAR(100),
	cliente_pais_id     CHAR(3),
	cliente_pais        VARCHAR(100),
	vendas_custo        NUMERIC(14, 4),
	margem_bruta        NUMERIC(14, 4),
	vendas              NUMERIC(14, 4),
	desconto            NUMERIC(14, 4),
	frete               NUMERIC(14, 4),
	qtde                INTEGER,
	data                DATE,
	vendedor_id         INTEGER,
	produto_id          INTEGER,
	produto_nome        VARCHAR(200),
	transportadora_id   INTEGER,
	fornecedor_id       INTEGER,
	CONSTRAINT pk_vendas_globais        PRIMARY KEY (venda_id),
	CONSTRAINT fk_vg_vendedor           FOREIGN KEY (vendedor_id)
	    REFERENCES vendedores (vendedor_id),
	CONSTRAINT fk_vg_transportadora     FOREIGN KEY (transportadora_id)
		REFERENCES transportadoras (transportadora_id),
	CONSTRAINT fk_vg_fornecedor         FOREIGN KEY (fornecedor_id)
		REFERENCES fornecedores (fornecedor_id)
);