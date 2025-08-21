with channels as (
    select * from {{source ('raw', 'channels')}}
)
select * from channels