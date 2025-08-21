with campaign_performance as (
    select * from {{ref("trs_campaign_performance")}}
)
select * from campaign_performance