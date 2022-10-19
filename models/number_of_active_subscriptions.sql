with subscriptions as (
    select * from {{ ref('subscriptions') }}
)

select count(*)
from subscriptions s
where is_active = true
