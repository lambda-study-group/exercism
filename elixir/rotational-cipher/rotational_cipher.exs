defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for << letter <- text >>, into: "", do: <<bill_cipher(letter, shift)>> 
  end

  defp bill_cipher(letter, skip) when letter in ?A..?Z do
    ?A + rem(letter + skip - ?A, 26)
  end
  defp bill_cipher(letter, skip) when letter in ?a..?z do
    ?a + rem(letter + skip - ?a, 26)
  end

  defp bill_cipher(letter, skip) do
    letter
  end


end

