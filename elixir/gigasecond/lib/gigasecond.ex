defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {{year, month, day}, {hours, minutes, seconds}}
    |> NaiveDateTime.from_erl!()
    |> NaiveDateTime.add(1_000_000_000, :second)
    |> NaiveDateTime.to_erl()
  end
end
