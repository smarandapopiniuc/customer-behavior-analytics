let
    Source = Sql.Database("DESKTOP-######", "SyneriseDW"),
    dbo_DimProduct = Source{[Schema="dbo",Item="DimProduct"]}[Data]
in
    dbo_DimProduct