defmodule ListSupervisor do
  use Supervisor

  def start_link do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [])
    start_workers(sup)
    result
  end

  def start_workers(sup) do
    # Start the ListData worker
    {:ok, list_data} = Supervisor.start_child(sup, worker(ListData, []))

    # Now start the SubSupervisor for the actual ListServer
    result = Supervisor.start_child(sup, worker(ListSubSupervisor, [list_data]))
    result
  end

  def init _ do
    supervise [], strategy: :one_for_one
  end
end
