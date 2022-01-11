class WordyError < ArgumentError; end

class WordProblem
    OPERATORS = {plus: :+, minus: :-, multiplied: :*, divided: :/}
    IGNORE = %{What is by ?}
    def initialize(question)
        @question = question
    end

    def answer
        question = @question.split.rotate(2).delete_if{|word| IGNORE.include?(word)}
        result = question.shift.to_i
        question.each_with_object([]) do |word, stack|
            if OPERATORS.keys.include?(word.to_sym)
                stack.push(word.to_sym)
            elsif !stack.empty?
                result = result.send(OPERATORS[stack.pop], word.to_i)
            else
                raise WordyError
            end
        end
        result
    end
end
