select name, email_domain, count(*) as email_domain_count
from {{ source('operational_system','subscription') }} u left join {{ ref('email_provider')}} e
on lower(u.email_domain) = e.domain
group by name, email_domain
order by email_domain_count desc