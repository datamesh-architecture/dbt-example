with test as (select {{ parse_german_date('\'11.01.2022\'') }} as actual, make_date(2022, 1, 11) as expected)
select *
from test
where test.actual != test.expected
