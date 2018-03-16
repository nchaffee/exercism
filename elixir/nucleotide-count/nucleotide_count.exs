defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, fn(dna) -> dna == nucleotide end)
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.map(@nucleotides, fn(nucleotide) -> [nucleotide, count(strand, nucleotide)] end)
    |> Map.new(fn([k,v]) -> {k,v} end)
  end
end
