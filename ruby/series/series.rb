class Series
  def initialize(numbers)
    @numbers = numbers
  end

  def slices(length)
    raise ArgumentError if length > @numbers.length
    @numbers.chars.each_cons(length).map(&:join)
  end
end
