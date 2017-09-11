defmodule PatricianServer.Schema do
  use Absinthe.Schema
  import_types PatricianServer.Schema.Types

  query do

    field :inventories, list_of(:inventory) do
      arg :town_id, non_null(:id)
      resolve &PatricianServer.InventoryResolver.all/2
    end
  end

  mutation do
    field :add_inventory, :inventory do
      arg :town_id, non_null(:id)
      arg :date, non_null(:string)

      resolve &PatricianServer.InventoryResolver.create/2
    end
  end

  subscription do
    field :inventory_added, :inventory do
      arg :town_id, non_null(:id)

      config fn args, _ ->
        {:ok, topic: args.town_id}
      end

      trigger :add_inventory, topic: fn inventory ->
        inventory.town_id
      end

      resolve fn %{inventory_added: inventory}, _, _ ->
        {:ok, inventory}
      end


    end

  end
end
