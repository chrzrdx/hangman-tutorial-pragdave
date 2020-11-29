defmodule Hangman.Game do
  defstruct(
    state: :initializing,
    turns_left: 7,
    letters: [],
    used: MapSet.new()
  )

  def new_game() do
    %Hangman.Game{
      letters:
        Dictionary.random_word()
        |> String.codepoints()
    }
  end

  def make_move(game = %{state: state}, _guess) when state in [:won, :lost] do
    {game, tally(game)}
  end

  def make_move(game = %{used: used}, guess) do
    game = accept_move(game, guess, guess in used)
    {game, tally(game)}
  end

  defp accept_move(game, _guess, _already_guessed = true) do
    game |> Map.put(:state, :already_guessed)
  end

  defp accept_move(game, guess, _already_guessed = false) do
    game |> Map.put(:used, MapSet.put(game.used, guess))
  end

  defp tally(_game = %{turns_left: turns_left}) do
    turns_left
  end
end
