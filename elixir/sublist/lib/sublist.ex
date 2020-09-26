defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b ->
        :equal

      sublist?(a, b) ->
        :sublist

      sublist?(b, a) ->
        :superlist

      true
        -> :unequal
    end
  end

  defp sublist?(small_list, _) when length(small_list) == 0, do: true
  defp sublist?(small_list, big_list) do
    big_list
    |> Enum.chunk_every(length(small_list), 1, :discard)
    |> Enum.any?(& &1 === small_list)
  end
end
