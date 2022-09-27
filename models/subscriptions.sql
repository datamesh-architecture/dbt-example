select *
from {{ source('operational_system', 'src_subscriptions') }}