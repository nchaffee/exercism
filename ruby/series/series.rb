class Series
  def initialize(numbers)
    @numbers = numbers
    @length = numbers.length
  end

  def slices(length)
    raise ArgumentError if length > @length
    (0..@length)
        .map { |index| @numbers[index, length] }
        .reject{ |slice| slice.length != length}
  end
end
