require 'ostruct'

class Palindromes
    def self.palindrome?(arr)        
        return true if arr.length <= 1
        arr[0] == arr[-1] ? self.palindrome?(arr.slice(1,arr.length - 2)) : false
    end
    
    attr_reader :smallest, :largest

    def initialize(max_factor:,min_factor:1)
        @range = [*min_factor..max_factor]
        @largest = OpenStruct.new(value: 0, factors: [])
        @smallest = OpenStruct.new(value: nil, factors: [])
    end

    def generate
        @range.product(@range).each do |factors| 
            value = factors.inject(&:*)
            new_palindrome(value, factors.sort) if Palindromes.palindrome?(value.digits)
        end
    end

    private
    def new_palindrome(value, factors)
        @largest = OpenStruct.new(value: value, factors: [factors]) if value > @largest.value
        @smallest = OpenStruct.new(value: value, factors: [factors]) if @smallest.value.nil? || value < @smallest.value

        @largest.factors << factors if value == @largest.value && !@largest.factors.include?(factors)
        @smallest.factors << factors if value == @smallest.value && !@smallest.factors.include?(factors)
    end
end
