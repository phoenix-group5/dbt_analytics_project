
/*WITH metric as (
    SELECT
    email_campaign_id,
    campaign_id,
    list_id,
    cast(send_date as date) as send_date,
    subject_line,
    revenue_generated,
    sent_count,
    delivered_count,
    open_count,
    click_count,
    conversion_count,
    bounce_count,
    unsubscribe_count
FROM {{ ref("trs_email_campaigns")}}
WHERE email_campaign_id is not null
)*/

SELECT
    m.email_campaign_id,
    m.campaign_id,
    el.list_id,
    m.subject_line,
    m.revenue_generated,
    m.sent_count,
    m.delivered_count,
    m.open_count,
    m.click_count,
    m.conversion_count,
    m.bounce_count,
    m.unsubscribe_count,
--derived metrics; engagement rates
    coalesce(nullif(m.delivered_count,0)/nullif(m.sent_count,0),0) as deliverability_rate,
    coalesce(nullif(m.open_count,0)      / nullif(m.delivered_count,0), 0) as open_rate,
    coalesce(nullif(m.click_count,0)     / nullif(m.delivered_count,0), 0) as click_through_rate,
    coalesce(nullif(m.conversion_count,0)/ nullif(m.click_count,0), 0) as post_click_conv_rate,
    coalesce(nullif(m.bounce_count,0)    / nullif(m.sent_count,0), 0) as bounce_rate,
    coalesce(nullif(m.unsubscribe_count,0)/ nullif(m.delivered_count,0), 0) as unsubscribe_rate
FROM {{ ref("trs_email_campaigns")}} m
LEFT JOIN {{ ref("dim_campaigns")}} dc
    ON dc.campaign_id = m.campaign_id
LEFT JOIN {{ ref("dim_email_list")}} el
    ON el.list_id = m.list_id
LEFT JOIN {{ ref("dim_date")}} d
    ON d.date_key = m.send_date
