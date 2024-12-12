{{ config(materialized='table') }}
with transacoes as(
select
	cm.data_compra,
	cm.id_conta,
	cn.id_cliente,	
	cm.status_compra,
	cm.classificacao_compra,
	cn.status,
	cn.produto,
	sum(replace(cm.valor_compra, '$', '')::numeric) as vlr_vendas
from
	{{ ref('legado_compra_stg') }}  as cm
left join {{ ref('legado_conta_stg') }} as cn 
on
	cm.id_conta = cn.id_conta
group by
	1,
	2,
	3,
	4,
	5,
	6,
	7
)
select
	*
from
	transacoes