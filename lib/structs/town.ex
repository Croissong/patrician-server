defmodule Patrician.Town do
  require Logger
  alias Patrician.Town.Material
  
  @derive [Poison.Encoder]
  defstruct [:name, :materials, :comparison, :total_weight, :unknown]

  def from_map(map) do
    Maptu.struct!(Patrician.Town, map)
    |> Map.update!(:name, &String.to_atom(&1))
    |> Map.update!(:materials, &mats_from_map(&1))
  end

  def mats_from_map(map) do
    for {k, v} <- map, into: %{}, do: {k, Maptu.struct!(Material, v)}
  end
end

defmodule Patrician.Town.Material do
  @derive [Poison.Encoder]
  defstruct [:amount, :buy, :sell]
end
