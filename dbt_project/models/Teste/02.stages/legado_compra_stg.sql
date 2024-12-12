{ { config(materialized = 'ephemeral') } } with compra as(
	select
		*
	from
		{ { source('public', 'legado_compra') } } as cn
)
select
	*
from
	compra