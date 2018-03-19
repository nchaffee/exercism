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
  @events %{
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump",
    10000 => "reverse"
  }

  def commands(0) do
    []
  end

  def commands(number) do
    digits = Integer.digits number,2
    result = add_commands_for(digits) |> Enum.filter(&(!is_nil(&1)))

    case result do
      r when r == [] -> result
      r when hd(r) == "reverse" -> tl(result)
      _ -> Enum.reverse result
    end
  end

  defp add_commands_for(digits) do
    case length(digits) do
      1 -> [event_for_bit(digits) | []]
      _ -> [event_for_bit(digits) | add_commands_for(tl(digits))]
    end
  end

  defp event_for_bit(digits) do
    case hd(digits) do
      1 -> @events[:math.pow(10,length(digits) - 1) |> round]
      0 -> nil
    end
  end
end
