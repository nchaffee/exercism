class InvalidCodonError < StandardError; end

class Translation
    CODONS = {
        %w{AUG} => %{Methionine},
        %w{UUU UUC} => %{Phenylalanine},
        %w{UCU UCC UCA UCG} => %{Serine},
        %w{UUA UUG} => %{Leucine},
        %w[UAU UAC] => %{Tyrosine},
        %w[UGU UGC] => %{Cysteine},
        %w[UGG] => %{Tryptophan},
        %w[UAA UAG UGA] => %{STOP},
    }
    
    def self.of_rna(strand)
        strand.chars.each_slice(3).with_object([]) do |codon, trans|
            case protein = of_codon(codon.join)
            when nil then raise InvalidCodonError
            when 'STOP' then return trans
            end
            trans << protein
        end
    end

    def self.of_codon(codon)
        match = CODONS.find{|k,v| k.include?(codon)}
        match ? match.last : nil
    end
end
