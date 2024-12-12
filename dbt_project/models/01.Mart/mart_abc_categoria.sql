{{ config(
    materialized='table',
    schema='mart'
) }}
with
curva_abc as(
	select
		*
	from
		{{ ref('int_abc_categoria') }}
)
select
    *
from curva_abc