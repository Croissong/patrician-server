defmodule Patrician.Town do
  require Logger
  alias Patrician.Town.Material
  
  @derive [Poison.Encoder]
  defstruct [:name, :materials, :comparison, :total_weight, :unknown]
  
  def new(name, materials, total_weight, unkown) do
    %__MODULE__{name: name, materials: materials, total_weight: total_weight, unknown: unkown}
  end
  
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
  def new(amount, buy, sell) do
    %__MODULE__{amount: amount, buy: buy, sell: sell}
  end
end
