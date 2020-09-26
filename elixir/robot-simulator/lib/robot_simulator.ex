defmodule RobotSimulator do
  defstruct direction: nil, position: nil

  defguard is_direction(direction) when direction in [:north, :east, :south, :west]
  defguard is_position(x, y) when is_integer(x) and is_integer(y)

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create() do
    %{direction: :north, position: {0, 0}}
  end
  def create(direction, position = {x, y}) when is_direction(direction) and is_position(x, y) do
    %{direction: direction, position: position}
  end
  def create(direction, _position) when is_direction(direction), do: {:error, "invalid position"}
  def create(_direction, _position = {x, y}) when is_position(x, y), do: {:error, "invalid direction"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    run(instructions, robot)
  end

  defp run("", robot), do: robot
  defp run("R" <> instructions, %{direction: :north} = robot) do
    run(instructions, %{robot | direction: :east})
  end
  defp run("L" <> instructions, %{direction: :north} = robot) do
    run(instructions, %{robot | direction: :west})
  end
  defp run("A" <> instructions, %{direction: :north, position: {x, y}} = robot) do
    run(instructions, %{robot | position: {x, y+1}})
  end
  defp run("R" <> instructions, %{direction: :east} = robot) do
    run(instructions, %{robot | direction: :south})
  end
  defp run("L" <> instructions, %{direction: :east} = robot) do
    run(instructions, %{robot | direction: :north})
  end
  defp run("A" <> instructions, %{direction: :east, position: {x, y}} = robot) do
    run(instructions, %{robot | position: {x+1, y}})
  end
  defp run("R" <> instructions, %{direction: :south} = robot) do
    run(instructions, %{robot | direction: :west})
  end
  defp run("L" <> instructions, %{direction: :south} = robot) do
    run(instructions, %{robot | direction: :east})
  end
  defp run("A" <> instructions, %{direction: :south, position: {x, y}} = robot) do
    run(instructions, %{robot | position: {x, y-1}})
  end
  defp run("R" <> instructions, %{direction: :west} = robot) do
    run(instructions, %{robot | direction: :north})
  end
  defp run("L" <> instructions, %{direction: :west} = robot) do
    run(instructions, %{robot | direction: :south})
  end
  defp run("A" <> instructions, %{direction: :west, position: {x, y}} = robot) do
    run(instructions, %{robot | position: {x-1, y}})
  end
  defp run(_, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: direction} = _robot) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: {x, y}} = _robot) do
    {x, y}
  end
end
