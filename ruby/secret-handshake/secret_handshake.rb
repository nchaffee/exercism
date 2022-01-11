class SecretHandshake
    COMMANDS = %W{wink double\sblink close\syour\seyes jump Reverse}

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
            .each_with_object([]) do |(bit, command), c|
                unless bit.zero?
                    c.reverse! and next if /Reverse/ =~ command
                    c.push(command)
                end
            end
    end
end