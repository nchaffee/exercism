defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand
    |> Enum.count(fn(dna) -> dna == nucleotide end)
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
    |> Enum.map(fn(nucleotide) -> {nucleotide, count(strand, nucleotide)} end)
    |> Map.new
  end
end
