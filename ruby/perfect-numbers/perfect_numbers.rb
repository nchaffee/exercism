class PerfectNumber
    def self.classify(int)
        raise RuntimeError unless int.positive?
        sum = (1..(int-1)).sum { |num| int % num == 0 ? num : 0 }
        sum == int ? "perfect" : sum >= int ? "abundant" : "deficient"
    end
end
