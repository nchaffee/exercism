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
    |> String.split("", trim: true)
    |> Enum.map(&rotate_char(shift, &1))
    |> Enum.join
  end

  defp rotate_char(shift, char) do
    <<codepoint::utf8>> = char
    base = base_for(codepoint)
    if base == 0, do: char, else: stringify((codepoint + shift), base)
  end

  defp base_for(codepoint) do
    cond do
      (codepoint > 96 && codepoint < 123) -> 96
      (codepoint > 64 && codepoint < 91) -> 64
      true -> 0
    end
  end

  defp stringify(codepoint, base) when codepoint > (base + 26), do: to_string([codepoint - 26])
  defp stringify(codepoint, base), do: to_string([codepoint])
end
