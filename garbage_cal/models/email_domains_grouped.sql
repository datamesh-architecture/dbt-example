select name, split_part(email, '@', 2) as email_domain, count(*) as email_domain_count
from {{ source('operational_system', 'subscription') }} u left join {{ ref('email_provider')}} e
on lower (split_part(u.email, '@', 2)) = e.domain
group by rollup (name, email_domain)
order by name, email_domain