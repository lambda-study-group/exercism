defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/[[:punct:]]/, "")
    |> (&(Regex.scan(~r/\b[[:alpha:]]|[[:upper:]](?=[[:lower:]])/, &1))).()
    |> List.to_string
    |> String.upcase
  end
end
