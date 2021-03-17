class RailFenceCipher
    def self.decode(message,max_rail)
        return message if max_rail == 1
        chars = message.chars
      
        rail = 0
        rails = Array.new(max_rail) {Array.new}
        direction = :up
        chars.size.times do |idx|
            rails[rail] << idx
            case rail
            when 0
                direction = :up
                rail += 1
            when max_rail - 1
                direction = :down
                rail -= 1
            else
                direction == :up ? rail += 1 : rail -= 1
            end
        end
        rails = rails.flatten
        decoded = Array.new(chars.size)
        chars.map.with_index do |char, idx|
            decoded[rails[idx]] = char
        end
        decoded.join
    end

    def self.encode(message,max_rail)
        return "" if message.empty?
        return message if max_rail == 1

        chars = message.chars
        rail = 0
        rails = Array.new(max_rail, "")
        direction = :up
        while chars.any? do
            rails[rail] += chars.shift
            case rail
            when 0
                direction = :up
                rail += 1
            when max_rail - 1
                direction = :down
                rail -= 1
            else
                direction == :up ? rail += 1 : rail -= 1
            end
        end
        rails.join
    end
end
