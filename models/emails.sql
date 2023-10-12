-- CTE
select distinct email from {{ source('operational_system', 'src_subscriptions') }}
where email is not null