class Brackets
    PAIR = {
        "]" => "[",
        "}" => "{",
        ")" => "("
    }

    def self.paired?(str)
        str
            .gsub(/[^\[\]\{\}\(\)]|\s/, '')
            .chars
            .each_with_object([]) do |char, pairs|
                if PAIR.values.include?(char)
                    pairs.push(char)
                else
                    last = pairs.pop 
                    return false if last != PAIR[char]
                end
            end.length.zero?
    end
end
