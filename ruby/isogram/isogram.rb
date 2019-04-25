class Isogram
  def self.isogram?(word)
    return true if word.empty?
    !word.match?(/(\w).*\1/i)
  end
end
