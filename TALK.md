# Talk

GREEN

## `models/imperator_dashboard.yaml`

```yaml
version: 2

exposures:

  - name: imperator_dashboard
    type: dashboard
    maturity: high
    url: https://www.muellimperium.com/dashboard
    description: >
      Dashboard für den Imperator.

    owner:
      name: Imperator
      email: imperator@muellimperium.com
```

GREEN

## `models/imperator_dashboard.yaml`

```yaml
version: 2

exposures:

  - name: imperator_dashboard
    type: dashboard
    maturity: high
    url: https://www.muellimperium.com/dashboard
    description: >
      Dashboard für den Imperator.

    depends_on:
      - ref('email_providers_usage')

    owner:
      name: Imperator
      email: imperator@muellimperium.com
```

RED

## `models/email_providers_usage.sql`

```sql
select 'x'
```

GREEN

## `models/email_providers_usage.yml`

```
version: 2

models:
  - name: email_providers_usage
    columns:
      - name: email_provider
        tests:
          - dbt_expectations.expect_column_to_exist
      - name: email_address_count
        tests:
          - dbt_expectations.expect_column_to_exist
```

RED

## `models/email_providers_usage.sql`

```sql
select 'T-Online' as email_provider, '5' as email_address_count
```

GREEN

## `models/email_providers_usage.yml`

```
version: 2

models:
  - name: email_providers_usage
    columns:
      - name: email_provider
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - unique
      - name: email_address_count
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
```

GREEN

## `models/email_providers_usage.yml`

```
version: 2

models:
  - name: email_providers_usage
    columns:
      - name: email_provider
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - unique
          - dbt_expectations.expect_column_values_to_be_of_type:
              column_type: text
      - name: email_address_count
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - dbt_expectations.expect_column_values_to_be_of_type:
              column_type: integer
```

RED

## `models/email_providers_usage.sql`

```sql
select 'T-Online' as email_provider, 5 as email_address_count
```

GREEN

## `models/email_providers_usage.yml`

```
version: 2

models:
  - name: email_providers_usage
    columns:
      - name: email_provider
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - unique
          - dbt_expectations.expect_column_values_to_be_of_type:
              column_type: text
      - name: email_address_count
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - dbt_expectations.expect_column_values_to_be_of_type:
              column_type: integer
    tests:
      - dbt_expectations.expect_table_row_count_to_be_between:
          min_value: 1
          max_value: 20
```

GREEN

## `models/email_providers_usage.yml`

```
version: 2

models:
  - name: email_providers_usage
    columns:
      - name: email_provider
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - unique
          - dbt_expectations.expect_column_values_to_be_of_type:
              column_type: text
      - name: email_address_count
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - dbt_expectations.expect_column_values_to_be_of_type:
              column_type: integer
          - dbt_expectations.expect_column_values_to_be_between:
              min_value: 10
    tests:
      - dbt_expectations.expect_table_row_count_to_be_between:
          min_value: 1
          max_value: 20
```

RED

## `models/email_providers_usage.sql`

```sql
select 'T-Online' as email_provider, 10 as email_address_count
```

GREEN

Rename seed and insert into database.

## `seeds/email_providers.yml`

```yaml
version: 2

seeds:
  - name: email_providers
    description: "Popular e-mail providers with their well-known domain suffixes"
    columns:
      - name: name
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
      - name: domain
        tests:
          - dbt_expectations.expect_column_to_exist
          - dbt_expectations.expect_column_values_to_not_be_null
          - unique
          - dbt_expectations.expect_column_values_to_not_match_regex:
              regex: "^@" # does not start with @ symbol
          - dbt_expectations.expect_column_values_to_not_match_regex:
              regex: "[.].*[.]" # does not start with @ symbol
    tests:
      - dbt_expectations.expect_table_row_count_to_equal:
          value: 38
```

RED

## `seeds/email_providers.sql`

fix errors

GREEN

## `models/email_providers_usage.sql`

```sql
with email_providers as (select * from {{ ref('email_providers') }} )

select email_providers.name as email_provider, 10 as email_address_count
from email_providers
```

RED

## `models/email_providers_usage.sql`

```sql
with email_providers as (select * from {{ ref('email_providers') }} )

select distinct (email_providers.name) as email_provider, 10 as email_address_count
from email_providers
limit 20
```

GREEN

## `models/src_subscriptions.yml`

```yaml
version: 2

sources:
  - name: operational_system
    schema: public
    tables:
      - name: src_subscriptions
        description: "E-mail subscriptions for notifications of upcoming garbage collections"
        columns:
          - name: email
            description: "E-mail of a subscription"
            tests:
              - dbt_expectations.expect_column_to_exist
              - not_null
              - unique
```

RED

## `models/src_subscriptions.yml`

```yaml
version: 2

sources:
  - name: operational_system
    schema: public
    tables:
      - name: src_subscriptions
        description: "E-mail subscriptions for notifications of upcoming garbage collections"
        columns:
          - name: email
            description: "E-mail of a subscription"
            tests:
              - dbt_expectations.expect_column_to_exist
              # - not_null
              # - unique
```

GREEN

## `models/emails.yml`

```yaml
version: 2

models:
  - name: emails
    columns:
      - name: email
        tests:
          - dbt_expectations.expect_column_to_exist
          - not_null
          - unique
```

## `models/emails.sql`

```sql
select email
from {{ source('operational_system', 'src_subscriptions') }}
```

RED

## `models/emails.sql`

```sql
select distinct email
from {{ source('operational_system', 'src_subscriptions') }}
where email is not null
```

GREEN

## `models/email_providers_usage.sql`

```sql
with email_providers as (select *
                         from {{ ref('email_providers') }}),
     emails as (select *
                from {{ ref('emails')}})

select distinct (email_providers.name) as email_provider, 10 as email_address_count
from email_providers limit 20
```

GREEN

## `models/email_providers_usage.sql`

```sql
with email_providers as (select *
                         from {{ ref('email_providers') }}),
     emails as (select *
                from {{ ref('emails')}})

select distinct (email_providers.name) as email_provider, 10 as email_address_count
from email_providers limit 20
```

GREEN

## `models/email_providers_usage.sql`

```sql
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
```

