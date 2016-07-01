defmodule Server.RoomChannel do
  use Phoenix.Channel
  alias Patrician.{Infos, Mock}
  
  def join("rust_client:web_client", message, socket) do
    IO.puts "join rust client joined."
    {:ok, socket}
  end 

  def handle_in("rust_client:web_client", %{"body" => infos}, socket) do
    infos =  Infos.from_map(infos)    
    IO.puts "received update at."
    IO.inspect infos
    # Town.receive_update(String.to_atom(town_name), materials)
    Server.Endpoint.broadcast("web_client:update", "update", %{"body" => (infos)})
    {:noreply, socket} 
  end

  def mock(pair \\ [{"Luebeck", "Titanic"}, {"Rostock", "Euphradite"}]) do
    [ { town, ship } | tail ] = pair
    Server.Endpoint.broadcast("web_client:update", "update", %{"body" => (Mock.get_rnd_infos(town, ship))})
    IO.puts "#{town} #{ship}"
    Process.sleep(1000)
    mock(tail ++ [{town, ship}])
  end
end

defmodule Server.WebChannel do
  use Phoenix.Channel

  def join("web_client:update", message, socket) do
    IO.puts "Webclient joined."
    {:ok, socket}
  end
end
