defmodule PatricianServer.Town do
  use Ecto.Schema

  import Ecto.{Changeset}
  alias PatricianServer.{Inventory}

  schema "towns" do
    field :name, :string
    has_many :inventories, Inventory
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
