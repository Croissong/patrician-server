defmodule PatricianServer.Application do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      supervisor(PatricianServer.Repo, []),
      supervisor(PatricianServer.Web.Endpoint, []),
      supervisor(Absinthe.Subscription, [PatricianServer.Web.Endpoint]),
    ]

    opts = [strategy: :one_for_one, name: PatricianServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
