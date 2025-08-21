with email_lists as (
    select * from {{source ('raw', 'email_lists')}}
)
select * from email_lists