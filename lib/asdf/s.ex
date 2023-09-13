defmodule S1 do
  def start_link(number) do
    {:ok, :"Elixir.S#{number}"}
  end

  def run() do
    IO.inspect("running S1 module")
  end
end

defmodule S2 do
  def run() do
    IO.inspect("running S2 module")
  end
end

defmodule S3 do
  def run() do
    IO.inspect("running S3 module")
  end
end
