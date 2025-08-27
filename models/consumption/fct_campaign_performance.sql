
/*WITH src as (
    SELECT
    performance_id,
    cast(date as date) as date_key,
    campaign_id,
    spend,
    revenue,
    clicks,
    conversions,
    impressions,
    leads_generated,
    cost_per_click,
    cost_per_conversion
FROM {{ ref("trs_campaign_performance")}}
WHERE performance_id is not null
)*/
SELECT
    s.performance_id,
    s.date_key,
    s.campaign_id,
    dc.channel_id,
    s.spend,
    s.revenue,
    s.clicks,
    s.conversions,
    s.impressions,
    s.leads_generated,
--derived KPIs
    coalesce(s.revenue - spend,0) as profit,
    coalesce(nullif(s.revenue, 0) / nullif(s.spend,0), 0) as return_on_ad_spend,
    coalesce(nullif(s.clicks,0) / nullif(s.impressions,0), 0) as click_through_rate,
    coalesce(nullif(s.conversions,0) / nullif(s.clicks,0), 0) as conversion_rate,
    coalesce(s.spend / nullif(s.clicks,0), s.cost_per_click) as actual_cpc,
    coalesce(s.spend / nullif(s.conversions,0), s.cost_per_conversion) as cost_per_conversion
FROM {{ ref("trs_campaign_performance")}} s
LEFT JOIN {{ ref("dim_campaigns")}} dc
    ON dc.campaign_id = s.campaign_id
LEFT JOIN {{ ref("dim_date")}} d
    ON d.date_key = s.date_key
