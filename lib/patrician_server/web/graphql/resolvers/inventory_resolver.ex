defmodule PatricianServer.InventoryResolver do

  import Ecto.Query

  alias PatricianServer.{Inventory, Repo}

  def all(%{town_id: town_id}, _info) do
    inventories = Inventory
    |> where([m], m.town_id == ^town_id)
    |> Repo.all
    {:ok, inventories}
  end

  def create(args, _info) do
    %Inventory{}
    |> Inventory.changeset(args)
    |> Repo.insert
  end
end
