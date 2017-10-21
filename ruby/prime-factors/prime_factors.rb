class Integer
  def divisible_by?(number)
    modulo(number).zero?
  end
end

class PrimeFactors
  def self.for(number)
    (number == 1) ? [] : factors(number)
  end

  def self.factors(number)
    (2..number).each do |factor|
      return (self.for(number / factor).unshift(factor)).flatten if number.divisible_by?(factor)
    end
  end
end
