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
)
select * from vendas