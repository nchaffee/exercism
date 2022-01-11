class Atbash
    ALPHABET = [*'a'..'z']
    ENCODE = ALPHABET.zip(ALPHABET.reverse).to_h

    def self.encode(text, separator = ' ')
        text
            .chars
            .map(&:downcase)
            .reject{|c| c =~ /[^[:alnum:]]/}
            .map{|c| ENCODE[c] ? ENCODE[c] : c}
            .each_slice(5)
            .map(&:join)
            .join(separator)
    end

    def self.decode(text)
        encode(text, '')
    end
end
