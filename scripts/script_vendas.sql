'''
	Popula a tabela de vendas globais.

	Lembrando que PedidoID não é único (um pedido pode ter vários itens),
	por isso usamos venda_id SERIAL como chave primária surrogate.
'''
-- 
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