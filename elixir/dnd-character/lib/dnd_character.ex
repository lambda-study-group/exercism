defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @dice 1..6
  @rolling 4

  @spec modifier(pos_integer()) :: integer()
  def modifier(score) do
    Integer.floor_div(score - 10, 2)
  end

  @spec ability :: pos_integer()
  def ability do
    dice_result = Enum.take_random(@dice, @rolling)

    dice_result
    |> Enum.sum
    |> Kernel.-(Enum.min(dice_result))
  end

  @spec character :: t()
  def character do
    character =
      %__MODULE__{
        strength: ability(),
        dexterity: ability(),
        constitution: ability(),
        intelligence: ability(),
        wisdom: ability(),
        charisma: ability()
      }

    %{character | hitpoints: 10 + modifier(character.constitution)}
  end
end
