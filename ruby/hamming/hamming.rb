class Hamming
  def self.compute strand, other_strand
    raise ArgumentError if strand.length != other_strand.length
    distance = 0
    strand.length.times do |character_index|
      distance += 1 if strand[character_index] != other_strand[character_index]
    end
    distance
  end
end

module BookKeeping
  VERSION = 3
end
