WITH 
spine AS 
(
  {{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2025-12-31' as date)"
   )
}}
)
SELECT
  cast(date_day as date)  as date_key,
  cast(extract(year  FROM date_day) as int) as year,
  cast(extract(month FROM date_day) as int) as month,
  cast(extract(day   FROM date_day) as int) as day,
  to_char(date_day, 'Day') as day_name,
  cast(extract(week  FROM date_day) as int) as week_of_year,
  to_char(date_day, 'YYYY-MM') as year_month
FROM spine
ORDER BY date_key
