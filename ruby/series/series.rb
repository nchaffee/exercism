class Series
  def initialize(numbers)
    @numbers = numbers
    @length = numbers.length
  end

  def slices(length)
    raise ArgumentError if length > @length
    (0..@length).inject([]) do |result, index|
      slice = @numbers.slice(index..-1).slice(0, length)
      slice.length == length ? result << slice : result
    end
  end
end
