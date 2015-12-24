defmodule ListServer do
  use GenServer

  ### Public API
  def start_link(list_data_pid) do
    GenServer.start_link(__MODULE__, [], list_data_pid)
  end

  def clear do
    GenServer.cast :list, :clear
  end

  def add(item) do
    GenServer.cast :list, {:add, item}
  end

  def remove(item) do
    GenServer.cast :list, {:remove, item}
  end

  def items do
    GenServer.call :list, :items
  end

  def crash do
    GenServer.cast :list, :crash
  end
  ### GenServer API
  def init(list) do
    list = ListData.get_state(list_data_pid)
    {:ok, { list, list_data_pid }}
  end

  def handle_call :items, _from, list do
    {:reply, list, list}
  end

  def handle_cast :clear, list do
    {:noreply, []}
  end

  def handle_cast {:add, item}, list do
    {:noreply, list ++ [item]}
  end

  def handle_cast {:remove, item}, list do
    {:noreply, list -- [item]}
  end

  def handle_cast :crash, list do
    1 = 2
  end
end
