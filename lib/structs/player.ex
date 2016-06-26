defmodule Patrician.Player do
  @derive [Poison.Encoder]
  defstruct [:name, :gold]

  def from_map(map) do
    Maptu.struct!(Patrician.Player, map)
    |> Map.update!(:name, &String.to_atom(&1))
  end
end
