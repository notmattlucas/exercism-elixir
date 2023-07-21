defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input), do: calc(input, 0)
  defp calc(input, steps) when is_integer(input) and input > 0 do
    case input do
      1 -> steps
      n when rem(n, 2) == 0 -> calc(round(n / 2), steps + 1)
      n  -> calc(round(3*n+1), steps + 1)
    end
  end
end
