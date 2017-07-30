townData = [
  %{name: "Lübeck"},
  %{name: "Reval"},
  %{name: "Hamburg"},
  %{name: "Malmö"},
  %{name: "Köln"}
]

{_, towns} = PatricianServer.Repo.insert_all(PatricianServer.Town, townData, returning: [:id])

Enum.each(towns, fn t ->
  inventories = [%{date: Date.utc_today(), town_id: t.id}, %{date: Date.utc_today(), town_id: t.id}]
  PatricianServer.Repo.insert_all(PatricianServer.Inventory, inventories)
end)
