with subscribers as (
    select * from {{source ('raw', 'subscribers')}}
)
select * from subscribers