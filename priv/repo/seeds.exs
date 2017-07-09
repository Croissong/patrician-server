towns = [
  %{name: "Lübeck"},
  %{name: "Reval"},
  %{name: "Hamburg"},
  %{name: "Malmö"},
  %{name: "Köln"}
]

Enum.each(towns, fn town ->

end)
PatricianServer.Repo.insert_all(PatricianServer.Town, towns)
