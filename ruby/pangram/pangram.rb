class Pangram
  def self.pangram?(phrase)
    phrase.downcase!
    ('a'..'z').all? { |char| phrase.include? char }
  end
end

module BookKeeping
  VERSION = 5
end
