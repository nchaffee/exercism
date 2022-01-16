module PigArray
    refine Array do
        def second
            self[1]
        end
    end
end

module PigString
    VOWELS = %w{a e i o u y}
    refine String do
        def vowel?
            VOWELS.include?(self)
        end
    end
end

module PigLatin
    using PigArray
    using PigString

    def translate(str)
        str.split.map{|s| rotate(s) + "ay"}.join(" ")
    end

    def rotate(word)
        chars = word.chars
        unless (chars.first == 'x' && !chars.second.vowel?)
            while !chars.first.vowel? || 
                (chars.last == 'q' && chars.first == 'u') || 
                (chars.first == 'y' && chars.second.vowel?)
                    chars = chars.rotate 
            end
        end
        chars.join
    end
end
PigLatin.extend(PigLatin)