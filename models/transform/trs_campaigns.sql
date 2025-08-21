
select 
	campaign_id, --primary
	case
		when trim(channel) = 'Email' then 1
		when trim(channel) = 'Social Media' then 2
		when trim(channel) = 'PPC' then 3
		when trim(channel) = 'Display' then 4
		when trim(channel) = 'Content marketing' then 5
		when trim(channel) = 'Influencer' then 6
		when trim(channel) = 'Direct Mail' then 7
	end as channel_id, --foreign key
	trim(campaign_name) as campaign_name,
	trim(channel) as channel,
	start_date,
	end_date,
	trim(campaign_type) as campaign_type,
	trim(target_audience) as target_audience,
	coalesce(budget, 0) as budget,
	trim(status) as status
FROM {{ ref("stg_campaigns") }}
WHERE CAMPAIGN_ID IS NOT NULL

