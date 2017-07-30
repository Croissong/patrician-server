defmodule PatricianServer.Schema.Helpers do
  import Ecto.Query

  alias PatricianServer.{Repo}

  def by_id(model, ids) do
    model
    |> where([m], m.id in ^ids)
    |> Repo.all
    |> Map.new(&{&1.id, &1})
  end
end
