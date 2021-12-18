class Proverb
    def initialize(*words, qualifier: nil)
        @words = words
        @qualifier = qualifier
    end

    def to_s
        @words.each.with_index.inject("") do |memo, (word, index)|
            memo += "For want of a #{@words[index-1]} the #{word} was lost.\n" unless index == 0
            memo
        end + "And all for the want of a #{@qualifier + " " if @qualifier}%s." % @words.first
    end
end
