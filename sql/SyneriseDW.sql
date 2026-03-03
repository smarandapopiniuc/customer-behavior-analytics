use SyneriseDW

CREATE TABLE dbo.DimProduct
(
    sku      NVARCHAR(100) NOT NULL,
    category NVARCHAR(200) NULL,
    price    DECIMAL(18,2) NULL,
    CONSTRAINT PK_DimProduct PRIMARY KEY CLUSTERED (sku)
);
GO 

CREATE TABLE dbo.FactEvents
(
    client_id   NVARCHAR(100) NOT NULL,
    [timestamp] DATETIME2(0)  NOT NULL,
    EventDate   DATE          NOT NULL,
    sku         NVARCHAR(100) NULL,
    stage       NVARCHAR(50)  NOT NULL
);
GO

CREATE TABLE dbo.DimClient
(
	client_id   NVARCHAR(100) NOT NULL,
	gender      NVARCHAR(100) NOT NULL,
	age			NVARCHAR(100) NOT NULL,	
	country		NVARCHAR(100) NOT NULL
);
GO

