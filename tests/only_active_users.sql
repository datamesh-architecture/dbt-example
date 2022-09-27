select *
from {{ ref('subscriptions') }}
where not (is_active)