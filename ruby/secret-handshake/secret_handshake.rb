class SecretHandshake
     COMMANDS = [
        [1, "wink"],
        [10, "double blink"],
        [100, "close your eyes"],
        [1000, "jump"],
        [10000, "Reverse the order of the operations in the secret handshake."],
    ]

    def initialize(num)
        @bits = num.is_a?(Integer) ? num.to_s(2).chars.map(&:to_i).reverse : []
    end

    def commands
        return [] if @bits.empty?
        @bits.zip(COMMANDS).each_with_object([]) do |(bit, (match,command)), c|
            if bit == 1 
                c.reverse! if match == 10000
                c.push(command) if match != 10000
            end
        end.compact
    end
end
