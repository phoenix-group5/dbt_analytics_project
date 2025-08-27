
SELECT DISTINCT
    subscriber_id,
    email,
    first_name,
    last_name,
    gender,
    status,
    country,
    age_group,
    preferences,
    list_id,
    subscription_date,
    subscription_source
FROM {{ ref("trs_subscribers")}}
WHERE subscriber_id is not null