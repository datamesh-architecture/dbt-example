select is_active, count(*)
from {{ ref('subscription') }}
group by is_active