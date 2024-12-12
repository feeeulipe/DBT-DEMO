{{ config(
    materialized='view',
    schema='stg'
) }}
with stg_vendas as (
select
	*,
	row_number() over (
               partition by id_venda
order by
	quantidade desc
           ) as remove_duplicata
from
	{{ source('raw', 'tb_vendas') }}
where id_venda is not null
)
select
	/*Primary Key*/
	cast(id_venda as int) as id_venda,

	/*Foreign Keys*/
	cast(id_cliente as int) as id_cliente,
	cast(id_produto as int) as id_produto,
	cast(id_vendedor as int) as id_vendedor,
	cast(data_venda as date) as dt_venda,

	/*Measures Values*/
	quantidade as qtd_venda,
	valor as vlr_produto,
	valor_total as vlr_total
from
	stg_vendas
where
	remove_duplicata = 1

