{ { config(materialized = 'ephemeral') } } with cliente as(
	select
		*
	from
		{ { source('public', 'legado_cliente') } } as cn
)
select
	*
from
	cliente