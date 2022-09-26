# dbt-playground

## Walk-through

```
./install-dbt
# create dbt project
dbt init garbage_cal
cd garbage_cal
# explain structure shortly
vim ~/.dbt/profiles.yml # add postgres credentials
# fill seeds/users.csv with data
dbt seed
```

`~/.dbt/profiles.yml`

```yaml
garbage_cal:
  outputs:

    dev:
      type: postgres
      threads: 10
      host: localhost
      port: 5432
      user: postgresUser
      pass: postgresPassword
      dbname: postgres
      schema: postgres

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