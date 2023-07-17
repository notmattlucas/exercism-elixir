defmodule RPG do

  defprotocol Edible do
    def eat(food, character)
  end

  defmodule Character do
    defstruct health: 100, mana: 0
  end

  defmodule LoafOfBread do
    defstruct []
  end

  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defimpl Edible, for: ManaPotion do
    def eat(food, character) do
      {%EmptyBottle{}, %Character{health: character.health, mana: character.mana + food.strength}}
    end
  end

  defimpl Edible, for: LoafOfBread  do
    def eat(_, character) do
      {nil, %Character{health: character.health + 5, mana: character.mana}}
    end
  end

  defimpl Edible, for: Poison do
    def eat(_, character) do
      {%EmptyBottle{}, %Character{health: 0, mana: character.mana}}
    end
  end

end
