class ArmstrongNumbers
    def self.include?(num)
        num == num.to_s.
            each_char.
            map(&:to_i).
            map{|d| d.pow(num.to_s.length)}.
            sum
    end
end
