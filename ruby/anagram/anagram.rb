class Anagram
    def initialize(word)
        @word = letters(word)
    end

    def match(list)
        list.select do |str|
            word = letters(str)
            word.sort == @word.sort && word != @word
        end
    end

    private
    def letters(str)
        str.chars.map(&:downcase)
    end
end
