class Crypto
    def initialize(plaintext)
        @plaintext = plaintext
    end

    def ciphertext
        chars = @plaintext.downcase.scan(/\w/)
        return "" if chars.none?
        num_rows = Math.sqrt(chars.size).ceil
        while chars.size % num_rows > 0 do chars.push(" ") end

        cipher = Array.new(num_rows, "")
        chars.size.times {|idx| cipher[idx % num_rows] += chars.shift }
        cipher.join(" ")
    end
end
