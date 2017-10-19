use Bitwise
defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @actions %{
    0b1 => "wink",
    0b10 => "double blink",
    0b100 => "close your eyes",
    0b1000 => "jump"
  }
  
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    chcksecr_code(code)
  end

  defp secr_code(secr) do 
  Map.keys(@actions) 
    |> Enum.filter( &(&1 &&& secr) > 0) 
    |> Enum.map(fn signal -> @actions[signal] end)
  end

  defp chcksecr_code(sec) when (0b10000 &&& sec) > 0 do
    Enum.reverse(secr_code(sec))
  end
  defp chcksecr_code(sec) when (0b10000 &&& sec) == 0 do
    secr_code(sec)
  end
end

