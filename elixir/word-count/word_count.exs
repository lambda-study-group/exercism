defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/\_|\s|,/)
    |> filter
    |> clean
    |> Enum.reduce(%{}, fn(word, acc)->Map.put(acc, word,(acc[word]||0) + 1)end)
  end

  def filter(strings) do
    strings
    |> Enum.filter(fn(word) -> String.match?(word, ~r/^[a-zA-Z0-9\-!@#%$&()\\-ÄäÖöÜüß`.+,]+$/) end)
  end

  def clean(strings) do
    strings
    |> Enum.map(fn(word) -> 
      word
      |> String.replace(~r/[^a-zA-Z0-9ÄäÖöÜüß\-\_]/, "")
      |> String.downcase
    end)
  end
end
