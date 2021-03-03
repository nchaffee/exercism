class Robot
    def self.forget
        @@available_names = AVAILABLE_NAMES.dup
    end

    LETTERS = ('A'..'Z').to_a
    NUMBERS = (0..9).to_a.map(&:to_s)
    ALL_NAMES = LETTERS.map{|letter1| LETTERS.map{|letter2| NUMBERS.map {|number1| NUMBERS.map{|number2| NUMBERS.map{|number3| letter1 + letter2 + number1 + number2 + number3} }}}}.flatten
    AVAILABLE_NAMES = Hash[ALL_NAMES.each_with_object(nil).to_a]
    @@available_names = AVAILABLE_NAMES.dup

    attr_accessor :name
    def initialize
        reset
    end

    def reset
        name = @@available_names.first.first
        @name = name
        @@available_names.delete(name)
    end
end
