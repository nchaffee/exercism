class Hexadecimal
  HEX_TO_DECIMAL = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "a" => 10,
    "b" => 11,
    "c" => 12,
    "d" => 13,
    "e" => 14,
    "f" => 15
  }

  class Char < String
    def initialize char
      @decimal_value = HEX_TO_DECIMAL[char]
    end

    def to_d
      @decimal_value
    end

    def valid?
      !@decimal_value.nil?
    end
  end

  def initialize hex_string
    @hex_chars = hex_string.chars.reverse.map do |char|
      Char.new(char)
    end
    @valid = @hex_chars.all?(&:valid?)
  end

  def to_decimal
    @valid ? sum_decimal_values : 0
  end

  private

  def sum_decimal_values
    @hex_chars.map.with_index do |char, index|
      char.to_d * 16.pow(index)
    end.sum
  end
end
