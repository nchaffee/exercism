class Proverb
    def initialize(*words, qualifier: nil)
        @words = words
        @qualifier = qualifier
    end

    def to_s
        line = "For want of a %s the %s was lost."
        last_line = "And all for the want of a %s%s."
        @words
            .each_cons(2)
            .map {|words| line % words }
            .tap {|lines| lines << last_line % [(@qualifier.to_s + " ").lstrip, @words.first]}
            .join("\n")
    end
end
