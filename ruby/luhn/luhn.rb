class Luhn
  def initialize(str)
    @str = str.delete(" ")
  end

  def valid?
    at_least_two_numbers? && valid_checksum?
  end

  private

  def at_least_two_numbers?
    @str.match?(/^\d{2,}$/)
  end

  def valid_checksum?
    digits = @str.chars.map(&:to_i)
    convert_to_doubles_and_sum(digits) % 10 == 0
  end

  def convert_to_doubles_and_sum(str)
    str.reverse.map.with_index do |number, index|
      second_digit?(index) ? limit_to_one_digit(number*2) : number
    end.sum
  end

  def second_digit?(index)
    (index + 1) % 2 == 0
  end

  def limit_to_one_digit(number)
    number >= 10 ? number % 10 + 1 : number
  end

  class << self
    def valid?(str)
      Luhn.new(str).valid?
    end
  end
end
