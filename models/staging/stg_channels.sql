SELECT
CHANNEL_ID, 
CHANNEL_NAME, 
CHANNEL_TYPE, 
COST_PER_CHANNEL
FROM {{source("raw","channels")}}

--with channels as (
--    select * from {{source ('raw', 'channels')}}
--)
--select * from channels