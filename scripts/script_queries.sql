-- 1) Quem são os 10 maiores clientes em termos de vendas ($)?
SELECT
	cliente_id,
	cliente_nome,
    SUM(vendas) AS total_vendas
FROM vendas_globais
GROUP BY cliente_id, cliente_nome
ORDER BY total_vendas DESC
LIMIT 10;

-- 2) Quais os três maiores países em termos de vendas ($)?
SELECT
	cliente_pais_id,
	cliente_pais,
	SUM(vendas) AS total_vendas
FROM vendas_globais
GROUP BY cliente_pais_id, cliente_pais
ORDER BY total_vendas DESC
LIMIT 3;

-- 3) Quais as categorias de produtos que geram maior faturamento
-- (vendas $) no Brasil?
SELECT
	categoria_id,
	categoria_nome,
	SUM(vendas) AS total_vendas
FROM vendas_globais
WHERE cliente_pais_id = 'BRA'
GROUP BY categoria_id, categoria_nome
ORDER BY total_vendas DESC;

-- 4) Qual a despesa com frete envolvendo cada transportadora?
SELECT
    t.transportadora_id,
    t.transportadora_nome,
    SUM(vg.frete) AS total_frete
FROM vendas_globais vg
JOIN transportadoras t ON t.transportadora_id = vg.transportadora_id
GROUP BY t.transportadora_id, t.transportadora_nome
ORDER BY total_frete DESC;

-- 5) Quais são os principais clientes (vendas $) do segmento
-- "Calçados Masculinos" (Men´s Footwear) na Alemanha?
SELECT
    cliente_id,
    cliente_nome,
    SUM(vendas) AS total_vendas
FROM vendas_globais
WHERE categoria_nome = 'Men´s Footwear'
  AND cliente_pais_id = 'DEU' -- Só pra não causar dúvidas, mas o DEU é a sigla pra Alemanha (Germany) na tabela que o professor nos passou
GROUP BY cliente_id, cliente_nome
ORDER BY total_vendas DESC;

-- 6) Quais os vendedores que mais dão descontos nos Estados Unidos?
SELECT
    v.vendedor_id,
    v.vendedor_nome,
    SUM(vg.desconto) AS total_desconto
FROM vendas_globais vg
JOIN vendedores v ON v.vendedor_id = vg.vendedor_id
WHERE vg.cliente_pais_id = 'USA'
GROUP BY v.vendedor_id, v.vendedor_nome
ORDER BY total_desconto DESC;

-- 7) Quais os fornecedores que dão a maior margem de lucro ($)
-- no segmento "Vestuário Feminino" (Womens wear)?
SELECT
    f.fornecedor_id,
    f.fornecedor_nome,
    SUM(vg.margem_bruta) AS total_margem_bruta
FROM vendas_globais vg
JOIN fornecedores f ON f.fornecedor_id = vg.fornecedor_id
WHERE vg.categoria_nome = 'Womens wear'
GROUP BY f.fornecedor_id, f.fornecedor_nome
ORDER BY total_margem_bruta DESC;

-- 8) Quanto foi vendido ($) em 2009?

-- 8.1) Total vendido em 2009
SELECT
    SUM(vendas) AS total_vendas_2009
FROM vendas_globais
WHERE EXTRACT(YEAR FROM data) = 2009;

-- 8.2) Evolução anual 2009–2012
SELECT
    EXTRACT(YEAR FROM data)::INTEGER AS ano,
    SUM(vendas)                       AS total_vendas
FROM vendas_globais
WHERE EXTRACT(YEAR FROM data) BETWEEN 2009 AND 2012
GROUP BY ano
ORDER BY ano;

-- R: Sim, o faturamente vem crescendo de forma estável,
-- embora de 2011 a 2012 o salto tenha sido bem curto.

-- 9) Quais são os principais clientes (vendas $) do segmento
-- "Calçados Masculinos" (Men´s Footwear) no ano de 2013?
-- Para quais cidades houve venda e quanto?

-- 9.1) Principais clientes em Men´s Footwear no ano de 2013
SELECT	
	cliente_id,
	cliente_nome,
	SUM(vendas) AS total_vendas
FROM vendas_globais
WHERE categoria_nome = 'Men´s Footwear'
  AND EXTRACT(YEAR FROM data) = 2013
GROUP BY cliente_id, cliente_nome
ORDER BY total_vendas DESC;

-- Obs.: Isso aqui não retorna nada, pois não há registros em 2013

-- 9.2) Vendas por cidade em Men´s Footwear no ano de 2013
SELECT
	cliente_cidade,
	SUM(vendas) AS total_vendas
FROM vendas_globais
WHERE categoria_nome = 'Men´s Footwear'
	AND EXTRACT(YEAR FROM data) = 2013
GROUP BY cliente_cidade
ORDER BY total_vendas DESC;

-- 10) Na Europa, quanto se vende ($) para cada país?
--
-- Países europeus presentes na base:
--		Austria, Belgium, Denmark, Finland, France, Germany,
--		Ireland, Italy, Norway, Poland, Portugal, Spain,
--		Sweden, Switzerland, UK
SELECT
    cliente_pais_id,
    cliente_pais,
    SUM(vendas) AS total_vendas
FROM vendas_globais
WHERE cliente_pais_id IN (
    'AUT', 'BEL', 'CHE', 'DEU', 'DNK',
    'ESP', 'FIN', 'FRA', 'GBR', 'IRL',
    'ITA', 'NOR', 'POL', 'PRT', 'SWE'
)
GROUP BY cliente_pais_id, cliente_pais
ORDER BY total_vendas DESC;