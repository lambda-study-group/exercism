defmodule BinTree do
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """

  @type t :: %BinTree{value: any, left: t() | nil, right: t() | nil}

  defstruct [:value, :left, :right]
end

defimpl Inspect, for: BinTree do
  import Inspect.Algebra

  # A custom inspect instance purely for the tests, this makes error messages
  # much more readable.
  #
  # BinTree[value: 3, left: BinTree[value: 5, right: BinTree[value: 6]]] becomes (3:(5::(6::)):)
  def inspect(%BinTree{value: value, left: left, right: right}, opts) do
    concat([
      "(",
      to_doc(value, opts),
      ":",
      if(left, do: to_doc(left, opts), else: ""),
      ":",
      if(right, do: to_doc(right, opts), else: ""),
      ")"
    ])
  end
end

defmodule Zipper do
  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  def from_tree(bin_tree, parent \\ nil, side \\ nil) do
    %{focus: bin_tree, parent: parent, side: side}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(%{focus: focus, parent: nil}) do
    focus
  end

  def to_tree(%{parent: parent}) do
    to_tree(parent)
  end

  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(%{focus: focus}) do
    focus.value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(zipper = %{focus: focus}) do
    focus.left && from_tree(focus.left, zipper, :left)
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(zipper = %{focus: focus}) do
    focus.right && from_tree(focus.right, zipper, :right)
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Zipper.t()) :: Zipper.t() | nil
  def up(%{parent: parent}) do
    parent
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(zipper = %{focus: focus}, value) do
    updated_focus = %BinTree{value: value, left: focus.left, right: focus.right}
    update_parent(zipper, updated_focus)
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(zipper = %{focus: focus}, left) do
    updated_focus = %BinTree{value: focus.value, left: left, right: focus.right}
    update_parent(zipper, updated_focus)
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(zipper = %{focus: focus}, right) do
    updated_focus = %BinTree{value: focus.value, left: focus.left, right: right}
    update_parent(zipper, updated_focus)
  end

  defp update_parent(%{side: nil}, tree) do
    from_tree(tree)
  end

  defp update_parent(%{parent: parent, side: :left}, tree) do
    parent |> set_left(tree) |> left()
  end

  defp update_parent(%{parent: parent, side: :right}, tree) do
    parent |> set_right(tree) |> right()
  end
end
