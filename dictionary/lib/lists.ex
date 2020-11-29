defmodule Lists do
  @spec sum_pairs([number]) :: [number]
  def sum_pairs([]), do: []
  def sum_pairs([x, y | tail]), do: [x + y | sum_pairs(tail)]

  @spec even_length?([any]) :: boolean
  def even_length?([]), do: true
  def even_length?([_]), do: false
  def even_length?([_, _ | tail]), do: even_length?(tail)
end
