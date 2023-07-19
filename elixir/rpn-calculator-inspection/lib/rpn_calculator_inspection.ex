defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    pid = spawn_link(fn -> calculator.(input) end)
    %{pid: pid, input: input}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    receive do
      {:EXIT, ^pid, :normal} -> Map.put(results, input, :ok)
      {:EXIT, ^pid, _} -> Map.put(results, input, :error)
    after 100 -> Map.put(results, input, :timeout)
    end
  end

  def reliability_check(calculator, inputs) do
    original = Process.flag(:trap_exit, true)
    checks = for input <- inputs, into: [], do: start_reliability_check(calculator, input)
    result = Enum.reduce(checks, %{}, &await_reliability_check_result/2)
    Process.flag(:trap_exit, original)
    result
  end

  def correctness_check(calculator, inputs) do
    tasks = for input <- inputs, into: [], do: Task.async(fn -> calculator.(input) end)
    Enum.map(tasks, fn task -> Task.await(task, 100) end)
  end
end
