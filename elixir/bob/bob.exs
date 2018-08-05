defmodule Bob do
  def hey(str) do
  	cond do
  	  empty?(str) ->
  	  	"Fine. Be that way!"
  	  question?(str) && all_caps?(str) ->
  	  	"Calm down, I know what I'm doing!"
  	  question?(str) ->
  	  	"Sure."
  	  all_caps?(str) ->
  	  	"Whoa, chill out!"
	  true ->
	  	"Whatever."
  	end
  end

  defp empty?(str), do: String.trim(str) == ""
  defp question?(str), do: String.last(str) == "?"

  defp all_caps?(str) do
  	letters = str |> String.to_charlist() |> Enum.filter(&(letter?(&1)))
  	Enum.all?(letters, &(upcase?(<<&1>>))) && length(letters) > 0
  end

  defp letter?(char) do
  	!(MapSet.new(32..64)
  	  	|> MapSet.union(MapSet.new(91..96))
  	  	|> MapSet.union(MapSet.new(123..126)) 
  	  	|> MapSet.to_list
  	  	|> Enum.member?(char))
  end

  defp upcase?(letter), do: letter == String.upcase(letter)
end
