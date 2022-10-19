# dbt-playground

## Walk-through

```
cd setup
./install-dbt
vim ~/.dbt/profiles.yml # add postgres credentials from below
./start-database
cd ..
dbt deps
dbt seed
dbt run
dbt test
dbt docs generate
dbt docs serve
```

`~/.dbt/profiles.yml`

```yaml
garbage_calendar:
  outputs:

    dev:
      type: postgres
      threads: 10
      host: localhost
      port: 5432
      user: postgresUser
      pass: postgresPassword
      dbname: postgres
      schema: public

    prod:
      type: postgres
      threads: [1 or more]
      host: [host]
      port: [port]
      user: [prod_username]
      pass: [prod_password]
      dbname: [dbname]
      schema: [prod_schema]

  target: dev
```

### Ways to go

#### Explore

You can simply explore everything on your own.

#### Follow the story

We offer an email notification service where people can subscribe to be notified when to put out the garbage (which is typically one day before a specific gargabe is collected). We support the garbage types organic, diapers, residual, plastic, paper as well as special and bulk waste. A subscription requires a double opt-in before it is active.

We have an incident. Emails from the Provider T-Online are being rejected for four days now. How many customers are potentially affected? How many customers are actually affected? How many sent emails were lost?

What we did so far:
- We imported the operational data (see models/sources or the src_* tables in the database)
- We seeded additional data to be able to aggregate all the different email domains to the Provider T-Oline (see seeds)
- We created `models/email_domains_grouped.sql` as a first start to determine how many customers have T-Online as their provider. This answers the first question.
- Continue to answer the second and third question. Here are some ideas what you could try out: You can try out macros by parsing the dates in the collections. You can build new models with TDD.
