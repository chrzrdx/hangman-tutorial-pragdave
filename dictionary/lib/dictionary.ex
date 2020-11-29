defmodule Dictionary do
  @moduledoc """
  Documentation for `Dictionary`.
  """

  require Logger

  @spec read_words :: [binary]
  @doc """
  Returns a list of words from words.txt file.

  ## Examples

      iex> Dictionary.read_words()
      ["that", "this" ...]

  """
  def read_words do
    "../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  @spec random_word :: binary
  @doc """
  Returns a random word from the wordlist

  ## Examples

      iex> Dictionary.random_word()
      "burke"
  """
  def random_word do
    read_words()
    |> Enum.random()
  end
end
