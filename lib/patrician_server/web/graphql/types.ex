defmodule PatricianServer.Schema.Types do
  use Absinthe.Schema.Notation

  object :town do
    field :name, :string
  end
end
