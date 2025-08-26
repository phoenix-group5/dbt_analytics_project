select
  performance_id, --primary key
  date,
  campaign_id, -- foreign key
  coalesce(cast(spend as decimal(18,2)), 0) as spend,
  coalesce(cast(revenue as decimal(18,2)), 0) as revenue,
  clicks,
  conversions,
  impressions,
  leads_generated,
  case
    when cost_per_click > 0 then cast(cost_per_click as decimal(18,2))
    else 0
  end as cost_per_click,
  case
    when cost_per_conversion > 0 then cast(cost_per_conversion as decimal(18,2))
    else 0
  end as cost_per_conversion
FROM {{ref("stg_campaign_performance")}}
WHERE PERFORMANCE_ID IS NOT NULL