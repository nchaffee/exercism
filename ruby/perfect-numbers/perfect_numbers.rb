class PerfectNumber
    def self.classify(int)
        raise RuntimeError unless int.positive?
        below_int = 1..(int - 1)
        aliquot_sum = below_int.select {|num| (int % num).zero? }.sum

        case aliquot_sum
        when below_int then "deficient"
        when int then "perfect"
        else "abundant" 
        end
    end
end
