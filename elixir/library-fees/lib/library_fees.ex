defmodule LibraryFees do

  @noon ~T[12:00:00]

  def datetime_from_string(string) do
    {:ok, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
    time = NaiveDateTime.to_time(datetime)
    Time.compare(time, @noon) == :lt
  end

  def return_date(checkout_datetime) do
    limit = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.add(checkout_datetime, limit * 86400)
    |> NaiveDateTime.to_date
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(actual_return_datetime, planned_return_date)
    if diff >= 0, do: diff, else: 0
  end

  def monday?(datetime) do
    day = NaiveDateTime.to_date(datetime)
    |> Date.day_of_week
    day == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    expected = datetime_from_string(checkout) |> return_date
    actual = datetime_from_string(return)
    discounted = if monday?(actual), do: (0.5 * rate) , else: rate * 1.0
    days_late(expected, actual) * discounted |> Float.floor
  end
end
