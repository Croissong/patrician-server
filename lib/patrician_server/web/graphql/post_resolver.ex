defmodule PatricianServer.PostResolver do
  def all(_args, _info) do
    {:ok, PatricianServer.Repo.all(PatricianServer.Post)}
  end
end
