class String
  def first; self[0]; end
end

class Acronym
  def self.abbreviate(phrase)
    phrase.
    gsub('-', ' ').
    split(' ').
    map(&:first).
    map(&:upcase).
    join
  end
end
