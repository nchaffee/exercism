require 'set'

class Change
    class ImpossibleCombinationError < StandardError; end
    class NegativeTargetError < StandardError; end

    attr_reader :result, :target
    def self.generate(coins, target)
        change = self.new(coins, target)
        raise ImpossibleCombinationError if !change.target.zero? && change.result.empty?
        change.result
    end

    def initialize(coins, target)
        raise NegativeTargetError if target < 0
        raise ImpossibleCombinationError if target < coins.min && !target.zero?
        @coins = coins.sort.reverse
        @tried = Set.new
        @result = []
        @target = target
        change = [].tap do |change|
            while target > 100 do
                change << coins.max
                target -= coins.max
            end
        end
        add_coins(change)
    end

    def add_coins(change)
        case 
        when change.sum == @target 
            verify(change)
        when change.sum < @target
            @coins.each {|coin| add_coins(change + [coin])} if @tried.add?(change.sort)
        end
    end

    def verify(change)
        if change.sum == @target && (result.empty? || change.size < result.size)
            @result = change.sort
        end
    end
end
