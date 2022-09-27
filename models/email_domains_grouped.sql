with subscription as (
    select * from {{ source('operational_system', 'src_subscription') }}
),

email_provider as (
    select * from {{ ref('email_provider')}}
)

select name, split_part(email, '@', 2) as email_domain, count(*) as email_domain_count
from subscription u left join email_provider e on lower (split_part(u.email, '@', 2)) = e.domain
group by rollup (name, email_domain)
order by name, email_domain
