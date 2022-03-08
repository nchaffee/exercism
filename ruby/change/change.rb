class Change
    def self.generate(all_coins, target_change)
        self.new(all_coins, target_change).result
    end

    def initialize(coins, target)
        @coins = coins.sort.reverse
        @target = target
        @results = [] # change to Set to keep unique
        add_coins
    end

    def add_coins()
        # 1 - go thru each coin size and add each number of coins that fits, all possibilities
        # 2 - add biggest remaining for other coins OR repeat #1
        # 3 - add to results when remaining is zero
        # 4 - return shortest result

        @coins.permutation(@coins.size).to_a.each do |coins|
            coins.each do |coin|
                fill_from(coins.rotate(coins.index(coin)))
            end
        end
    end

    def fill_from(coins)
        remaining = @target
        result = []
        coins.each do |coin|
            while remaining >= coin do
                remaining -= coin
                result.push(coin)
            end
        end
        @results.push(result.sort) if remaining == 0
    end

    def result
        @results.sort{|a,b| b.size <=> a.size}.last
    end
end
