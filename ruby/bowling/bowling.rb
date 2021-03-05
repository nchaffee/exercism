class Game
    attr_accessor :score
    def initialize
        @frames = []
        @first_throw = nil
    end

    def roll(pins)
        raise BowlingError if too_many(pins) || too_few(pins) || game_complete
        if @first_throw && pins < 10
            @frames << [@first_throw, pins]
            @first_throw = nil
        elsif last_frame
            last_frame << pins
        elsif pins == 10
            @frames << [pins]
            @first_throw = nil
        else
            @first_throw = pins
        end
    end

    def score
        raise BowlingError unless game_complete
        @frames.each_with_index.map do |frame, idx|
            score = frame.sum
            unless idx == 9
                next_2_rolls = @frames[idx+1..-1].flatten[0..1]
                if strike?(frame)
                    score += next_2_rolls.sum
                elsif spare?(frame)
                    score += next_2_rolls.first
                end
            end
            score
        end.sum
    end

    private
    def spare?(frame)
        frame.size == 2 && frame.sum == 10
    end

    def strike?(frame)
        frame.first == 10
    end

    def last_frame
        @frames[9]
    end

    def game_complete
        (last_frame && open_frame?(last_frame)) ||
            (last_frame && last_frame.size == 3)
    end

    def open_frame?(frame)
        frame.size == 2 && frame.sum < 10
    end

    def too_few(pins)
        pins < 0
    end

    def too_many(pins)
        pins > 10 ||
            (@first_throw && @first_throw + pins > 10) ||
            (
                last_frame &&
                fill_ball? &&
                strike?(last_frame) &&
                second_throw(last_frame) < 10 &&
                second_throw(last_frame) + pins > 10
            )
    end

    def fill_ball?
        last_frame.size == 2
    end

    def first_throw(frame)
        frame[0]
    end

    def second_throw(frame)
        frame[1]
    end

    class BowlingError < StandardError
    end
end
