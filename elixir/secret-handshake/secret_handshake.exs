defmodule SecretHandshake do
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

  def commands(number) do
    Integer.digits(number,2)
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.reduce([], &add_commands/2)
    |> Enum.reverse
  end

  defp add_commands({0, _}, commands), do: commands
  defp add_commands({_, 0}, commands), do: ["wink" | commands]
  defp add_commands({_, 1}, commands), do: ["double blink" | commands]
  defp add_commands({_, 2}, commands), do: ["close your eyes" | commands]
  defp add_commands({_, 3}, commands), do: ["jump" | commands]
  defp add_commands({_, 4}, commands), do: Enum.reverse(commands)
  defp add_commands({_, _}, commands), do: commands
end
