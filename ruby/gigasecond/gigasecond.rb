class Gigasecond
  def self.from(some_time)
    Time.at(some_time.to_i + 1_000_000_000)
  end
end

module BookKeeping
  VERSION = 6
end
