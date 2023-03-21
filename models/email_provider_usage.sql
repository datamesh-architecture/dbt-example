with
    email_providers as (select * from {{ ref('email_providers') }}),
    emails as (select * from {{ ref('emails')}}),
    emails_with_domain as (
        select *, lower(split_part(email, '@', 2)) as email_domain
        from emails
    ),
    emails_grouped_by_email_provider as (
        select email_providers.name as email_provider, count (*)::integer as email_address_count
        from email_providers, emails_with_domain
        where emails_with_domain.email_domain = email_providers.domain
        group by email_providers.name
    ),
    final as (
        select *
        from emails_grouped_by_email_provider
        where email_address_count >= 10
        order by email_address_count desc
    )

select *
from final


