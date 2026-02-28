Customer Behavior Analytics (Synerise) — End-to-End BI Project

Overview
This repository documents an end-to-end analytical solution built on a digital commerce event dataset (Synerise). 
The goal is to transform raw behavioral events into decision-ready analytics focused on funnel performance, customer behavior, and segmentation.

Business question: How can we increase customer conversion and revenue?

Key outcomes
- Funnel visibility: Visit → AddToCart → Purchase
- Conversion bottleneck identification
- Time-based behavior insights (seasonality/ weekday patterns)
- Customer segmentation (country, gender, age)


Architecture
Power Query → SQL Server (DW) + SSIS (orchestration) → Power BI semantic model (DAX) → Power BI dashboard

Development was executed on a one-month slice due to local compute constraints, but the model and pipeline are designed to scale to the full dataset in a production environment.

Technology stack
- SQL Server (dimensional data warehouse / star schema)
- SSIS (ETL orchestration)
- Power Query (M) - (initial preparation)
- Power BI + DAX (semantic model, measures, dashboard)
- Python (pandas, numpy) (feature engineering for customer dimension/ segmentation)

Repository contents
- `docs/architecture.md`: end-to-end architecture overview
- `docs/data-model.md`: star schema and modeling rationale
- `docs/ssis.md`: SSIS orchestration summary (with screenshots)
- `docs/dashboard.md`: KPI and dashboard overview
- `sql/`: warehouse script
- `powerquery/`: Power Query M transformations
- `dax/measures.md`: documented DAX measures
- `python/`: feature engineering script for segmentation dimensions

Dashboard
https://app.powerbi.com/groups/me/reports/d48af6ed-0d2b-4200-80ca-146577431989/1f0e582b36a7a6b47744?experience=power-bi

Author
Smaranda Popiniuc