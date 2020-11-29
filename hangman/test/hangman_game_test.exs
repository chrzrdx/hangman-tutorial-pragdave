defmodule HangmanGameTest do
  use ExUnit.Case
  alias Hangman.Game

  test "new_game returns correct initial state" do
    game = Game.new_game()

    assert game.turns_left == 7
    assert game.state == :initializing
    assert length(game.letters) > 0
  end

  test "making a move on :won or :lost games doesn't change the game state" do
    for state <- [:won, :lost] do
      game = Game.new_game() |> Map.put(:state, state)
      assert {^game, _tally} = Game.make_move(game, "x")
    end
  end

  test "first guess of a character should not alter the game state to :already_used" do
    game = Game.new_game()

    {game, _tally} = Game.make_move(game, "A")
    assert MapSet.member?(game.used, "A")
    assert game.state != :already_guessed
  end

  test "guessing an already guessed character should alter the game state to :already_used" do
    game = Game.new_game()

    {game, _tally} = Game.make_move(game, "A")
    assert MapSet.member?(game.used, "A")
    assert game.state != :already_guessed

    {game, _tally} = Game.make_move(game, "B")
    {game, _tally} = Game.make_move(game, "A")
    assert game.state == :already_guessed
  end
end
