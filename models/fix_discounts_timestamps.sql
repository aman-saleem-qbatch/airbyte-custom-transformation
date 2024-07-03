with source as (
    select *,
        case
            when updated_at ~ '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$' then
                concat(updated_at, '.000000Z')
            else
                updated_at
        end as fixed_updated_at
    from {{ source('Square', 'discounts') }}
)

select
    *,
    fixed_updated_at as updated_at
from source
