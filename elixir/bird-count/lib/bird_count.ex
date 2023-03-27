defmodule BirdCount do

  def today([]), do: nil
  def today([today | _]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]


  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | rest]), do: head == 0 or has_day_without_birds?(rest)

  def total([]), do: 0
  def total([head | rest]), do: head + total(rest)

  def busy_days(days) do
    case days do
      [] -> 0
      [day | rest] when day >= 5 -> busy_days(rest) + 1
      [_ | rest] -> busy_days(rest)
    end
  end


end
