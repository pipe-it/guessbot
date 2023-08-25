defmodule Guess.UserDetails do
  def get_name do
    n = 3
    IO.puts("Enter User name not less than 3 characters")
    name = IO.gets("") |> String.trim()
    validate_name(name, n)
  end

  def validate_name(name, n) do
    count = String.length(name)

    if count >= n do
      name
    else
      get_name()
    end
  end

  def get_email do
    IO.puts("Enter User email, example : abc@xyz.elixir ")
    email = IO.gets("") |> String.trim()
    validate_email(email)
  end

  def validate_email(email) do
    validformat =
      ~r/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    if Regex.match?(validformat, email) do
      email
    else
      get_email()
    end
  end
end
