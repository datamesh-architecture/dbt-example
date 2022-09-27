select row_count
from (select count(*) as row_count from {{ ref('subscriptions') }}) subquery
where row_count < 100
