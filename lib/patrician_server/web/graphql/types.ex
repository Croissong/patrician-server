defmodule PatricianServer.Schema.Types do
  use Absinthe.Schema.Notation

  alias PatricianServer.{Town}

  object :town do
    field :name, :string
  end

  object :inventory do
    field :date, :string
    field :town, :town do
      resolve fn inventory, _, _ ->
        batch({PatricianServer.Schema.Helpers, :by_id, Town}, inventory.town_id, fn batch_results ->
          {:ok, Map.get(batch_results, inventory.town_id)}
        end)
      end
    end
  end
end
