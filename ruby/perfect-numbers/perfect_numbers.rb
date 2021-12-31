require 'prime'

class PerfectNumber
    def self.classify(int)
        raise RuntimeError unless int > 0
        case
        when self.factors(int).sum == int then "perfect"
        when self.factors(int).sum >= int then "abundant"
        when self.factors(int).sum <= int then "deficient"
        end
    end

    def self.factors(int)
        (1..(int-1)).each_with_object([]) do |num, factors|
            factors << num if int % num == 0
        end
    end
end
