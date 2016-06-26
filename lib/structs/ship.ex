defmodule Patrician.Ship do
  alias Patrician.Ship.Material
  @derive [Poison.Encoder]
  defstruct [:name, :materials]

  def from_map(map) do
    Maptu.struct!(Patrician.Ship, map)
    |> Map.update!(:name, &String.to_atom(&1))
    |> Map.update!(:materials, &mats_from_map(&1))
  end

  def mats_from_map(map) do
    for {k, v} <- map, into: %{}, do: {k, Maptu.struct!(Material, v)}
  end
end

defmodule Patrician.Ship.Material do
  @derive [Poison.Encoder]
  defstruct [:amount, :average_price]
end
