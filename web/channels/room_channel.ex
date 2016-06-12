defmodule Server.RoomChannel do
  use Phoenix.Channel

  def join("rust_client:web_client", message, socket) do
    IO.puts "join rust client joined."
    {:ok, socket}
  end 

  def handle_in("rust_client:web_client", %{"body" => message}, socket) do
    # do_stuff()
    IO.puts "received update at."
    Server.Endpoint.broadcast("web_client:update", "update", %{"body" => message})
    {:noreply, socket} 
  end
  
end

defmodule Server.WebChannel do
  use Phoenix.Channel

  def join("web_client:update", message, socket) do
    IO.puts "Webclient joined."
    {:ok, socket}
  end
end
