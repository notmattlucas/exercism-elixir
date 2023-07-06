defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: percent}) do
    case percent do
      0 -> "Battery empty"
      _ -> "Battery at #{percent}%"
    end
  end

  def drive(%RemoteControlCar{nickname: nickname, battery_percentage: initial_percent, distance_driven_in_meters: initial_distance}) do
    {percent, distance} = case initial_percent do
      0 -> {0, initial_distance}
      _ -> {initial_percent - 1, initial_distance + 20}
    end
    %RemoteControlCar {
      nickname: nickname,
      battery_percentage: percent,
      distance_driven_in_meters: distance
    }
  end
end
