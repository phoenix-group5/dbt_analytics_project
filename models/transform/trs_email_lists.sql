select
  list_id as source_list_id,
  {{ dbt_utils.generate_surrogate_key(['list_id', 'list_name']) }} as list_id,
  trim(list_name) as list_name,
  trim(list_type) as list_type,
  trim(description) as description,
  created_date,
  coalesce(subscriber_count, 0) as subscriber_count
FROM {{ref("stg_email_lists") }}
WHERE LIST_ID IS NOT NULL