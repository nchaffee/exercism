class Crypto
    def initialize(plaintext)
        @plaintext = plaintext
    end

    def ciphertext
        chars = @plaintext.downcase.scan(/\w/)
        return "" if chars.none?
        num_rows = Math.sqrt(chars.size).ceil
        while chars.size % num_rows > 0 do chars.push(" ") end

        chars.each_with_index.
            reduce(Array.new(num_rows, "")) do |cipher, (char, idx)|
                cipher[idx % num_rows] += char
                cipher
            end.join(" ")
    end
end
