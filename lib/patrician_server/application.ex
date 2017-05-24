defmodule PatricianServer.Application do
  use Application
  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      supervisor(PatricianServer.Repo, []),
      supervisor(PatricianServer.Web.Endpoint, []),
      # Start your own worker by calling: PatricianServer.Worker.start_link(arg1, arg2, arg3)
      # worker(PatricianServer.Worker, [arg1, arg2, arg3]),
    ]

    opts = [strategy: :one_for_one, name: PatricianServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
