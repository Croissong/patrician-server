defmodule PatricianServer.Inventory do
  use Ecto.Schema

  import Ecto.{Changeset}

  alias PatricianServer.{Town}

  schema "inventories" do
    field :date, :date
    belongs_to :town, Town
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
