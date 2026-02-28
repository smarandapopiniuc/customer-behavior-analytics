Core KPI Measures

- Unique users interacting with platform: 
Total Users = DISTINCTCOUNT(FactEvents[ClientID_Clean])

- Number of completed purchases: 
Total Purchases = 
CALCULATE(
    COUNTROWS(FactEvents),
    FactEvents[Stage_Clean] = "PURCHASE"
)

- Conversion Rate: Overall Conversion Rate = 
DIVIDE([Total Purchases], [Total Visits])

- Proxy for customer value: 
Avg Purchases per User = 
DIVIDE(
    [Total Purchases],
    [Total Users]
)


Funnel Measures:
Visit → AddToCart conversion
AddToCart → Purchase conversion
Drop-off calculations
Supporting Measures

Additional measures were created for:
Time-series aggregation
Weekday grouping
Segmentation analysis