with test as ( select
                   {{ email_to_domain('\'simon.harrer@innoq.com\'') }}   as actual,
    'innoq.com'                     as expected
)
select *
from test
where test.actual != test.expected
