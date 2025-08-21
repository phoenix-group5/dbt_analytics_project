select
  subscriber_id,
  list_id,
   trim(email) as email,
  trim(first_name) as first_name,
  trim(last_name) as last_name,
  case
	  when trim(gender)= 'M' then 'Male'
	  when trim(gender) = 'F' then 'Female' 
	  else 'Other' 
  end as gender,
  trim(status) as status,
  trim(country) as country,
  trim(age_group) as age_group,
  trim(preferences) as preferences,
  subscription_date,
  trim(subscription_source) as subscription_source
FROM {{ref("stg_subscribers") }}
WHERE SUBSCRIBER_ID IS NOT NULL