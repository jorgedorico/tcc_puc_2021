CREATE TABLE comac.tcc_conformidade STORED AS PARQUET AS
SELECT t1.cart_setor AS setor,
       t1.sit_cad AS situacao_cadastral,
       t1.nat_jur AS natureza_juridica,
       t1.cnae_gru AS cnae_grupo,
	   t1.diferenciado AS grande_empresa, 
       t2.dime_obrigacoes_acessorias AS obrigacoes_acessorias,
       t2.dime_obrigacao_principal AS obrigacao_principal,
       t2.dime_atuacao_fiscal AS atuacao_fiscal,
       t2.dime_analise_comparativa AS analise_comparativa,
       t2.dime_consistencia AS consistencia,
       t2.dime_comercio_exterior AS comercio_exterior,
       t2.dime_conformidade AS conformidade,
	   t3.impac AS impacto
FROM comac.lista_pj AS t1
LEFT JOIN comac.dime_conformidade t2 
ON t1.cnpj=t2.cnpj
LEFT JOIN comac.impacto_pj t3
ON t1.cnpj=t3.cnpj
WHERE t1.diferenciado ilike 'Sim'