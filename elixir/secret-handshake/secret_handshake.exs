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

  def commands(0), do: []
  def commands(number) do
    digits = Integer.digits(number,2)
    |> Enum.reverse
    |> Enum.with_index

    result = add_commands_for(digits)
    |> Enum.filter(&(!is_nil(&1)))

    if List.last(result) == "reverse" do
      result = Enum.reverse(result -- ["reverse"])
    end
    result
  end

  defp add_commands_for(digits) do
    case length(digits) do
      1 -> [event_for_bit(hd(digits)) | []]
      _ -> [event_for_bit(hd(digits)) | add_commands_for(tl(digits))]
    end
  end

  defp event_for_bit({0, index}), do: nil
  defp event_for_bit({1, index}), do: @events[:math.pow(10,index) |> round]
end
