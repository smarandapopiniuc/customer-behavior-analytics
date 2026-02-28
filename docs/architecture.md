Architecture
Objective

Transform raw event-level behavioral data into a structured analytical environment supporting funnel optimization, customer segmentation, and KPI monitoring.

High-Level Flow
Raw Events → Power Query (Preparation) → SQL Server Data Warehouse → SSIS Orchestration → Power BI Semantic Model (DAX) → Power BI Service

Components
1) Data Preparation (Power Query)
Power Query is used for:
Schema normalization
Data type enforcement
Column standardization
Initial cleansing and filtering
Prepared datasets are exported as clean CSV files and loaded into the warehouse staging layer.

2) Data Warehouse (SQL Server)
A dimensional star schema following Kimball principles:
Fact table at event-level grain
Separate dimension tables (Client, Date, Product)
One-to-many relationships from dimensions to fact
Surrogate / stable business keys
The structure supports efficient aggregations and BI-friendly query patterns.

3) ETL Orchestration (SSIS)
SSIS manages controlled loading into the warehouse:
Staging layer ingestion
Dimension population
Fact population
Basic validation checks
Development was executed on a one-month data slice due to hardware constraints; the pipeline logic supports full-dataset execution.

4) Semantic Model & Analytics (Power BI + DAX)
Power BI connects directly to the warehouse.
Business KPIs are implemented as DAX measures to ensure:
Correct filter-context evaluation
Aggregation consistency
Efficient reporting performance
The model follows a dimension-to-fact relationship design consistent with the warehouse schema.

Non-Functional Design Considerations
Performance: Star schema + measure-based calculations
Maintainability: Clear separation between preparation, warehouse, and semantic layers
Scalability: Architecture supports full data volume in production deployment