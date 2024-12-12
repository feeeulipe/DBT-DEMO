{{ config(
    materialized='table',
    schema='int'
) }}
with 
vendas as(
	select
		*
	from
		{{ ref('stg_vendas') }}
),
produto as(
	select
		*
	from
		{{ ref('stg_produto') }}
),
cliente as(
	select
		*
	from
		{{ ref('stg_cliente') }}
),
vendedor as(
	select
		*
	from
		{{ ref('stg_vendedor') }}
)
select
	v.dt_venda,
	p.nm_produto,
	p.categoria_produto,
	c.nm_cliente,
	c.estado_cliente,
	ve.nm_vendedor,
	ve.regiao_vendedor,
	sum(v.qtd_venda) as qtd_venda,
	sum(v.vlr_total) as vlr_venda
from
	vendas as v
left join produto p on v.id_produto = p.id_produto
left join cliente c on v.id_cliente = c.id_cliente
left join vendedor ve on v.id_vendedor = v.id_vendedor
group by 1,2,3,4,5,6,7


	
	