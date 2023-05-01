defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  def loop(seed) do
    receive do
      {:report_state, sender} ->
        send(sender, seed)
        loop(seed)
      {:take_a_number, sender} ->
        new = seed + 1
        send(sender, new)
        loop(new)
      :stop -> :do_nothing
      _ -> loop(seed)
      end
  end

end
