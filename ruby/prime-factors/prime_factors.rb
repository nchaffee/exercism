class PrimeFactors
  def self.for(number)
    result = []
    factor = 2
    while number > 1 do
      if (number % factor).zero?
        result << factor
        number = number / factor
      else
        factor += 1
      end
    end
    result
  end
end
