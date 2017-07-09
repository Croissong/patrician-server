defmodule PatricianServer.Schema do
  use Absinthe.Schema
  import_types PatricianServer.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &PatricianServer.PostResolver.all/2
    end
  end

end
