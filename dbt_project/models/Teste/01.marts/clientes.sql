{ { config(materialized = 'table') } } with cliente as(
	select
		cn.id_conta,
		cn.id_cliente,
		cl.nome,
		cl.genero,
		cl.state
	from
		{ { ref('legado_conta_stg') } } as cn
		left join { { ref('legado_cliente_stg') } } as cl on cn.id_cliente = cl.id_cliente
)
select
	*
from
	cliente