{{ config(
    materialized='view',
    schema='stg'
) }}
with stg_vendedor as(
select
	cast(id_vendedor as int) as id_vendedor,
	nome_vendedor as nm_vendedor,
	regiao as regiao_vendedor
from {{ source('raw', 'tb_vendedor') }}
where id_vendedor is not null
)
select 
    * 
from stg_vendedor