with fc_email_cp as (
    select * 
    from {{ref ("trs_email_campaigns")}}
)
select * from fc_email_cp