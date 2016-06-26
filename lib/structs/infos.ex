defmodule Patrician.Infos do
  alias Patrician.{Town, Ship, Player}
  @derive [Poison.Encoder]
  defstruct [:ship, :town, :player]

  def from_map(map) do
    Maptu.struct!(Patrician.Infos, map)
    |> Map.update!(:ship, &Ship.from_map(&1))
    |> Map.update!(:town, &Town.from_map(&1))
    |> Map.update!(:player, &Player.from_map(&1)) 
  end
end
