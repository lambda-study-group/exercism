defmodule Phone do
  @digits Enum.map(?2..?9, &<<&1>>)

  defguard is_digits(country_code \\ "1", area_code, phone_number)
           when country_code == "1" and area_code in @digits and phone_number in @digits

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("212-555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 055-0100")
  "0000000000"

  iex> Phone.number("(212) 555-0100")
  "2125550100"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t()) :: String.t()
  def number(
        <<"+", country_code::binary-size(1), " (", area_code::binary-size(1),
          area_code_digs::binary-size(2), ") ", phone_number::binary-size(1),
          first_digs::binary-size(2), "-", last_digs::binary-size(4)>>
      )
      when is_digits(country_code, area_code, phone_number) do
    area_code <> area_code_digs <> phone_number <> first_digs <> last_digs
  end

  def number(
        <<"(", area_code::binary-size(1), area_code_digs::binary-size(2), ") ",
          phone_number::binary-size(1), first_digs::binary-size(2), "-",
          last_digs::binary-size(4)>>
      )
      when is_digits(area_code, phone_number) do
    area_code <> area_code_digs <> phone_number <> first_digs <> last_digs
  end

  def number(
        <<area_code::binary-size(1), area_code_digs::binary-size(2), ".",
          phone_number::binary-size(1), first_digs::binary-size(2), ".",
          last_digs::binary-size(4)>>
      )
      when is_digits(area_code, phone_number) do
    area_code <> area_code_digs <> phone_number <> first_digs <> last_digs
  end

  def number(
        <<country_code::binary-size(1), area_code::binary-size(1), area_code_digs::binary-size(2),
          phone_number::binary-size(1), first_digs::binary-size(2), last_digs::binary-size(4)>>
      )
      when is_digits(country_code, area_code, phone_number) do
    area_code <> area_code_digs <> phone_number <> first_digs <> last_digs
  end

  def number(
        <<area_code::binary-size(1), area_code_digs::binary-size(2), phone_number::binary-size(1),
          first_digs::binary-size(2), last_digs::binary-size(4)>>
      )
      when is_digits(area_code, phone_number) do
    area_code <> area_code_digs <> phone_number <> first_digs <> last_digs
  end

  def number(_raw), do: "0000000000"

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("212-555-0100")
  "212"

  iex> Phone.area_code("+1 (212) 555-0100")
  "212"

  iex> Phone.area_code("+1 (012) 555-0100")
  "000"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t()) :: String.t()
  def area_code(raw), do: String.slice(number(raw), 0, 3)

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("212-555-0100")
  "(212) 555-0100"

  iex> Phone.pretty("212-155-0100")
  "(000) 000-0000"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    raw
    |> number
    |> format
  end

  defp format(
         <<area_code::binary-size(1), area_code_digs::binary-size(2),
           phone_number::binary-size(1), first_digs::binary-size(2), last_digs::binary-size(4)>>
       ) do
    "(#{area_code}#{area_code_digs}) #{phone_number}#{first_digs}-#{last_digs}"
  end

  defp format(_raw), do: "(000) 000-0000"
end
