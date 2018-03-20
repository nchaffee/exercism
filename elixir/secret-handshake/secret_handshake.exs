defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  def commands(code) do
    Enum.zip(List.duplicate(code,5), [8,4,2,1,16])
    |> Enum.reduce([], &add_commands/2)
  end

  defp add_commands({code,16}, commands) when (code &&& 16) == 16 do
    Enum.reverse(commands)
  end

  defp add_commands({code,bit}, commands) when (code &&& bit) == bit do
    [command_for(bit) | commands]
  end

  defp add_commands({_,_}, commands), do: commands

  defp command_for(1), do: "wink"
  defp command_for(2), do: "double blink"
  defp command_for(4), do: "close your eyes"
  defp command_for(8), do: "jump"
end
