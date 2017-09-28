class Year
  class << self
    def leap?(year)
      @year = year
      (divisible_by(4) && !divisible_by(100)) || divisible_by(400)
    end

    private

    def divisible_by(number)
      (@year % number).zero?
    end
  end
end

module BookKeeping
  VERSION = 3
end
