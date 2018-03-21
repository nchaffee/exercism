defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(&rotate_char(shift, &1))
    |> List.to_string
  end

  defp rotate_char(shift, old) when old in 96..123, do: rem((old + shift - 97), 26) + 97
  defp rotate_char(shift, old) when old in 64..91, do: rem((old + shift - 65), 26) + 65
  defp rotate_char(_, char), do: char
end
