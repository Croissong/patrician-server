defmodule PatricianServer.Router do
  use Phoenix.Router


  pipeline :graphql do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Poison
  end

  scope "/" do
    pipe_through [:graphql]

    forward "/graphql", Absinthe.Plug,
      schema: PatricianServer.Schema

    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: PatricianServer.Schema
  end
end
