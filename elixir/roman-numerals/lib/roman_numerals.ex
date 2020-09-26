defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numeral(number, "")
  end

  defp numeral(number, acc) do
    cond do
      number >= 1000 ->
        numeral(number - 1000, acc <> "M")

      number >= 900 ->
        numeral(number - 900, acc <> "CM")

      number >= 500 ->
        numeral(number - 500, acc <> "D")

      number >= 400 ->
        numeral(number - 400, acc <> "CD")

      number >= 100 ->
        numeral(number - 100, acc <> "C")

      number >= 90 ->
        numeral(number - 90, acc <> "XC")

      number >= 50 ->
        numeral(number - 50, acc <> "L")

      number >= 40 ->
        numeral(number - 40, acc <> "XL")

      number >= 10 ->
        numeral(number - 10, acc <> "X")

      number >= 9 ->
        numeral(number - 9, acc <> "IX")

      number >= 5 ->
        numeral(number - 5, acc <> "V")

      number >= 4 ->
        numeral(number - 4, acc <> "IV")

      number >= 1 ->
        numeral(number - 1, acc <> "I")

      true ->
        acc
    end
  end
end
