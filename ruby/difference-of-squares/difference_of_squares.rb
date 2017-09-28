# ruby version 2.3.1 ain't got sum method

class Squares
  def initialize(highest_number)
    @numbers = (1..highest_number)
    @squares = @numbers.map { |each_number| square_of(each_number) }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    square_of(sum_of(@numbers))
  end

  def sum_of_squares
    sum_of(@squares)
  end

  private

  def sum_of(an_array)
    an_array.inject(&:+)
  end

  def square_of(number)
    number**2
  end
end

module BookKeeping
  VERSION = 4
end
