class Prime
  class << self
    def nth(desired_number)
      raise ArgumentError if desired_number.zero?

      primes = [2]
      next_number = 3

      until primes.size == desired_number
        unless primes.any? { |prime| (next_number % prime).zero? }
          primes << next_number
        end
        next_number += 2
      end

      primes.last
    end
  end
end

module BookKeeping
  VERSION = 1
end
