defmodule Gameserver do
  use GenServer

  # Start the server
  {:ok, pid} = GenServer.start_link(Stack, [:hello])

  
end
