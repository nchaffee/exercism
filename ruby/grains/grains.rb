class Grains
  def self.square(number)
    raise ArgumentError unless (1..64).cover? number
    board[number]
  end

  def self.total
    board.inject(&:+)
  end

  def self.board
    board = [0, 1]
    63.times { board << board.last * 2 }
    board
  end
end

module BookKeeping
  VERSION = 1
end
