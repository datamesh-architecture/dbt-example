select *
from {{ source('operational_system', 'src_collection') }}