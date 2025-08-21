with campaigns as (
    select * from {{source ('raw', 'campaigns')}}
)
select * from campaigns