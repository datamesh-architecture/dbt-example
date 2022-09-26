select row_count
from (select count(*) as row_count from {{ ref('subscription_cleaned') }}) subquery
where row_count < 100
