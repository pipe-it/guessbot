defmodule Guess.Game do
  alias Guess.UserDetails, as: UD

  def start_game do
    IO.puts("***Welcome to the Guessing game***")
    IO.puts("----------------------------------")

    IO.puts("""
    You have to guess a number between 1 and 100
    and i will tell you if it is smaller or bigger
    than the correct number untill your guess
    matchs with the number:
    """)

    play? =
      IO.gets("Do you want to play a guessing game? enter y/n and press enter ") |> String.trim()

    if play? == "y" do
      name = UD.get_name()
      email = UD.get_email()
      play(name, email)
    else
      IO.puts("Bye Bye .. never meet again ")
    end
  end

  def play(name, email) do
    {index, rn} = Guess.Number.check_number()

    gamer = %{
      name: name,
      email: email,
      index: index,
      guss_num: rn
    }

    print_result(gamer)

    playagain? =
      IO.gets("Do you want to play again? press y/n")
      |> String.trim()

    if playagain? == "y" do
      play(name, email)
    else
      IO.puts("Bye Bye .. never meet again ")
    end
  end

  defp print_result(gamer) do
    output = """
    *********************************
              Guess Game
    *********************************
    Name : #{gamer.name}
    Email: #{gamer.email}
    ---------------------------------

    ------------------------------------------------------------------
    |                                                                |
    |You took #{gamer.index} trails to guess #{gamer.guss_num} number|
    |                                                                |
    ------------------------------------------------------------------


    Finito..
    """

    IO.puts(output)
  end
end
