select is_active, count(*)
from {{ source('operational_system', 'subscription') }}
group by is_active