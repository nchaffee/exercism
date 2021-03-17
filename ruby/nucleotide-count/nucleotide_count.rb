class Nucleotide
    NUCLEOTIDES = "ACTG"

    def self.from_dna(str)
        raise ArgumentError unless str.delete(NUCLEOTIDES).empty?
        new(str)
    end

    def initialize(str)
        @strand = str
    end

    def count(letter)
        @strand.chars.keep_if{|tide| tide == letter }.size
    end

    def histogram
        NUCLEOTIDES.chars.map{|char| [char, count(char)]}.to_h
    end
end
