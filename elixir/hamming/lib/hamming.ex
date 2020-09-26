defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when strand1 == strand2, do: {:ok, 0}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "Lists must be the same length"}
  end
  def hamming_distance(strand1, strand2) do
    {:ok, diff(strand1, strand2, 0)}
  end

  defp diff([], [], count), do: count
  defp diff([h_strand1 | t_strand1], [h_strand2 | t_strand2], count) when h_strand1 == h_strand2 do
    diff(t_strand1, t_strand2, count)
  end
  defp diff([_h_strand1 | t_strand1], [_h_strand2 | t_strand2], count) do
    diff(t_strand1, t_strand2, count+1)
  end
end
