class Brackets
    PAIR = {
        "]" => "[",
        "}" => "{",
        ")" => "("
    }.freeze

    def self.paired?(str)
        str.chars.each_with_object([]) do |char, pairs|
            if PAIR.values.include?(char)
                pairs.push(char)
            elsif PAIR.keys.include?(char)
                return false if pairs.pop != PAIR[char]
            end
        end.empty?
    end
end
