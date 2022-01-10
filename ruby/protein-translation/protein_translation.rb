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
        trans = strand.chars.each_slice(3).map do |codon|
            of_codon(codon.join)
        end
        raise InvalidCodonError if trans.any?(&:nil?)
        if trans.include?('STOP')
            stop = trans.index('STOP') - 1
            trans[0..stop]
        else
            trans
        end
    end

    def self.of_codon(codon)
        match = CODONS.find{|k,v| k.include?(codon)}
        match ? match.last : nil
    end
end
