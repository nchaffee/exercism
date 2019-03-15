class Hexadecimal
  HEX_TO_DECIMAL = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15}

  def initialize hex_string
    @decimal_values = hex_string.chars.reverse.map do |char|
      HEX_TO_DECIMAL[char]
    end
  end

  def to_decimal
    @decimal_values.any?(&:nil?) ? 0 : sum_decimal_values
  end

  private

  def sum_decimal_values
    @decimal_values.map.with_index do |decimal_value, index|
      decimal_value * 16.pow(index)
    end.sum
  end
end
