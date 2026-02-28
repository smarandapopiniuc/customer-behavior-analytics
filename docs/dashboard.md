Power BI Dashboard - Objective

The dashboard provides a structured analytical view of customer behavior across the full digital commerce funnel.

It translates event-level data into business KPIs supporting conversion optimization and revenue analysis.

Core KPIs
Total Users — distinct count of active clients
Total Purchases — count of completed purchase events
Conversion Rate (Visit → Purchase) — overall funnel efficiency
Avg Purchases per User — proxy for customer value and repeat behavior

All KPIs are implemented as DAX measures to ensure correct filter-context evaluation under slicers and cross-filtering.

Analytical Components

Funnel Analysis
Visualizes progression across stages:
Visit → AddToCart → Purchase
Used to identify high-friction stages and quantify drop-off rates.

Time-Based Analysis
Purchases over time (trend detection)
Weekday performance comparison
Seasonality signals

Segmentation Analysis - Enables comparison of demographic performance and behavioral differences. Breakdown of KPIs by:
Country
Gender
Age group

Technical Notes
Data source: SQL Server dimensional warehouse
Model type: Star schema
Measures implemented in DAX for context-aware calculations
Relationships follow one-to-many dimension-to-fact design

Published Version
An interactive version is available via Power BI Service (see main README).