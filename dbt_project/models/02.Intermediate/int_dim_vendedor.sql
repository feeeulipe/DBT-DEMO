{{ config(
    materialized='table',
    schema='int'
) }}
with 
vendedor as(
	select
		*
	from
		{{ ref('stg_vendedor') }}
)
select * from vendedor