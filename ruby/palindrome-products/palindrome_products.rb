require 'ostruct'
class Palindromes
    def self.palindrome?(arr)        
        return true if arr.length <= 1
        arr[0] == arr[-1] ? palindrome?(arr.slice(1,arr.length - 2)) : false
    end
    
    def initialize(max_factor:,min_factor:1)
        @min_factor, @max_factor = min_factor, max_factor
    end

    def generate
        @palindromes = 
            (@min_factor..@max_factor).
                to_a.
                repeated_combination(2).
                group_by{|a,b| a * b}.
                select{|value, _factors| Palindromes.palindrome?(value.digits)}.
                map{|value, factors| OpenStruct.new(value: value, factors: factors)}
    end

    def largest
        @palindromes.max{|a,b| a.value <=> b.value }
    end

    def smallest
        @palindromes.min{|a,b| a.value <=> b.value }
    end
end
