Data Model – Dimensional Star Schema
Overview

The analytical layer is built on a dimensional star schema designed to optimize query performance, scalability, and clarity for business intelligence workloads.

The model separates transactional event data from descriptive attributes, following Kimball dimensional modeling principles.

Fact Table
FactEvents
Grain: One row per user event (behavioral interaction).
THis table captures event-level activity including visit, add-to-cart, and purchase stages.
It contains foreign keys linking to relevant dimensions and supports all KPI calculations.

Dimension Tables
DimClient
Grain: One row per unique client.
Contains demographic attributes (age, country, gender where available) used for segmentation and filtering.

DimDate
Grain: One row per calendar date.
Supports time-based analysis including weekday trends, monthly aggregation, and seasonality detection.

DimProduct
Grain: One row per SKU.
Provides product-level attributes such as category and price for product performance analysis.

Relationships
All dimensions are linked to FactEvents through one-to-many relationships, forming a classic star topology.

This structure ensures:
Efficient aggregation
Clear filter propagation
Scalable analytical performance
Clean separation between facts and descriptive attributes