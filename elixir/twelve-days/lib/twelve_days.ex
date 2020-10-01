defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @days_and_gifts [
    {1, "first", "a Partridge in a Pear Tree."},
    {2, "second", "two Turtle Doves"},
    {3, "third", "three French Hens"},
    {4, "fourth", "four Calling Birds"},
    {5, "fifth", "five Gold Rings"},
    {6, "sixth", "six Geese-a-Laying"},
    {7, "seventh", "seven Swans-a-Swimming"},
    {8, "eighth", "eight Maids-a-Milking"},
    {9, "ninth", "nine Ladies Dancing"},
    {10, "tenth", "ten Lords-a-Leaping"},
    {11, "eleventh", "eleven Pipers Piping"},
    {12, "twelfth", "twelve Drummers Drumming"}

  ]

  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{get_day(number)} day of Christmas my true love gave to me: #{get_phrase(number)}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    Enum.map(starting_verse..ending_verse, & verse(&1))
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

  defp get_day_and_gift(number) do
    List.keyfind(@days_and_gifts, number, 0)
  end

  defp get_day(number) do
    {_, day, _} = get_day_and_gift(number)
    day
  end

  defp get_gift(number) do
    {_, _, gift} = get_day_and_gift(number)
    gift
  end

  defp get_phrase(number) do
    Enum.map(1..number, & get_gift(&1))
    |> Enum.reverse
    |> phrase_gifts([])
  end

  defp phrase_gifts([head], []), do: "#{head}"
  defp phrase_gifts([head | []], acc), do: "#{acc}, and #{head}"
  defp phrase_gifts([head | tail], []), do: phrase_gifts(tail, "#{head}")
  defp phrase_gifts([head | tail], acc), do: phrase_gifts(tail, "#{acc}, #{head}")
end
