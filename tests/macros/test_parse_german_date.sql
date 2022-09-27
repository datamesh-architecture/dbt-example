with testdata as (select '11.01.2022' as inputdata, make_date(2022, 1, 11) as expectedoutput),
     tests as (select {{ parse_german_date(inputdata) }} as actual, expectedoutput as expected
from testdata)
select *
from tests
where tests.actual != tests.expected

