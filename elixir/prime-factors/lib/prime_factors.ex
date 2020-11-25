defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    calc(number, 2, [])
  end

  defp calc(1, _, acc), do: Enum.reverse(acc)
  defp calc(number, factor, acc) when number < factor * factor do
    Enum.reverse([number | acc])
  end
  defp calc(number, factor, acc) when rem(number, factor) == 0 do
     calc(div(number, factor), factor, [factor | acc])
   end
  defp calc(number, factor, acc), do: calc(number, factor+1, acc)
end
