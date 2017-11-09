class Trinary
  VALID_SYMBOLS = ['0', '1', '2'].freeze

  def initialize symbols
    @symbols = symbols.chars.all? { |symbol| VALID_SYMBOLS.include?(symbol) } ? symbols.chars.map(&:to_i) : []
    @values = []
    next_value_from(@symbols) if @symbols.any?
  end

  def to_decimal
    @values.sum
  end

  private

  def next_value_from(symbols)
    @values << symbols.pop * (3**(@values.length))
    next_value_from(symbols) if symbols.any?
  end
end

module BookKeeping
  VERSION = 1
end
