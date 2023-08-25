defmodule Guessbot.Bot do
  use ExGram.Bot, name: :numgues_bot

  command("start")
  command("play")

  def handle({:command, :start, %{from: _user}} = data, cnt) do
    text = """
    Welcome to Number Guessing Game!

    To Play Number Game send "/play"

    Cheers..! XD

    """

    answer(cnt, text)
  end

  def handle({:command, :play, %{from: _user} = data}, cnt) do
    text = """
    Number Guessing Game
    """

    buttons = [
      [%{text: "PLAY NOW", callback_data: "play now"}],
      [%{text: "EXIT", callback_data: "exit"}]
    ]

    reply_markup = %{
      inline_keyboard: buttons,
      resize_keyboard: true
    }

    options = [reply_markup: reply_markup, parse_mode: "markdown"]
    ExGram.send_message(data.chat.id, text, options)
  end

  def handle({:callback_query, %{data: "play now"}} = data, cnt) do
    
    start_game = Guess.Game.start_game()
    
    text = """
    You have to guess a number between 1 and 100
    and i will tell you if it is smaller or bigger
    than the correct number untill your guess
    matchs with the number:
    """

    answer(cnt, text)
  end

  def handle({:callback_query, %{data: "exit"}} = data, cnt) do
    text = """
    Good Bye, Ammakutty!
    """

    answer(cnt, text)
  end
end
