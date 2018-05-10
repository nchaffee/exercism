defmodule Strain do
  def keep([], _function), do: []
  def keep([head | tail], function) do
    if function.(head), do: [head | keep(tail, function)], else: keep(tail, function)
  end

  def discard(list, function) do
    list -- keep(list, function)
  end
end
