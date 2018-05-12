defmodule ProteinTranslation do
  def of_rna(rna) do
    case rna_for(rna) do
      [_ | :invalid] -> {:error, "invalid RNA"}
      :invalid -> {:error, "invalid RNA"}
      good_rna -> {:ok, good_rna}
    end
  end

  def rna_for(""), do: []
  def rna_for(rna) do
    {codon, rest} = rna |> String.split_at(3)
    case of_codon(codon) do
      {:ok, "STOP"} -> []
      {:ok, protein} -> [protein | rna_for(rest)]
      {:error, "invalid codon"} -> :invalid
    end
  end

  @proteins [
    {["UGU", "UGC"], "Cysteine"},
    {["UUA", "UUG"], "Leucine"},
    {["AUG"], "Methionine"},
    {["UUU", "UUC"], "Phenylalanine"},
    {["UCU", "UCC", "UCA", "UCG"], "Serine"},
    {["UGG"], "Tryptophan"},
    {["UAU", "UAC"], "Tyrosine"},
    {["UAA", "UAG", "UGA"], "STOP"},
  ]
  def of_codon(codon) do
    get_protein = Enum.find(@proteins, fn {codons, _protein} -> Enum.member?(codons, codon) end )
    case get_protein do
      {_codons, protein} -> {:ok, protein}
      nil -> {:error, "invalid codon"}
    end
  end
end
