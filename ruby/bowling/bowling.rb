class Game
  class BowlingError < StandardError
  end

  def initialize
    @frames = []
  end

  def roll(pins_down)
    raise BowlingError unless pins_down >= 0 && pins_down <= 10
    raise BowlingError if @frames.length == 10 && @frames.last.length > 1 && @frames.last.sum < 10
    if @frames.any? && @frames.last.length == 1 && @frames.last.first != 10
      raise BowlingError if @frames.last.first + pins_down > 10
      @frames.last << pins_down
    else
      @frames << [pins_down]
    end
  end

  def score
    raise BowlingError unless @frames.length >= 10

    @frames.each.with_index.inject(0) do |total, (frame, index)|
      total += frame.sum
      if index < 9 && frame.sum == 10
        total += @frames[index + 1].first
        if frame.length == 1
          total += @frames[index + 1].last if @frames[index + 1].length == 2
          total += @frames[index + 2].first if @frames[index + 1].length == 1
        end
      end
      total
    end
  end
end

module BookKeeping
  VERSION = 3
end
