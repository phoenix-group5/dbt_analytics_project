-- with channels as (
--     select *
--     from {{ ref ("trs_channels")}}
-- ),
-- campaigns as (
--     select * 
--     from {{ ref("trs_campaigns")}}
-- ),

-- dim_campaigns as (
    select cp.campaign_id,
    cp.channel_id,
    cp.campaign_name,
    cp.channel,
    cp.campaign_type,
    cp.target_audience,
    cp.budget,
    cp.start_date,
    cp.end_date,
    cp.status,
    ch.channel_type,
    ch.cost_per_channel
    from {{ref("trs_campaigns")}} cp
    left join {{ref ("trs_channels")}} ch 
    on cp.channel_id = ch.channel_id --all campaigns should have a channel
-- )

-- select * from dim_campaigns