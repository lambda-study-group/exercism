defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    Regex.scan(~r/\(|\)|\{|\}|\[|\]/, str)
    |> List.flatten
    |> Enum.reduce("", fn char, acc ->
      cond do
        brackets?(char, acc) ->
          slice(acc, String.length(acc))

        braces?(char, acc) ->
          slice(acc, String.length(acc))

        parentheses?(char, acc) ->
          slice(acc, String.length(acc))

        true ->
          acc <> char
      end
    end) == ""
  end
  
  defp brackets?(char, acc), do: char == "]" and String.ends_with?(acc, "[")
  defp braces?(char, acc), do: char == "}" and String.ends_with?(acc, "{")
  defp parentheses?(char, acc), do: char == ")" and String.ends_with?(acc, "(")

  defp slice(acc, length), do: String.slice(acc, 0, (length-1))
end
