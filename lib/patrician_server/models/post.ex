defmodule PatricianServer.Post do
  use Ecto.Schema

  import Ecto.{Changeset}

  schema "posts" do
    field :title, :string
    field :body, :string
    field :posted_at, Ecto.DateTime

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :posted_at])
    |> validate_required([:title, :body])
  end
end
