{{ config(
    materialized='table',
    schema='int'
) }}
with 
cliente as(
	select
		*
	from
		{{ ref('stg_cliente') }}
)
select * from cliente