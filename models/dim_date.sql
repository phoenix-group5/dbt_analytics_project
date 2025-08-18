with sequence as (
    select row_number() over () -1 as n
    from table(generator(rowcount=>2500))
)
select 
    dateadd(day, n, '2019-01-01') :: date as date_key,
    extract(year from dateadd(day, n, '2019-01-01')) as year,
    extract(month from dateadd(day, n, '2019-01-01')) as month,
    extract(day from dateadd(day, n, '2019-01-01')) as day,
    to_char(dateadd(day, n, '2019-01-01'), 'day') as day_name,
    to_char(dateadd(day, n, '2019-01-01'), 'month') as month_name,
