class Nucleotide
    NUCLEOTIDES = "ACTG"
    def initialize(str)
        raise ArgumentError unless str.delete(NUCLEOTIDES).empty?
        @strand = str
    end

    def histogram
        NUCLEOTIDES.chars.to_h{|char| [char, @strand.count(char)]}
    end

    def count(letter)
        histogram[letter]
    end

    class << self
        alias_method :from_dna, :new
    end
end
