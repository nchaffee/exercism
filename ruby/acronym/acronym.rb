class Acronym
  FIRST_LETTER_OF_WORD_REGEX = /\b[\w]/

  def self.abbreviate(phrase)
    phrase.
    scan(FIRST_LETTER_OF_WORD_REGEX).
    join.
    upcase
  end
end
