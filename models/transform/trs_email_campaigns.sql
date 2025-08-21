select
  email_campaign_id,
  campaign_id,
  list_id,
  send_date,
  trim(subject_line) as subject_line,
  coalesce(cast(revenue_generated as decimal(18,2)), 0) as revenue_generated,
  coalesce(sent_count, 0) as sent_count,
  coalesce(delivered_count, 0) as delivered_count,
  coalesce(open_count, 0) as open_count,
  coalesce(click_count, 0) as click_count,
  coalesce(conversion_count, 0) as conversion_count,
  coalesce(bounce_count, 0) as bounce_count,
  coalesce(unsubscribe_count, 0) as unsubscribe_count
FROM {{ ref("stg_email_campaigns") }}
WHERE EMAIL_CAMPAIGN_ID IS NOT NULL