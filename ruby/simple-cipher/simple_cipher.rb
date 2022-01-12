class Cipher
    attr_reader :key
    AZ = ('a'..'z').to_a
    def initialize(key = 'aaaaaaaaaaaaaaaaaa')
        raise ArgumentError if key =~ /[^a-z]/ || key.empty?
        @key = key
    end
    
    def encode(plaintext, dir = :+)
        plaintext.chars.zip(@key.chars).map do |t,k|
            AZ[(AZ.index(t).send(dir,AZ.index(k))) % 26]
        end.join
    end

    def decode(plaintext)
        encode(plaintext, :-)
    end
end
