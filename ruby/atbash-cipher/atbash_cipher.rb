class Atbash
    ALPHABET = ('a'..'z').to_a
    ENCODE = ALPHABET.zip(ALPHABET.reverse).to_h

    def self.encode(text, separator = ' ')
        text
            .downcase
            .gsub(/[^a-z0-9]/, '')
            .chars
            .map{|c| ENCODE[c] ? ENCODE[c] : c}
            .each_slice(5)
            .flat_map(&:join)
            .join(separator)
    end

    def self.decode(text)
        encode(text, '')
    end
end
