class ArmstrongNumbers
    def self.include?(num)
        digits = num.to_s.each_char.map(&:to_i)
        digit_count = num.to_s.length
        sum_squares = digits.map{|d| d.pow(digit_count)}.sum
        num == sum_squares
    end
end
