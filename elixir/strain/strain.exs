defmodule Strain do
  def keep([], _function), do: []
  def keep([head | tail], function) do
    if apply(function, [head]), do: [head | keep(tail, function)], else: keep(tail, function)
  end

  def discard(list, function) do
    keep(list, &(!apply(function, [&1])))
  end
end
