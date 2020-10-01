defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    to_decimal(string, 0)
  end

  defp to_decimal("0" <> tail, acc), do: to_decimal(tail, 2 * acc)
  defp to_decimal("1" <> tail, acc), do: to_decimal(tail, 2 * acc + 1)
  defp to_decimal("", acc), do: acc
  defp to_decimal(_, _), do: 0
end
