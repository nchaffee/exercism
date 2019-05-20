class Isogram
  def self.isogram?(word)
    !word.match?(/(\w).*\1/i)
  end
end
