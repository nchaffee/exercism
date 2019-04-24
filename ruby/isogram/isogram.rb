class Isogram
  def self.isogram?(word)
    return true if word.empty?
    chars = word.chars.map(&:downcase)

    chars.
      filter{|char| char.match(/\w/)}.
      all?{|char| chars.count(char) == 1}
  end
end
