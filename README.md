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

## Scripts

Only tested on Mac M1 with homebrew installed

```
start-database
stop-database
install-dbt
update-dbt
```