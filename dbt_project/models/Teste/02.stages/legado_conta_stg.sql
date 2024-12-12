{ { config(materialized = 'ephemeral') } } with conta as(
    select
        *
    from
        { { source('public', 'legado_conta') } } as cn
)
select
    *
from
    conta