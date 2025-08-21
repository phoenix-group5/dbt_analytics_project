with campaign_performance as (
    select * from {{source ('raw', 'campaign_performance')}}
)
select * from campaign_performance