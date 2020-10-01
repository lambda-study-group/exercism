defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, size) when size <= 0, do: []
  def slices(s, size) do
    max = String.length(s)

    for iterate <- 0..max, iterate+size <= max, do: String.slice(s, iterate, size)
  end
end
