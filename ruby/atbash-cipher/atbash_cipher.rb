class Atbash
    ALPHABET = [*'a'..'z']
    CODE = ALPHABET.zip(ALPHABET.reverse).to_h

    def self.encode(text)
        code(text).each_slice(5).map(&:join).join(' ')
    end

    def self.decode(text)
        code(text).join
    end

    private
    def self.code(text)
        text.downcase.chars
            .select{|c| c =~ /[[:alnum:]]/}
            .map{|c| CODE[c] ? CODE[c] : c}
    end
end
