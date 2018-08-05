defmodule Bob do
  @space 32
  @question_mark 63
  
  def hey(input) do
  	cond do
  	  is_empty(input) ->
  	  	"Fine. Be that way!"
  	  is_question(input) && is_all_caps(input) ->
  	  	"Calm down, I know what I'm doing!"
  	  is_question(input) ->
  	  	"Sure."
  	  is_all_caps(input) ->
  	  	"Whoa, chill out!"
	  true ->
	  	"Whatever."
  	end
  end

  defp is_empty(str) do
  	str
  	|> String.to_charlist()
  	|> Enum.reject(&(&1 == @space))
  	|> Enum.empty?()
  end

  defp is_question(str) do
  	last_char = 
	  	str
	  	|> String.to_charlist()
		|> Enum.reverse()
		|> List.first()
	last_char == @question_mark
  end

  defp is_all_caps(str) do
  	letters = 
	  	str
	  	|> String.to_charlist()
	  	|> Enum.filter(&(is_letter(&1)))
  	Enum.all?(letters, &(is_upcase(<<&1>>))) && length(letters) > 0
  end

  defp is_letter(char) do
  	!Enum.member?(32..64, char) && !Enum.member?(91..96, char) && !Enum.member?(123..126, char)
  end

  defp is_upcase(letter) do
  	letter == String.upcase(letter)
  end
end
