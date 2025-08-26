SELECT 
CAMPAIGN_ID, 
CAMPAIGN_NAME,
CHANNEL,
CAMPAIGN_TYPE,
START_DATE,
END_DATE,
BUDGET, 
STATUS, 
TARGET_AUDIENCE
FROM {{source("raw","campaigns")}}

--with campaigns as (
--    select * from {{source ('raw', 'campaigns')}}
--)
--select * from campaigns