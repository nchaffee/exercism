class Game
    attr_accessor :score
    def initialize
        @frames = []
        @first_throw = nil
    end

    def roll(pins)
        raise BowlingError if pins < 0 || pins > 10
        if @frames.size == 10 && @frames[-1].size == 2 && @frames[-1].sum < 10
            raise BowlingError
        end
        if @first_throw && @first_throw + pins > 10
            raise BowlingError
        elsif @first_throw && pins < 10
            @frames << [@first_throw, pins]
            @first_throw = nil
        elsif last_frame?
            last_frame = @frames[-1]
            if last_frame.first == 10 && 
                last_frame.size == 2 && 
                last_frame[1] < 10 &&
                last_frame[1] + pins > 10
                raise BowlingError
            end
            last_frame << pins
        elsif pins == 10
            @frames << [pins]
            @first_throw = nil
        else
            @first_throw = pins
        end
    end

    def score
        raise BowlingError if @frames.size < 10
        @frames.each_with_index.map do |frame, idx|
            score = frame.sum
            if strike?(frame)
                next_frame = @frames[idx+1]
                if next_frame.size > 1
                    score += @frames[idx+1][0] + @frames[idx+1][1]
                else
                    score += next_frame.first
                    score += @frames[idx+2].first
                end
            elsif spare?(frame)
                score += @frames[idx+1].first
            end
            score
        end.sum
    end

    private
    def spare?(frame)
        frame.size == 2 && frame.sum == 10
    end

    def strike?(frame)
        frame.size == 1 && frame.first == 10
    end

    def last_frame?
        @frames.size == 10
    end

    class BowlingError < StandardError
    end
end
