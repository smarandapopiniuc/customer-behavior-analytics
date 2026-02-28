let
    Source = Sql.Database("DESKTOP-######", "SyneriseDW"),
    dbo_FactEvents = Source{[Schema="dbo",Item="FactEvents"]}[Data]
in
    dbo_FactEvents