defmodule Patrician do
  require Logger
  def receive_update(town_name, materials) do
    Logger.info("#{town_name} updated") 
    Agent.get_and_update(town_name,
      fn(town) ->
        get_and_update_in(town.materials, &{&1, {Map.merge(&1, materials)}})
      
        # for {key, value} <- materials do
        #   town = town |> Map.put(key, value) 
        # end
        {town, town}
      end
    )
  end
end
