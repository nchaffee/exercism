class Prime
  class << self
    def nth desired_number
      raise ArgumentError if desired_number == 0

      primes = [2]
      next_number = 3

      until primes.size == desired_number
        primes << next_number unless primes.any?{|prime| next_number % prime == 0}
        next_number += 2
      end

      primes.last
    end
  end
end

module BookKeeping
  VERSION = 1
end
