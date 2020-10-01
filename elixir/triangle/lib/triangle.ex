defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  defguard is_negative(a \\ 0, b \\ 0, c \\ 0) when a <= 0 or b <= 0 or c <= 0
  defguard is_inequality(a, b) when a >= b

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when is_negative(a, b, c), do: {:error, "all side lengths must be positive"}
  def kind(a, b, c) when is_inequality(b, a+c) or is_inequality(a, b+c) or is_inequality(c, a+b), do: {:error, "side lengths violate triangle inequality"}

  def kind(a, a, a), do: {:ok, :equilateral}
  def kind(a, a, _), do: {:ok, :isosceles}
  def kind(a, _, a), do: {:ok, :isosceles}
  def kind(_, a, a), do: {:ok, :isosceles}
  def kind(a, b, c), do: {:ok, :scalene}
end
