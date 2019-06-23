class Luhn
  class << self
    def valid?(str)
      str = str.gsub(" ", "")
      longer_than_one?(str) && only_numbers?(str) && valid_checksum?(str)
    end

    def valid_checksum?(str)
      digits = str.chars.map(&:to_i)
      convert_to_doubles_and_sum(digits) % 10 == 0
    end

    def convert_to_doubles_and_sum(str)
      str.reverse.map.with_index do |number, index|
        second_digit?(index) ? limit_to_one_digit(number*2) : number
      end.sum
    end

    def limit_to_one_digit(number)
      more_than_10?(number) ? add_digits(number) : number
    end

    def more_than_10?(number) number >= 10; end

    def second_digit?(index) (index + 1) % 2 == 0; end

    def add_digits(number) number % 10 + 1; end

    def longer_than_one?(str) str.length > 1; end

    def only_numbers?(str) str.match?(/^\d*$/); end
  end
end
