class ArmstrongNumbers
    def self.include?(num)
        digits = num.digits
        num == digits.sum{|d| d.pow(digits.count)}
    end
end
