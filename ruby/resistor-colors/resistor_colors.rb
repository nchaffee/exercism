class ResistorColors
  COLORS = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }
  def self.value colors
    "".tap do |value|
      colors.each{|color| value << COLORS[color].to_s}
    end.to_i
  end
end
