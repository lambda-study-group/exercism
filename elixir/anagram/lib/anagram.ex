defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> reject_candidate_equal(base)
    |> filter_candidate_with_same_characters_than(base)
  end

  defp reject_candidate_equal(candidates, base) do
    candidates
    |> Enum.reject(& String.downcase(&1) == String.downcase(base))
  end

  defp filter_candidate_with_same_characters_than(candidates, base) do
    candidates
    |> Enum.filter(& format(&1) == format(base))
  end

  defp format(word), do: String.downcase(word) |> String.codepoints |> Enum.sort |> Enum.join
end
