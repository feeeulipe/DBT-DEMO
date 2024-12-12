{{ config(
    materialized='view',
    schema='stg'
) }}
with
stg_produto as(
select
	cast(id_produto as int) as id_produto,
	categoria as categoria_produto,
	nome_produto as nm_produto,
	marca as marca_produto,
	preco as preco_produto
from {{ source('raw', 'tb_produto') }}
where id_produto is not null
)
select 
    *   
from stg_produto