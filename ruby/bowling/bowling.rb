class Game
    class BowlingError < StandardError; end

    def initialize
        start_new_frame
    end

    def roll(pins)
        raise BowlingError if pins.negative? || too_many(pins) || game_complete
        if @opening_throw && pins < 10
            frames << [@opening_throw, pins]
            start_new_frame
        elsif last_frame
            last_frame << pins
        elsif pins == 10
            frames << [pins]
            start_new_frame
        else
            @opening_throw = pins
        end
        true
    end

    def score
        raise BowlingError unless game_complete
        frames.each_with_index.map do |frame, idx|
            score = frame.sum
            score += next_2_rolls(idx).sum if strike?(frame) && idx < 9
            score += next_2_rolls(idx).first if spare?(frame) && idx < 9
            score
        end.sum
    end

    private

    def next_2_rolls(index)
        frames[(index+1)..-1].flatten[0..1]
    end

    def spare?(frame)
        frame.size == 2 && frame.sum == 10
    end

    def strike?(frame)
        frame.first == 10
    end

    def last_frame
        frames[9]
    end

    def game_complete
        last_frame && (open_frame?(last_frame) || last_frame.size == 3)
    end

    def open_frame?(frame)
        frame.size == 2 && frame.sum < 10
    end

    def too_many(pins)
        pins > 10 ||
            (@opening_throw && @opening_throw + pins > 10) ||
            (
                fill_ball? &&
                strike?(last_frame) &&
                second_throw(last_frame) < 10 &&
                second_throw(last_frame) + pins > 10
            )
    end

    def fill_ball?
        last_frame && last_frame.size == 2
    end

    def first_throw(frame)
        frame[0]
    end

    def second_throw(frame)
        frame[1]
    end

    def frames
        @frames ||= []
    end

    def start_new_frame
        @opening_throw = nil
    end
end
