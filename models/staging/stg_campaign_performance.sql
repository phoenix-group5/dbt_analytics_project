with camp_performance as (
    select * from {{source ('raw', 'campaign_performance')}}
)
select * from camp_performance