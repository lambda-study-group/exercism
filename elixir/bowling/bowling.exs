defmodule Bowling do
  @total_pins 10
  @last_frame 10

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  @spec start() :: any
  def start do
    %{
      score: 0,
      add_next: 0,
      last: 0,
      before_last: 0,
      new_frame: true,
      frame: 1,
      fill_balls: 0
    }
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """
  @spec roll(any, integer) :: any | String.t()
  def roll(_game, roll) when roll < 0 do
    {:error, "Negative roll is invalid"}
  end

  def roll(_game, roll) when roll > @total_pins do
    {:error, "Pin count exceeds pins on the lane"}
  end

  def roll(game, roll) do
    with :ok <- validate(game, roll) do
      %{
        score: game.score + score_roll(game, roll),
        add_next: following_rolls_to_add(game, roll),
        last: roll,
        before_last: game.last,
        new_frame: end_of_frame?(game, roll),
        frame: next_frame(game, roll),
        fill_balls: fill_ball_number(game)
      }
    end
  end

  defp validate(game, roll) do
    cond do
      excessive_roll?(game, roll) -> {:error, "Pin count exceeds pins on the lane"}
      game_over?(game) -> {:error, "Cannot roll after game is over"}
      true -> :ok
    end
  end

  defp excessive_roll?(game = %{new_frame: new_frame, last: last}, roll) do
    not new_frame and last + roll > @total_pins and not fill_ball_following_strike_or_spare?(game)
  end

  defp fill_ball_following_strike_or_spare?(game = %{last: last, before_last: before_last}) do
    fill_ball?(game) and (last == @total_pins or last + before_last == @total_pins)
  end

  defp game_over?(%{add_next: add_next, frame: frame, fill_balls: fill_balls}) do
    frame == @last_frame and fill_balls > 0 and add_next == 0
  end

  defp score_roll(game, roll) do
    cond do
      follows_two_strikes?(game) ->
        if fill_ball?(game), do: roll * 2, else: roll * 3

      follows_strike_or_spare?(game) ->
        if fill_ball?(game), do: roll, else: roll * 2

      true ->
        roll
    end
  end

  defp follows_two_strikes?(%{add_next: add_next, before_last: before_last}) do
    add_next == 2 and before_last == @total_pins
  end

  defp follows_strike_or_spare?(%{add_next: add_next}) do
    add_next > 0
  end

  defp fill_ball?(%{frame: frame, new_frame: new_frame}) do
    frame == @last_frame and not new_frame
  end

  defp fill_ball_number(game) do
    if fill_ball?(game) do
      game.fill_balls + 1
    else
      0
    end
  end

  defp following_rolls_to_add(game, roll) do
    cond do
      strike?(game, roll) -> 2
      spare?(game, roll) -> 1
      true -> max(game.add_next - 1, 0)
    end
  end

  defp strike?(%{new_frame: new_frame}, roll) do
    roll == @total_pins and new_frame
  end

  defp spare?(%{last: last, new_frame: new_frame, fill_balls: fill_balls}, roll) do
    not new_frame and last + roll == @total_pins and fill_balls == 0
  end

  defp end_of_frame?(%{new_frame: new_frame, frame: frame}, roll) do
    frame < @last_frame and (not new_frame or roll == @total_pins)
  end

  defp next_frame(game = %{frame: frame}, roll) do
    if end_of_frame?(game, roll) do
      frame + 1
    else
      frame
    end
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """
  @spec score(any) :: integer | String.t()
  def score(game) do
    if game_over?(game) do
      game.score
    else
      {:error, "Score cannot be taken until the end of the game"}
    end
  end
end
