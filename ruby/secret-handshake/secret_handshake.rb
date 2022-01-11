class SecretHandshake
    COMMANDS = %W{wink double\sblink close\syour\seyes jump Reverse}

    def initialize(num)
        @num = num
    end

    def commands
        return [] unless @num.is_a?(Integer)
        COMMANDS.each_with_object([]) do |command, c|
                if bit_is_on?(command)
                    c.reverse! and next if /Reverse/ =~ command
                    c.push(command)
                end
            end
    end

    private
    def bit_is_on?(command)
        @num & (2 ** COMMANDS.index(command)) != 0
    end
end
