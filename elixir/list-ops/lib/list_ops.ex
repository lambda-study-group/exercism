defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    fun = fn _item, acc -> acc + 1 end

    reduce(l, 0, fun)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    fun = fn item, acc -> [item | acc] end

    reduce(l, [], fun)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    for item <- l, do: f.(item)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    for item <- l, f.(item), do: item
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    fun = fn item, acc -> [item | acc] end

    a
    |> reverse
    |> reduce(b, fun)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    ll
    |> reverse
    |> reduce([], &append/2)
  end
end
