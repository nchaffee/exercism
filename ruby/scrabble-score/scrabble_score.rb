class Scrabble
  SCORES =
    {
      1 => ['A','E','I','O','U','L','N','R','S','T'],
      2 => ['D','G'],
      3 => ['B','C','M','P'],
      4 => ['F','H','V','W','Y'],
      5 => ['K'],
      8 => ['J','X'],
      10 => ['Q','Z']
    }.freeze

  def initialize(word)
    @letters = word.nil? ? [] : word.scan(/\w/)
  end

  def score
    @letters.map do |letter| 
      SCORES.filter{|k,v| v.include?(letter.upcase)}.keys.first
    end.sum
  end

  def self.score(word)
    self.new(word).score
  end
end
