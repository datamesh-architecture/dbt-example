with
    email_providers as (select * from {{ ref('email_providers') }})

select email_providers.name as email_provider, count (*)::integer as email_address_count
from email_providers, {{ ref('emails') }}
where lower(split_part(emails.email, '@', 2)) = email_providers.domain
group by email_providers.name
having count (*) >= 10
