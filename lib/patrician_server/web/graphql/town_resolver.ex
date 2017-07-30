defmodule PatricianServer.TownResolver do
  def all(_args, _info) do
    {:ok, PatricianServer.Repo.all(PatricianServer.Town)}
  end
end

defmodule PatricianServer.InventoryResolver do
  def all(_args, _info) do
    {:ok, PatricianServer.Repo.all(PatricianServer.Inventory)}
  end
end
