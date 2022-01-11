module Atbash
    ALPHABET = [*'a'..'z']
    CODE = ALPHABET.zip(ALPHABET.reverse).to_h

    def encode(text)
        code(text).each_slice(5).map(&:join).join(' ')
    end

    def decode(text)
        code(text).join
    end

    module_function
    def code(text)
        text.downcase.chars
            .select{|c| c =~ /[[:alnum:]]/}
            .map{|c| CODE[c] ? CODE[c] : c}
    end
end
Atbash.extend(Atbash)