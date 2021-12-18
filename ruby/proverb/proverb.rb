class Proverb
    def initialize(*words, qualifier: nil)
        @words = words
        @qualifier = qualifier
    end

    def to_s
        @words
            .each_cons(2)
            .map{|word1, word2| "For want of a #{word1} the #{word2} was lost."}
            .tap{|lines| lines << "And all for the want of a %s%s." % [(@qualifier.to_s + " ").lstrip, @words.first]}
            .join("\n")
    end
end
