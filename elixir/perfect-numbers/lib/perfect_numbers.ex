defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(1), do: {:ok, :deficient}
  def classify(number) when number > 0 do
    sum = factors(number, div(number, 2), 1)
    aliquot =
      cond do
        sum == number -> :perfect
        sum > number  -> :abundant
        true          -> :deficient
      end

    {:ok, aliquot}
  end
  def classify(_number), do: {:error, "Classification is only possible for natural numbers."}

  defp factors(_number, 1, sum), do: sum
  defp factors(number, factor, sum) when rem(number, factor) == 0 do
    factors(number, factor-1, sum + factor)
  end
  defp factors(number, factor, sum), do: factors(number, factor-1, sum)
end
