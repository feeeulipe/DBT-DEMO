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
),
produto as(
	select
		*
	from
		{{ ref('stg_produto') }}
),
 base AS (
    SELECT
        DATE_TRUNC('month', v.dt_venda) AS mes_ref,
        p.categoria_produto,
        SUM(v.vlr_total) AS vlr_compra,
        SUM(SUM(v.vlr_total)) OVER (PARTITION BY DATE_TRUNC('month', v.dt_venda) ORDER BY SUM(v.vlr_total) DESC) AS vlr_acumulado,
        SUM(SUM(v.vlr_total)) OVER (PARTITION BY DATE_TRUNC('month', v.dt_venda)) AS vlr_total_mes,
        CAST(
            SUM(SUM(v.vlr_total)) OVER (PARTITION BY DATE_TRUNC('month', v.dt_venda) ORDER BY SUM(v.vlr_total) DESC) /
            SUM(SUM(v.vlr_total)) OVER (PARTITION BY DATE_TRUNC('month', v.dt_venda)) * 100
            AS DECIMAL(18, 2)
        ) AS perc_acumulado
    FROM
        vendas AS v
    LEFT JOIN
       produto AS p
        ON v.id_produto = p.id_produto
    GROUP BY
        1, 2
    ORDER BY
        1, 4 DESC
)
SELECT
    date(mes_ref) as mes_ref,
    categoria_produto,
    CASE
        WHEN perc_acumulado <= 80 THEN 'A'
        WHEN perc_acumulado > 80 AND perc_acumulado <= 95 THEN 'B'
        ELSE 'C'
    END AS curva
FROM
    base
    order by 1, 3