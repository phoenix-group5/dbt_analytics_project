SELECT
LIST_ID,
LIST_NAME,
LIST_TYPE,
DESCRIPTION,
CREATED_DATE,
SUBSCRIBER_COUNT
FROM {{source("raw","email_lists")}}

{# with email_lists as (
    select * from {{source ('raw', 'email_lists')}}
)
select * from email_lists #}