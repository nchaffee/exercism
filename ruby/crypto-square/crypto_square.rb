class Crypto
    VAILD_CHARS = [*'0'..'9', *'a'..'z']

    def initialize(plaintext)
        @plaintext = plaintext
    end

    def ciphertext
        chars = @plaintext.
            chars.
            map(&:downcase).
            keep_if{|char| VAILD_CHARS.include?(char)}

        return "" if chars.none?
        num_rows = Math.sqrt(chars.size).ceil

        chars.
            tap do |chars|
                while chars.size % num_rows > 0 do chars.push(" ") end
            end.
            each_with_index.
            reduce(Array.new(num_rows, "")) do |cipher, (char, idx)|
                cipher[idx % num_rows] += char
                cipher
            end.
            join(" ")
    end
end
