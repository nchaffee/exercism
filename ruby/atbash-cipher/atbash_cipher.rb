module Atbash
    ALPHABET = [*'a'..'z']
    CODE = ALPHABET.zip(ALPHABET.reverse).to_h

    def decode(text)
        text.downcase.chars
        .select{|c| c =~ /[[:alnum:]]/}
        .map{|c| CODE[c] ? CODE[c] : c}
        .join
    end

    def encode(text)
        decode(text).chars.each_slice(5).map(&:join).join(' ')
    end
end
Atbash.extend(Atbash)