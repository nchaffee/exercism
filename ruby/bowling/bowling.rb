class Game
  class BowlingError < StandardError
  end

  def initialize
    @frames = []
  end

  def roll(pins_down)
    raise BowlingError unless pins_down >= 0 && pins_down <= 10
    raise BowlingError if last_frame? && current_frame.length > 1 && current_frame.sum < 10

    if @frames.any? && current_frame.length == 1 && current_frame.first != 10
      raise BowlingError if current_frame.first + pins_down > 10
      current_frame << pins_down
    elsif last_frame?
      if strike?(current_frame)
        current_frame << pins_down if current_frame.length < 3
        raise BowlingError if current_frame.length == 3 && current_frame[1] < 10 && (current_frame[1] + current_frame[2] > 10)
      elsif current_frame.length == 2 && current_frame.sum == 10
        current_frame << pins_down
      end
    else
      @frames << [pins_down]
    end
  end

  def score
    raise BowlingError unless last_frame?
    raise BowlingError if (strike?(current_frame) || current_frame[0] + current_frame[1] == 10) && current_frame.length < 3

    @frames.each.with_index.inject(0) do |total, (frame, index)|
      total += frame.sum

      case index
      when 9
      when 8
        total += next_frame(index).first if frame.sum == 10
        total += next_frame(index)[0] if frame.length == 1
      else
        total += next_frame(index).first if frame.sum == 10
        if frame.first == 10
          total += next_frame(index).length == 1 ? next_next_frame(index).first : next_frame(index)[1]
        end
      end

      total
    end
  end

  def strike?(frame)
    frame.first == 10
  end

  def next_next_frame(index)
    @frames[index + 2]
  end

  def next_frame(index)
    @frames[index + 1]
  end

  private

  def last_frame?
    @frames.length == 10
  end

  def current_frame
    @frames.last
  end
end

module BookKeeping
  VERSION = 3
end
