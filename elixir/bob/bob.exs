defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      yelling_a_question?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever." 
    end
  end

  def yelling?(input) do
    case String.match?(input, ~r/\p{L}/) do
      true ->  yelling_alpha?(input)
      false -> false
    end
  end

  def yelling_alpha?(input) do
    input == String.upcase(input)
  end

  def question?(input) do
    String.ends_with?(input, "?")
  end

  def yelling_a_question?(input) do
    yelling?(input) and question?(input)
  end

  def silence?(""), do: true 
  def silence?(input) do
    String.match?(input, ~r/^\s/)
  end
end
