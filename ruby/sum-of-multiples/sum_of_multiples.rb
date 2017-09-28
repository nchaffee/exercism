class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    1.upto(limit - 1).select do |multiple|
      @factors.any? { |factor| multiple.modulo(factor).zero? }
    end.sum
  end
end

module BookKeeping
  VERSION = 1
end
