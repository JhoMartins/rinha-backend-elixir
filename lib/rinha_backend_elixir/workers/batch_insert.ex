defmodule RinhaBackendElixir.Workers.BatchInsert do
  use GenServer

  require Logger

  alias RinhaBackendElixir.Pessoas

  def start_link(_params) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def enqueue(element), do: GenServer.cast(__MODULE__, {:enqueue, element})

  def list_queue(), do: GenServer.call(__MODULE__, :queue)

  @impl true
  def init(queue) do
    schedule_work()

    {:ok, queue}
  end

  @impl true
  def handle_call(:queue, _from, queue), do: {:reply, queue, queue}

  @impl true
  def handle_cast({:enqueue, element}, queue) do
    {:noreply, [element | queue]}
  end

  @impl true
  def handle_info(:flush, queue) do
    if length(queue) > 0 do
      Logger.info("Bulk Insert Running...")

      queue
      |> Enum.map(fn pessoa ->
        %{
          id: pessoa.id,
          apelido: pessoa.apelido,
          nome: pessoa.nome,
          stack: pessoa.stack,
          nascimento: pessoa.nascimento
        }
      end)
      |> Pessoas.bulk_insert()

      Logger.info("Bulk Insert Finished...")
    end

    schedule_work()

    {:noreply, []}
  end

  defp schedule_work, do: Process.send_after(self(), :flush, :timer.seconds(2))
end
