defmodule GuessbotTest do
  use ExUnit.Case
  doctest Guessbot

  test "greets the world" do
    assert Guessbot.hello() == :world
  end
end
