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
  @actions %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }
  def commands(code) do
    [8,4,2,1,16]
    |> Enum.reduce([], &add_commands(code, &1, &2))
  end

  defp add_commands(code,bit,commands) when (code &&& bit) == bit do
    if bit == 16, do: Enum.reverse(commands), else: [@actions[bit] | commands]
  end

  defp add_commands(_,_,commands), do: commands
end
