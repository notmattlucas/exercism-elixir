defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """
  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = number
      |> to_string()
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)

    power = Enum.count(digits)

    digits
      |> Enum.map(fn x -> Integer.pow(x, power) end)
      |> Enum.sum() == number
  end
end
