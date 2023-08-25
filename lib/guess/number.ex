defmodule Guess.Number do
  @spec get_number :: binary
  def get_number do
    IO.puts("""
    Guess a number between 1 and 100
    """)

    IO.gets("") |> String.trim()
  end

  def check_number do
    n = 100
    rn = 1..n |> Enum.random()
    run(rn, 1)
  end

  def run(rn, index) do
    number = get_number() |> String.to_integer(10)

    # IO.inspect({rn, number})

    cond do
      number < rn ->
        IO.puts("The number #{number} is small.")
        IO.puts("Try Again")
        run(rn, index + 1)

      number > rn ->
        IO.puts("The number #{number} is big.")
        IO.puts("Try Again")
        run(rn, index + 1)

      number == rn ->
        {index, rn}
    end
  end
end
