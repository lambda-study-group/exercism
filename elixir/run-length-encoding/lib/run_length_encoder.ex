defmodule RunLengthEncoder do
  @encode_re ~r/([[:alpha:][:blank:]])\1*/u
  @decode_re ~r/(\d+)([[:alpha:][:blank:]])/u

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.replace(@encode_re, string, &encode_replacement/2)
  end

  defp encode_replacement(consecutive, char) do
    cond do
      consecutive == char ->
        char

      true ->
        Integer.to_string(String.length(consecutive)) <> char
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(@decode_re, string, &decode_replacement/3)
  end
  
  defp decode_replacement(_, count, char) do
    String.duplicate(char, String.to_integer(count))
  end
end
