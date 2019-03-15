class Hexadecimal
  HEX_TO_DECIMAL = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15}
  
  attr_reader :to_decimal
  
  def initialize hex_string
    @to_decimal = 
      hex_string.
      chars.
      reverse.
      map {|char| HEX_TO_DECIMAL[char]}.
      map.with_index do |decimal_value, index|
        decimal_value.nil? ? (break [0]) : decimal_value * 16.pow(index)
      end.
      sum
  end
end
