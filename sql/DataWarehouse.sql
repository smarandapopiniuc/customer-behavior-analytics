/*  SyneriseDW - Kimball Star Schema for Event Analytics
    DimDate: calendar dimension for time intelligence
    DimClient: customer attributes (segmentation)
    DimProduct: SKU attributes
    FactEvents: event-level grain (one row per event)*/

USE SyneriseDW;
GO

IF OBJECT_ID('dbo.FactEvents', 'U') IS NOT NULL DROP TABLE dbo.FactEvents;
IF OBJECT_ID('dbo.DimProduct', 'U') IS NOT NULL DROP TABLE dbo.DimProduct;
IF OBJECT_ID('dbo.DimClient', 'U')  IS NOT NULL DROP TABLE dbo.DimClient;
IF OBJECT_ID('dbo.DimDate', 'U')    IS NOT NULL DROP TABLE dbo.DimDate;
GO

CREATE TABLE dbo.DimDate
(
    DateKey        INT          NOT NULL, 
    [Date]         DATE         NOT NULL,
    [Year]         SMALLINT     NOT NULL,
    [Quarter]      TINYINT      NOT NULL,
    [Month]        TINYINT      NOT NULL,
    MonthName      NVARCHAR(20) NOT NULL,
    [Day]          TINYINT      NOT NULL,
    DayOfWeek      TINYINT      NOT NULL, 
    DayName        NVARCHAR(20) NOT NULL,
    IsWeekend      BIT          NOT NULL,
    CONSTRAINT PK_DimDate PRIMARY KEY CLUSTERED (DateKey),
    CONSTRAINT UQ_DimDate_Date UNIQUE ([Date])
);
GO

CREATE TABLE dbo.DimClient
(
    ClientKey  INT IDENTITY(1,1) NOT NULL,
    client_id  NVARCHAR(100) NOT NULL, 
    gender     NVARCHAR(50)  NULL,
    age_group  NVARCHAR(50)  NULL,       
    country    NVARCHAR(100) NULL,
    CONSTRAINT PK_DimClient PRIMARY KEY CLUSTERED (ClientKey),
    CONSTRAINT UQ_DimClient_client_id UNIQUE (client_id)
);
GO

CREATE TABLE dbo.DimProduct
(
    ProductKey INT IDENTITY(1,1) NOT NULL,
    sku        NVARCHAR(100) NOT NULL, 
    category   NVARCHAR(200) NULL,
    price      DECIMAL(18,2) NULL,
    CONSTRAINT PK_DimProduct PRIMARY KEY CLUSTERED (ProductKey),
    CONSTRAINT UQ_DimProduct_sku UNIQUE (sku)
);
GO

CREATE TABLE dbo.FactEvents
(
    EventKey     BIGINT IDENTITY(1,1) NOT NULL,
    ClientKey    INT NOT NULL,
    ProductKey   INT NULL,
    DateKey      INT NOT NULL,                 
    [timestamp]  DATETIME2(0) NOT NULL,
    stage        NVARCHAR(50)  NOT NULL, 

    CONSTRAINT PK_FactEvents PRIMARY KEY CLUSTERED (EventKey),
    CONSTRAINT FK_FactEvents_DimClient  FOREIGN KEY (ClientKey)  REFERENCES dbo.DimClient(ClientKey),
    CONSTRAINT FK_FactEvents_DimProduct FOREIGN KEY (ProductKey) REFERENCES dbo.DimProduct(ProductKey),
    CONSTRAINT FK_FactEvents_DimDate    FOREIGN KEY (DateKey)    REFERENCES dbo.DimDate(DateKey)
);
GO

CREATE INDEX IX_FactEvents_DateKey   ON dbo.FactEvents(DateKey);
CREATE INDEX IX_FactEvents_Stage     ON dbo.FactEvents(stage);
CREATE INDEX IX_FactEvents_ClientKey ON dbo.FactEvents(ClientKey);
GO