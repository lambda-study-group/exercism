defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(m) do
    m
    |> String.split("\n")
    |> Enum.map_join(& process/1)
    |> unordered_tag()
  end

  defp process(text) do
    cond do
      String.starts_with?(text, "#") ->
        Regex.replace(~r/(#+)(.+)\1*/u, text, &header_tag/3)

      String.starts_with?(text, "*") ->
        Regex.replace(~r/(\*+)(.+)\1*/u, text, &list_item_tag/3)

      true ->
        text
        |> inline_tag
        |> paragraph_tag
    end
  end

  def header_tag(_, count, text) do
    header_number =
      count
      |> String.length

    "<h#{header_number}>#{String.trim(text)}</h#{header_number}>"
  end

  def list_item_tag(_, _, text) do
    text =
      text
      |> String.trim
      |> inline_tag

    "<li>#{text}</li>"
  end

  defp paragraph_tag(text) do
    "<p>#{text}</p>"
  end

  def inline_tag(text) do
    cond do
      String.contains?(text, "__") ->
        Regex.replace(~r/\_{2}/u, text, "</strong>")
        |> String.replace("</strong>", "<strong>", global: false)
        |> inline_tag

      String.contains?(text, "_") ->
        Regex.replace(~r/\_{1}/u, text, "</em>")
        |> String.replace("</em>", "<em>", global: false)
        |> inline_tag

      true ->
        text
    end
  end

  defp unordered_tag(html) do
    html
    |> String.replace("<li>", "<ul>" <> "<li>", global: false)
    |> String.replace_suffix("</li>","</li>" <> "</ul>")
  end
end
