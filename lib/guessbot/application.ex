defmodule Guessbot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    token = Application.get_env(:ex_gram, :token)

    children = [
      {Http, port: 8080},
      ExGram,
      Guessbot.Gameserver,
      {Guessbot.Bot, [method: :polling, token: token]}
    ]

    opts = [strategy: :one_for_one, name: Guessbot.Supervisor]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Started Guessbot")
        ok

      error ->
        Logger.error("Error in Starting Guessbot")
        Logger.error("#{inspect(error)}")
    end
  end
end
