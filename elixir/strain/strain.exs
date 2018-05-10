defmodule Strain do
  def keep(list, function) do
    keep(list, function, true)
  end

  def discard(list, function) do
    keep(list, function, false)
  end

  def keep([], _function, _bool), do: []
  def keep([head | tail], function, bool) do
    if apply(function, [head]) == bool do
      [head | keep(tail, function, bool)]
    else
      keep(tail, function, bool)
    end
  end
end
