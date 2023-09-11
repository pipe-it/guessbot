defmodule Guessbot.Game do
  @enforce_keys [:gameid, :gamern]
  defstruct gameid: nil, gametrails: 0, gamern: nil, gamestatus: :playing
end
