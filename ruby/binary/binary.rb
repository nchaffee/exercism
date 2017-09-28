class Binary
  def self.to_decimal binary
    raise ArgumentError if binary.match(/[^01]/)
    binary.reverse.chars.map(&:to_i).each_with_index.inject(0) do |sum, (digit, index)|
      sum + (digit * 2**index)
    end
  end
end

module BookKeeping
  VERSION = 3
end
