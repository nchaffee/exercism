class BaseConverter
    def self.convert(input_base, digits, output_base)
        raise ArgumentError if input_base <= 1 || 
            digits.any?(&:negative?) || 
            digits.any?{|d| d >= input_base} || 
            output_base < 2
        total = convert_to_base_10(digits,input_base)
        convert_from_base_10(total, output_base)
    end

    # def self.convert_to_base_10(digits, input_base)
    #     digits.reverse.map.with_index do |digit, index|
    #        digit * input_base ** index 
    #     end.sum
    # end

    # def self.convert_from_base_10(total, output_base)
    #     result = []
    #     until total.zero? do
    #         total, rem = total.divmod(output_base)
    #         result.unshift(rem)
    #     end
    #     result.empty? ? result.unshift(0) : result
    # end

    def self.convert_to_base_10(digits, input_base, total = 0)
        if digits.length == 0
            total
        else
            totalAccrued = total + (digits.shift() * (input_base ** digits.length))
            convert_to_base_10(digits, input_base, totalAccrued);
        end       
    end

    def self.convert_from_base_10(total, output_base, digits = [])
        if total.zero?
            digits.unshift(0) if digits.length.zero?
            digits
        else 
            digits.unshift(total % output_base)
            total = total / output_base
            convert_from_base_10(total, output_base, digits)        
        end
    end
end
