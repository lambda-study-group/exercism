defmodule Forth do
  @moduledoc """
  An evaluator for the Forth Programming Language.
  """

  @tokens ~r/[[:graph:]]+/u
  @start_definition ":"
  @end_definition ";"

  @opaque evaluator :: %{stack: list, words: map, definition: boolean}

  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do
    %{stack: [], words: %{}, definition: false}
  end

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t()
  def format_stack(%{stack: stack}) do
    stack
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t()) :: evaluator
  def eval(ev, input) do
    @tokens
    |> Regex.scan(input)
    |> Enum.map(&parse_token/1)
    |> Enum.reduce(ev, &eval_token/2)
  end

  defp parse_token([token]) do
    case Integer.parse(token) do
      {int, ""} -> int
      _ -> String.upcase(token)
    end
  end

  defp eval_token(@start_definition, ev) do
    ev
    |> Map.put(:definition, true)
    |> Map.put(:stack, [@start_definition | ev.stack])
  end

  defp eval_token(@end_definition, ev = %{definition: true}) do
    start = Enum.find_index(ev.stack, &(&1 == @start_definition))

    [word | definition] =
      ev.stack
      |> Enum.take(start)
      |> Enum.reverse()

    unless is_binary(word), do: raise(Forth.InvalidWord, word: word)

    ev
    |> Map.put(:stack, Enum.drop(ev.stack, start + 1))
    |> Map.put(:words, Map.put(ev.words, word, definition))
    |> Map.put(:definition, false)
  end

  defp eval_token(token, ev = %{definition: true}) do
    Map.put(ev, :stack, [token | ev.stack])
  end

  defp eval_token(token, ev) when is_number(token) do
    Map.put(ev, :stack, [token | ev.stack])
  end

  defp eval_token(token, ev) do
    word_definition = ev.words[token]

    if word_definition do
      Enum.reduce(word_definition, ev, &eval_token/2)
    else
      eval_word(token, ev)
    end
  end

  defp eval_word("DUP", ev = %{stack: [x | rest]}) do
    Map.put(ev, :stack, [x, x | rest])
  end

  defp eval_word("DROP", ev = %{stack: [_ | rest]}) do
    Map.put(ev, :stack, rest)
  end

  defp eval_word("SWAP", ev = %{stack: [y, x | rest]}) do
    Map.put(ev, :stack, [x, y | rest])
  end

  defp eval_word("OVER", ev = %{stack: [y, x | rest]}) do
    Map.put(ev, :stack, [x, y, x | rest])
  end

  defp eval_word("+", ev = %{stack: [y, x | rest]}) do
    Map.put(ev, :stack, [x + y | rest])
  end

  defp eval_word("-", ev = %{stack: [y, x | rest]}) do
    Map.put(ev, :stack, [x - y | rest])
  end

  defp eval_word("*", ev = %{stack: [y, x | rest]}) do
    Map.put(ev, :stack, [x * y | rest])
  end

  defp eval_word("/", ev = %{stack: [y, x | rest]}) when y != 0 do
    Map.put(ev, :stack, [div(x, y) | rest])
  end

  defp eval_word("DUP", _ev), do: raise(Forth.StackUnderflow)
  defp eval_word("DROP", _ev), do: raise(Forth.StackUnderflow)
  defp eval_word("SWAP", _ev), do: raise(Forth.StackUnderflow)
  defp eval_word("OVER", _ev), do: raise(Forth.StackUnderflow)
  defp eval_word("/", _ev), do: raise(Forth.DivisionByZero)
  defp eval_word(word, _ev), do: raise(Forth.UnknownWord, word: word)

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception word: nil
    def message(e), do: "invalid word: #{inspect(e.word)}"
  end

  defmodule UnknownWord do
    defexception word: nil
    def message(e), do: "unknown word: #{inspect(e.word)}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end
end
