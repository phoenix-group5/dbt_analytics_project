with
    subscribers as (
        select
            subscriber_id,
            list_id,  -- as su_list_id,
            email,
            first_name,
            last_name,
            gender,
            status,
            country,
            age_group,
            preferences,
            subscription_date,
            subscription_source
        from {{ ref("trs_subscribers") }}
    ),

    email_lists as (
        select
            list_id, list_name, list_type, description, created_date, subscriber_count
        from {{ ref("trs_email_lists") }}
    ),

    dim_email_lists as (
        select
            su.subscriber_id as subscriber_key,
            su.email,
            su.first_name,
            su.last_name,
            su.gender,
            su.status,
            su.country,
            su.age_group,
            su.preferences,
            su.list_id,
            el.list_name,
            el.list_type,
            el.description,  -- i removed the list_id from el, as well as the created date 
            -- (i dont feel its necessary later for the analysts; and the subscriber count)
            su.subscription_date,
            su.subscription_source
        from subscribers su
        left join email_lists el on el.list_id = su.list_id
    )

select *
from dim_email_lists
