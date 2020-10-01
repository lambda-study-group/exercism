defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @max_repeat_character 1

  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.split(~r/[[:punct:][:blank:]]/, trim: true)
    |> Enum.join
    |> String.codepoints
    |> Enum.frequencies
    |> Enum.all?(fn {_key, value} -> value == @max_repeat_character end)
  end
end
