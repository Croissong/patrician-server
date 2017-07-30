defmodule PatricianServer.Schema do
  use Absinthe.Schema
  import_types PatricianServer.Schema.Types

  query do
    field :towns, list_of(:town) do
      resolve &PatricianServer.TownResolver.all/2
    end

    field :inventories, list_of(:inventory) do
      resolve &PatricianServer.InventoryResolver.all/2
    end
  end

end
