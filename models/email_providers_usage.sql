with email_providers as (select * from {{ ref('email_providers') }}),
     final as (select email_providers.name as email_provider, count(*)::integer as email_address_count
               from email_providers, {{ ref('emails') }}
               where email_providers.domain = {{ email_to_domain('email') }}
               group by email_providers.name
               having count(*) >= 10)

select * from final