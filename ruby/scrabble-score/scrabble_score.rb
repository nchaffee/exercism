class Scrabble
  LETTER_VALUES =
    {
      ['A','E','I','O','U','L','N','R','S','T'] => 1,
      ['D','G'] => 2,
      ['B','C','M','P'] => 3,
      ['F','H','V','W','Y'] => 4,
      ['K'] => 5,
      ['J','X'] => 8,
      ['Q','Z'] => 10
    }.freeze

  def initialize(word)
    @letters = word.to_s.scan(/\w/)
  end

  def score
    @letters.sum do |letter|
      LETTER_VALUES.filter{|k,v| k.include?(letter.upcase)}.values.first
    end
  end

  def self.score(word)
    self.new(word).score
  end
end
