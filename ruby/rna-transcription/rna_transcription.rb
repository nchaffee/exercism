class Complement
  COMPLEMENTS = {
      'C' => 'G',
      'G' => 'C',
      'T' => 'A',
      'A' => 'U',
  }

  def self.of_dna(strand)
    rna = strand.each_char.to_a.map{|char| COMPLEMENTS[char] }.join('')
    rna.length == strand.length ? rna : ''
  end
end

module BookKeeping
  VERSION = 4
end
