class Sieve
  def initialize limit
    @limit = limit
    @composites = []

    @all_numbers = Array(2..limit)
    use_the_sieve_of_eratosthenes
  end

  def primes
    @all_numbers - @composites
  end

  private

  def use_the_sieve_of_eratosthenes
    @all_numbers.each do |number|
      mark_all_multiples_of number unless already_marked?(number)
    end
  end

  def mark_all_multiples_of number
    multipliers_under_limit_for(number).each do |multiplier|
      multiple = number * multiplier
      mark(multiple)
    end
  end

  def mark number
    @composites << number unless already_marked?(number)
  end

  def already_marked?(number)
    @composites.include? number
  end

  def multipliers_under_limit_for number
    2..(@limit / number)
  end
end

module BookKeeping
  VERSION = 1
end
