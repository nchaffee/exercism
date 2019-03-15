class SpaceAge
  attr_reader :on_earth

  ORBITAL_PERIODS = {
    jupiter: 11.862615,
    mars: 1.8808158,
    mercury: 0.2408467,
    neptune: 164.79132,
    saturn: 29.447498,
    uranus: 84.016846,
    venus: 0.61519726
  }

  def initialize seconds
    @on_earth = seconds / 31557600.to_f
  end

  def method_missing(m, *args, &block)
    on_earth / ORBITAL_PERIODS[m.slice(3..-1).to_sym]
  end
end
