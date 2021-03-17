class Nucleotide
    NUCLEOTIDES = ['A','C','T','G']

    def self.from_dna(str)
        raise ArgumentError unless str.chars.all?{|l| NUCLEOTIDES.include?(l)}
        new(str)
    end

    def initialize(str)
        @strand = str
    end

    def count(letter)
        @strand.chars.keep_if{|tide| tide == letter }.size
    end

    def histogram
        NUCLEOTIDES.map{|char| [char, count(char)]}.to_h
    end
end
