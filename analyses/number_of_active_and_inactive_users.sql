select is_active, count(*)
from {{ ref('subscriptions') }}
group by is_active