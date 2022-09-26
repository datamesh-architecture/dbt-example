select row_count from
(select count(*) as row_count from {{ ref('my_user') }}) subquery
where row_count < 100
