class Luhn
  def self.valid?(number_str)
    number_str = number_str.gsub(" ", "")
    number_str.length > 1 &&
      number_str.match?(/^\d*$/) &&
      ((number_str.chars.map(&:to_i).reverse.map.with_index{|num, idx| (((idx+1) % 2) == 0) ? (num *2 >= 10 ? (num*2 % 10) + 1 : num*2) : num}.sum % 10) == 0)
  end
end
