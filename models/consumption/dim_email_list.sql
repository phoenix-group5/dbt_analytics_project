
SELECT DISTINCT
    list_id,
    list_name,
    list_type,
    description,
    created_date,
    subscriber_count
FROM {{ ref("trs_email_lists")}}
WHERE list_id is not null