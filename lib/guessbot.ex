defmodule Guessbot do
  # helper functions

  def button_generator(n) do
    Enum.map(1..n, fn x -> %{text: "#{x}", callback_data: "guess #{x}"} end)
    |> Enum.chunk_every(8)
  end
end
