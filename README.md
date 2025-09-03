# Marketing Analytics dbt Project

A comprehensive dbt project that transforms raw marketing data into a star schema for analytics and reporting.

# Overview
- Source Systems: PostgreSQL (extracted via Airbyte)
- Data Warehouse: Snowflake
- Transformation Tool: dbt Cloud
- Version Control: GitHub

## Project Structure

This project implements a 4-layer data architecture:

### 1. RAW Layer (Source)
- **Source**: Snowflake database `aegroupfive.raw`
- **Tables**: campaigns, campaign_performance, channels, email_campaigns, email_lists, subscribers
- **Purpose**: Raw data as ingested from various marketing systems using airbytes

### 2. STAGING Layer (`stg_` prefix)
- **Schema**: staging
- **Purpose**: Clean column selection and basic data type casting from raw sources
- **Models**: 
  - `stg_campaigns` - Campaign master data
  - `stg_campaign_performance` - Daily campaign performance metrics
  - `stg_channels` - Marketing channel definitions
  - `stg_email_campaigns` - Email campaign performance
  - `stg_email_lists` - Email list definitions
  - `stg_subscribers` - Subscriber information

### 3. TRANSFORM Layer (`trs_` prefix)
- **Schema**: transform
- **Purpose**: Data cleaning, standardization, and business logic application
- **Features**:
  - Data quality improvements (trimming, null handling)
  - Standardized data types
  - Business rules implementation
  - Foreign key creation

### 4. CONSUMPTION Layer (`dim_` and `fct_` prefixes)
- **Schema**: consumption
- **Purpose**: Star schema optimized for analytics and BI tools

#### Dimension Tables:
- `dim_campaigns` - Campaign master with all attributes
- `dim_channels` - Marketing channel lookup
- `dim_email_lists` - Email list definitions
- `dim_subscribers` - Subscriber demographics
- `dim_date` - Date dimension for time-based analysis

#### Fact Tables:
- `fct_campaign_performance` - Daily campaign metrics with calculated KPIs
- `fct_email_campaign_performance` - Email campaign metrics with calculated rates

## Key Features

### Calculated Metrics
The fact tables include pre-calculated business metrics:

**Campaign Performance:**
- ROI Percentage
- Click-through Rate (CTR)
- Conversion Rate

**Email Campaign Performance:**
- Delivery Rate
- Open Rate
- Click-to-Open Rate
- Click-through Rate
- Conversion Rate
- Bounce Rate
- Unsubscribe Rate

### Data Quality
- Comprehensive data tests for uniqueness, not-null constraints
- Referential integrity tests between fact and dimension tables
- Data validation across all layers

### Documentation
- Complete column-level documentation
- Business context for all models
- Data lineage tracking

## Usage

### Running the Project
```bash
# Run all models
dbt run

# Run specific layers
dbt run --models staging
dbt run --models transform
dbt run --models consumption

# Run tests
dbt test

# Generate documentation
dbt docs generate
dbt docs serve
```

### Model Dependencies
```
Raw Sources → Staging → Transform → Consumption
```

## Data Sources

The project processes data from 6 main marketing data sources:
1. **Campaigns** - Marketing campaign definitions
2. **Campaign Performance** - Daily performance metrics
3. **Channels** - Marketing channel lookup
4. **Email Campaigns** - Email-specific campaign data
5. **Email Lists** - Email list definitions
6. **Subscribers** - Customer/subscriber information

## Analytics Use Cases

This star schema supports various analytics use cases:
- Campaign ROI analysis
- Channel performance comparison
- Email marketing effectiveness
- Customer segmentation analysis
- Time-based trend analysis
- Cross-channel attribution

## Configuration

The project is configured to:
- Materialize staging and transform models as tables
- Create separate schemas for each layer
- Include comprehensive testing and documentation

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getdbt.com/) to connect with other Analytics Engineers


