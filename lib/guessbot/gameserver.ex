defmodule Guessbot.Gameserver do
  use GenServer

  def start_link(attrs) do
    GenServer.start_link(__MODULE__, attrs, name: __MODULE__)
  end

  def init(_attrs) do
    {:ok, %{}}
  end

  def check_number(user, user_guess) do
    GenServer.call(__MODULE__, {:check, user, user_guess})
  end

  def register_user(user) do
    GenServer.cast(__MODULE__, {:register, user})
  end

  def inc_trail(user) do
    GenServer.cast(__MODULE__, {:inctrail, user})
  end

  def handle_call({:check, user, user_guess}, _from, state) do
    game = Map.get(state, user.id)

    {:reply, {user_guess == "#{game.rn}", Map.get(state, user.id)}, state}
  end

  def handle_cast({:register, user}, state) do
    {:noreply, Map.put(state, user.id, user)}
  end

  def handle_cast({:inctrail, user}, state) do
    game = Map.get(state, user.id)
    game = Map.update(game, :trails, 1, fn x -> x + 1 end)
    state = Map.put(state, user.id, game)
    {:noreply, state}
  end
end
