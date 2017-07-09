defmodule PatricianServer.Repo.Migrations.AddTown do
  use Ecto.Migration

  def change do
    create table(:towns) do
      add :name, :string
    end
  end
end
