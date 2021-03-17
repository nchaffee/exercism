class RailFenceCipher
    def self.decode(message,height)
        return message if height == 1
        char_map = Fence.new(message.size, height).rails.flatten
        message.chars.each_with_index.
            reduce(Array.new(message.size)) do |acc, (char, idx)|
                acc[char_map[idx]] = char
                acc
        end.join
    end

    def self.encode(message,height)
        return "" if message.empty?
        return message if height == 1
        Fence.new(message.size, height).rails.map do |rail|
            rail.map {|idx| message[idx]}.join
        end.join
    end

    class Fence
        def initialize(message_size, height)
            @message_size = message_size
            @height = height
        end

        def rails
            rail = 0
            rails = Array.new(height) {Array.new}
            direction = :up
            message_size.times do |idx|
                rails[rail] << idx
                case rail
                when 0
                    direction = :up
                    rail += 1
                when height - 1
                    direction = :down
                    rail -= 1
                else
                    direction == :up ? rail += 1 : rail -= 1
                end
            end
            rails
        end

        def height
            @height ||= height
        end

        def message_size
            @message_size ||= message_size
        end
    end
end
