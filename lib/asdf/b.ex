defmodule B do
  def call(message) do
    # {:ok, server} = S1.start_link(2)
    # apply(server, :run, [])
    handle_call(message)
  end

  def handle_call(message) do
    IO.puts("message #{message} is handled")
  end
end
