defmodule PatricianServer.Repo.Migrations.AddPost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string
      add :posted_at, :utc_datetime

      timestamps()
    end
  end
end
