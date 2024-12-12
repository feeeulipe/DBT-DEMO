{{ config(
    materialized='table',
    schema='int'
) }}
with 
produto as(
	select
		*
	from
		{{ ref('stg_produto') }}
)
select * from produto