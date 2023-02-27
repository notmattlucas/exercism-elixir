defmodule Lasagna do

  @layer_prep 2
  @cook 40

  def expected_minutes_in_oven() do
    @cook
  end

  def remaining_minutes_in_oven(elapsed) do
    @cook - elapsed
  end

  def preparation_time_in_minutes(layers) do
    @layer_prep * layers
  end

  def total_time_in_minutes(layers, elapsed) do
    preparation_time_in_minutes(layers) + elapsed
  end

  def alarm() do
    "Ding!"
  end

end
