class Bob
  ANSWERS = {
    yell:     'Whoa, chill out!',
    question: 'Sure.',
    nothing:  'Fine. Be that way!'
  }.tap { |answers| answers.default = 'Whatever.' }

  def self.hey(remark)
    remark.strip!
    remark_type =
      if remark =~ /[[:upper:]]/ && remark == remark.upcase
        :yell
      elsif remark.end_with?('?')
        :question
      elsif remark.empty?
        :nothing
      end
    ANSWERS[remark_type]
  end
end

module BookKeeping
  VERSION = 1
end
