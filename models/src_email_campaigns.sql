with email_campaigns as (
    select * from {{source ('raw', 'email_campaigns')}}
)
select * from email_campaigns