defmodule Raindrops do
  @factors %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    raindrop = reducer(number)

    case raindrop do
      "" -> Integer.to_string(number)
      _  -> raindrop
    end
  end

  defp reducer(number) do
    Enum.reduce(@factors, "", fn {prime, message}, acc ->
      case rem(number, prime) do
        0 ->
          acc <> message
        _ -> acc
      end
    end)
  end
end
