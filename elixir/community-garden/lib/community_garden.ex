# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do

  def start() do
    Agent.start(fn -> %{regs: [], seq: 1} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.regs end)
  end

  def register(pid, register_to) do
    Agent.update(pid, fn state ->
      plot_id = state.seq
      %{
        regs: [%Plot{plot_id: plot_id, registered_to: register_to} | state.regs],
        seq: state.seq + 1
      }
    end)
    Agent.get(pid, fn %{regs: [head | _]} -> head end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn state ->
      %{
        regs: Enum.filter(state.regs, fn plot -> plot.plot_id != plot_id end),
        seq: state.seq
      }
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn state ->
      Enum.find(state.regs,
        {:not_found, "plot is unregistered"},
        fn plot -> plot.plot_id == plot_id
      end)
    end)
  end

end
