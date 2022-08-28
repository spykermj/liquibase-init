FROM liquibase/liquibase:4.15

WORKDIR /liquibase/schema

COPY db/schema/ .

