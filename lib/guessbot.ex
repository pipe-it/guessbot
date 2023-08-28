defmodule Guessbot do
  # helper functions

  def button_generator(n) do
    Enum.map(1..n, fn x -> %{text: "#{x}", callback_data: "guess #{x}"} end)
    |> Enum.chunk_every(8)
  end

  def get_hint(user_guess, rn) do
    case user_guess do
      user_guess when rn < user_guess ->
        "High"

      user_guess when rn > user_guess ->
        "Low"
    end
  end

  def delete_message(message) do
    ExGram.delete_message(message.chat.id, message.message_id)
  end
end
