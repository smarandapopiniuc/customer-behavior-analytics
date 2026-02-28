let
    Source = Sql.Database("DESKTOP-######", "SyneriseDW"),
    dbo_DimClient = Source{[Schema="dbo",Item="DimClient"]}[Data]
in
    dbo_DimClient