select *
from {{ ref('subscription_cleaned') }}
where not (is_active)