class PerfectNumber
    def self.classify(int)
        raise RuntimeError unless int.positive?
        factor_sum = (1.upto(int-1))
            .select { |num| int % num.zero? }
            .sum
        factor_sum == int ? "perfect" : 
            factor_sum >= int ? "abundant" 
                : "deficient"
    end
end
