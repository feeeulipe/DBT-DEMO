{{ config(
    materialized='table',
    schema='mart'
) }}
with
curva_abc as(
	select
		*
	from
		{{ ref('int_analise_vendas') }}
)
select
    *
from curva_abc

