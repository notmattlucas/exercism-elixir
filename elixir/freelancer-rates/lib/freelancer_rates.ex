defmodule FreelancerRates do

  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * ((100 - discount) / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    rate = daily_rate(hourly_rate) * 22
    final = apply_discount(rate, discount)
    ceil(final)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily = daily_rate(hourly_rate)
    discounted = apply_discount(daily, discount)
    Float.floor(budget / discounted, 1)
  end

end
