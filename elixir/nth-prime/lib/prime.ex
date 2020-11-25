defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    calc(2, count, [2])
  end

  defp calc(_, 1, acc), do: List.first(acc)
  defp calc(number, count, acc) do
    case Enum.any?(acc, &rem(number, &1) == 0) do
      true   -> calc(number+1, count, acc)
      _prime -> calc(number+1, count-1, [number | acc])
    end
  end
end
