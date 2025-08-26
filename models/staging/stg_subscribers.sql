SELECT
SUBSCRIBER_ID,
LIST_ID,
FIRST_NAME,
EMAIL, 
LAST_NAME,
GENDER,
STATUS, 
COUNTRY,
AGE_GROUP,
PREFERENCES,
SUBSCRIPTION_DATE,
SUBSCRIPTION_SOURCE
FROM {{source("raw","subscribers")}}

{# with subscribers as (
    select * from {{source ('raw', 'subscribers')}}
)
select * from subscribers #}