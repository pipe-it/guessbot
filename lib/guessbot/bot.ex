defmodule Guessbot.Bot do
  use ExGram.Bot, name: :numgues_bot

  command("start")
  command("play")
  command("about")
  command("help")

  def handle({:command, :start, %{from: _user}} = data, cnt) do
    text = """
    Welcome to Number Guessing Game!

    To Play Number Game send "/play"
    To Know about the Game or Developer send "/about"
    For help send "/help"

    |> Cheers..! XD

    """

    answer(cnt, text)
  end

  def handle({:command, :about, %{from: _user}} = data, cnt) do
    text = """
    Number guessing game is a humble elixir based telegram bot. 

    Developer Email: pipe-it@gmx.it
    Developer GitHub Repo : https://github.com/pipe-it/guessbot
    """

    answer(cnt, text)
  end

  def handle({:command, :help, %{from: _user}} = data, cnt) do
    text = """
    You start the game by guessing a random number between 1 and 100.

    Once you start, you get prompt to let you know if your guess is small or big relative to the random number.

    You may respond with the closest number, and the cycle continues untill you guess the right number.

    |> Cheers..! XD
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

    text = """
    Guess a number between 1 and 100.
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
