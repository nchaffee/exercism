class SecretHandshake
     COMMANDS = [
        [1, "wink"],
        [10, "double blink"],
        [100, "close your eyes"],
        [1000, "jump"],
        [10000, "Reverse the order of the operations in the secret handshake."],
    ]

    def initialize(num)
        @num = num
    end

    def commands
        return [] unless @num.is_a?(Integer)
        @num
            .to_s(2)
            .chars
            .map(&:to_i)
            .reverse
            .zip(COMMANDS)
            .each_with_object([]) do |(bit, (_match,command)), c|
                unless bit.zero?
                    c.reverse! and next if command.split.first == "Reverse"
                    c.push(command)
                end
            end
    end
end