defmodule IsbnVerifier do
  @digits Enum.map(?0..?9, &<<&1>>)
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> ISBNVerifier.isbn?("3-598-21507-X")
      true

      iex> ISBNVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    parsed_isbn = parser(isbn)

    cond do
      String.length(parsed_isbn) != 10 -> false

      true ->
        parsed_isbn
        |> calc(10, 0)
        |> Kernel.rem(11)
        |> Kernel.==(0)
    end
  end

  defp parser(isbn), do: String.replace(isbn, ~r/[[:punct:]]/, "")

  defp calc("", _factor, sum), do: sum
  defp calc("X", factor, sum) when factor == 1, do: calc("", factor, 10 + sum)
  defp calc(<<dig::binary-size(1), digs::binary>>, factor, sum) when dig in @digits and factor in 1..10 do
    calc(digs, factor-1, String.to_integer(dig) * factor + sum)
  end
  defp calc(_digs, _factor, _sum), do: calc("", 0, -1)
end
