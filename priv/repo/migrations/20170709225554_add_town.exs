defmodule PatricianServer.Repo.Migrations.AddTown do
  use Ecto.Migration

  def change do
    create table(:towns) do
      add :name, :string
    end

    create table(:inventories) do
      add :date, :date
      add :town_id, references(:towns)
    end
  end
end
