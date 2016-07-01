defmodule Patrician.Mock do
  alias Patrician.{Ship, Town, Player, Infos}
  @materials ["grain", "meat", "fish", "beer", "salt", "honey", "spices", "wine", "cloth", "skins", "whale oil", "timber", "iron goods", "leather", "wool", "pitch", "pig iron", "hemp", "pottery", "bricks"]
  
  def get_rnd_infos(town_name, ship_name) do
    ship = get_rnd_ship(ship_name)
    town = get_rnd_town(town_name)
    player = get_rnd_player()
    Infos.new(ship, town, player)
  end

  def get_rnd_town(name) do
    materials = for material <- @materials, into: %{},
      do: {material, Town.Material.new(:random.uniform(1000),
              :random.uniform(1000),
              :random.uniform(1000))}
    Town.new(name, materials, :random.uniform(1000), :random.uniform(1000))
  end
  
  def get_rnd_ship(name) do
    materials = for material <- @materials, into: %{},
      do: {material, Ship.Material.new(:random.uniform(1000),
              :random.uniform(1000))}
    Ship.new(name, materials)
  end
           
  def get_rnd_player() do
    %Player{name: "Hans", gold: :random.uniform(1000)}
  end
end
           
