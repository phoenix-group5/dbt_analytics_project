SELECT
EMAIL_CAMPAIGN_ID, 
CAMPAIGN_ID,
LIST_ID, 
SEND_DATE, 
SUBJECT_LINE,
SENT_COUNT,
OPEN_COUNT, 
CLICK_COUNT,
DELIVERED_COUNT, 
CONVERSION_COUNT,
BOUNCE_COUNT,  
UNSUBSCRIBE_COUNT,
REVENUE_GENERATED
FROM {{source("raw","email_campaigns")}}

{# with email_campaigns as (
    select * from {{source ('raw', 'email_campaigns')}}
)
select * from email_campaigns #}