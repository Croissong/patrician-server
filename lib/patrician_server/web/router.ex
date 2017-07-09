defmodule PatricianServer.Router do
  use Phoenix.Router

  forward "/graphql", Absinthe.Plug,
    schema: PatricianServer.Schema

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: PatricianServer.Schema
end
