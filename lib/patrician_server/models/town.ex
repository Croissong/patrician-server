defmodule PatricianServer.Town do
  use Ecto.Schema

  import Ecto.{Changeset}

  schema "towns" do
    field :name, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
