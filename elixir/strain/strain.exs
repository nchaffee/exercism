defmodule Strain do
  def keep([], _function), do: []
  def keep([head | tail], function) do
    if function.(head), do: [head | keep(tail, function)], else: keep(tail, function)
  end

  def discard([], _function), do: []
  def discard([head | tail], function) do
    if !function.(head), do: [head | discard(tail, function)], else: discard(tail, function)
  end
end
