defmodule LogLevel do

  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      level == 0 and not legacy? -> false
      level in [1, 2, 3] -> false
      level == 4 -> :ops
      level == 5 and not legacy? -> :ops
      legacy? -> :dev1
      not legacy? -> :dev2
    end
  end

end
