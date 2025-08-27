
SELECT DISTINCT
  c.campaign_id,
  c.campaign_name,
  c.status,
  c.channel as channel_name,
  ch.channel_id,
  ch.channel_type,
  c.campaign_type,
  c.target_audience,
  c.budget,
  c.start_date,
  c.end_date
FROM {{ ref('trs_campaigns') }}  c
left join {{ ref('trs_channels') }} ch
  ON c.channel_id = ch.channel_id
WHERE c.campaign_id is not null