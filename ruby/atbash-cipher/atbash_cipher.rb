class Atbash
    def self.encode(text, separator = ' ')
        text = text.downcase.gsub(/[^a-z0-9]/i, '').chars
        encode = ('a'..'z').to_a.zip(('a'..'z').to_a.reverse).to_h
        text.map{|c| encode[c] ? encode[c] : c}.compact.each_slice(5).flat_map(&:join).join(separator)
    end

    def self.decode(text)
        encode(text, '')
    end
end
