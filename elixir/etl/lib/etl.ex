defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    input
    |> Enum.map(&reverse/1)
    |> List.flatten()
    |> Enum.reduce(%{}, &Map.merge(&2, &1))
  end

  defp reverse({key, values}) do
    Enum.map(values, fn
      value ->
        Map.put(%{}, String.downcase(value), key)
    end)
  end
end
