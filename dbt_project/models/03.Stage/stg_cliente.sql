{{ config(
    materialized='view',
    schema='stg'
) }}
with 
stg_clientes as(
	select
	cast(id_cliente as int) as id_cliente,
	nome_cliente as nm_cliente,
	estado as estado_cliente
from {{ source('raw', 'tb_cliente') }}
where id_cliente is not null
)
select * from stg_clientes