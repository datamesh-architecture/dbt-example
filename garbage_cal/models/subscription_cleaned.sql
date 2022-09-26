select *
from {{ source('operational_system', 'subscription') }}