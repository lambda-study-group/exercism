defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list | nil
  def convert(digits, base_a, base_b) do
    if valid?(digits, base_a, base_b),
      do:
        digits
        |> convert_to_decimal(base_a)
        |> convert_to_base(base_b, [])
  end

  defp valid?(digits, base_a, base_b) do
    all_digits_in_zero_and_base_a? =
      Enum.all?(digits, fn digit ->
        0 <= digit and digit < base_a
      end)

    length(digits) > 0 && is_integer(base_a) && base_a > 1 && is_integer(base_b) && base_b > 1 &&
      all_digits_in_zero_and_base_a?
  end

  defp convert_to_decimal(digits, base) do
    digits
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(fn {digit, index} ->
      digit * pow(base, index)
    end)
    |> Enum.sum()
  end

  defp pow(number, power) do
    number
    |> :math.pow(power)
    |> :erlang.floor()
  end

  defp convert_to_base(0, _base, []), do: [0]
  defp convert_to_base(0, _base, acc), do: acc

  defp convert_to_base(number, base, acc) do
    {x, y} = {div(number, base), rem(number, base)}

    cond do
      x >= base ->
        convert_to_base(x, base, [y | acc])

      x < base and x > 0 ->
        convert_to_base(0, base, [x, y | acc])

      true ->
        convert_to_base(0, base, [y | acc])
    end
  end
end
