class Proverb
    def initialize(*words, qualifier: nil)
        @words = words
        @qualifier = qualifier
    end

    def to_s
        @words.each_cons(2).with_object("") do |(word1, word2), memo|
            memo << "For want of a #{word1} the #{word2} was lost.\n"
        end + "And all for the want of a %s%s." % [(@qualifier.to_s + " ").lstrip, @words.first]
    end
end
