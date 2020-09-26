defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found
  def search(numbers, key) do
    list = Tuple.to_list(numbers)
    search(list, key, 0, length(list))
  end

  defp search(list, key, min, max) do
    middle = div((min + max), 2)
    guess = Enum.at(list, middle)

    cond do
      min == max and guess != key ->
        :not_found

      guess == key ->
        {:ok, middle}

      guess > key ->
        max = middle - 1
        search(list, key, min, max)

      true ->
        min = middle + 1
        search(list, key, min, max)
    end
  end
end
