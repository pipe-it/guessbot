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

  def hint_number(user, user_guess) do
    GenServer.call(__MODULE__, {:hint, user, user_guess})
  end

  def save_previous_message(user, message) do
    GenServer.cast(__MODULE__, {:save_previous_message, user, message})
  end

  def register_user(user) do
    GenServer.call(__MODULE__, {:register_user, user})
  end

  def register_game(game, user) do
    GenServer.call(__MODULE__, {:register_game, game, user})
  end

  def inc_trail(user) do
    GenServer.cast(__MODULE__, {:inctrail, user})
  end

  def handle_call({:check, user, user_guess}, _from, state) do
    game = Map.get(state, user.id)

    {:reply, {user_guess == "#{game.rn}", Map.get(state, user.id)}, state}
  end

  def handle_call({:hint, user, user_guess}, _from, state) do
    game = Map.get(state, user.id)

    hint = Guessbot.get_hint(user_guess |> String.to_integer(), game.rn)
    {:reply, hint, state}
  end

  def handle_cast({:save_previous_message, user, message}, state) do
    game = Map.get(state, user.id) |> Map.put(:previous_message, message)

    state = Map.put(state, user.id, game)
    {:noreply, state}
  end

  def handle_call({:register_user, %Guessbot.User{} = user}, _from, state) do
    {:reply, {:ok, user}, Map.put(state, user.id, user)}
  end

  def handle_call({:register_user, user}, _from, state) do
    {:reply, {:error, user}, state}
  end

  def handle_call(
        {:register_game, %Guessbot.Game{} = game, %Guessbot.User{} = user},
        _from,
        state
      ) do
    {:reply, {:ok, game}, Map.put(state, user.id, user)}
  end

  def handle_call({:register_game, game}, _from, state) do
    {:reply, {:error, game}, state}
  end

  def handle_cast({:inctrail, user}, state) do
    game = Map.get(state, user.id)
    game = Map.update(game, :trails, 1, fn x -> x + 1 end)
    state = Map.put(state, user.id, game)
    {:noreply, state}
  end
end
