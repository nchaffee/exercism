class Phrase
  WORD_WITH_SINGLE_QUOTE = /\b[\w']+\b/

  def initialize phrase
    @occurrences = phrase.
        downcase.
        scan(WORD_WITH_SINGLE_QUOTE).
        group_by(&:itself).
        transform_values(&:size)
  end

  def word_count
    @occurrences
  end
end

module BookKeeping
  VERSION = 1
end
