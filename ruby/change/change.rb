require 'set'

class Change
    class ImpossibleCombinationError < StandardError; end
    class NegativeTargetError < StandardError; end

    attr_reader :target
    def self.generate(all_coins, target_change)
        change = self.new(all_coins, target_change)
        if !change.target.zero? && change.result.empty?
            raise ImpossibleCombinationError
        else
            change.result
        end
    end

    def initialize(coins, target)
        raise NegativeTargetError if target < 0
        raise ImpossibleCombinationError if target < coins.min && !target.zero?
        @coins = coins.sort.reverse
        @tried = Set.new
        @result = []
        @target = target
        if target > 100
            change = []
            while target > 100 do
                change << coins.max
                target -= coins.max
            end
            add_coins(change)
        else
            add_coins([])
        end
    end

    def add_coins(change)
        case 
        when change.sum == @target 
            verify(change)
        when change.sum < @target
            if @tried.add?(change.sort)
                @coins.each do |coin|
                    next_change = change + [coin]
                    add_coins(next_change) unless @tried.include?(next_change)
                end
            end
        else
            nil
        end
    end

    def verify(change)
        if change.sum == @target
            if result.empty? || change.size < result.size
                @result = change 
            end
        end
    end

    def result
        @result.sort
    end
end
