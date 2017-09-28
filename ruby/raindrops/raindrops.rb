class Integer
  def factor_of?(product)
    (product % self).zero?
  end
end

class Raindrops
  def self.convert(number_of_drops)
    raindrop_speak = ''
    raindrop_speak << 'Pling' if 3.factor_of?(number_of_drops)
    raindrop_speak << 'Plang' if 5.factor_of?(number_of_drops)
    raindrop_speak << 'Plong' if 7.factor_of?(number_of_drops)
    raindrop_speak << number_of_drops.to_s if raindrop_speak.empty?
    raindrop_speak
  end
end

module BookKeeping
  VERSION = 3
end
