with

    subscriptions as (
        select * from {{ ref('subscriptions') }}
    ),

    email_providers as (
        select * from {{ ref('email_providers')}}
    )

select name, split_part(email, '@', 2) as email_domain, count(*) as count
from subscriptions u left join email_providers e on lower (split_part(u.email, '@', 2)) = e.domain
group by rollup (name, email_domain)
order by name, email_domain