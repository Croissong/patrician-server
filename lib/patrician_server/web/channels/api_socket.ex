defmodule PatricianServer.Web.ApiSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    socket = socket
    |> assign(:absinthe, %{schema: PatricianServer.Schema})

    {:ok, socket}
  end

  def id(_socket), do: nil
end
