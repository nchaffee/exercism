class ETL
  def self.transform points_n_letters
    points_n_letters.inject({}) do |memo, (points, letters)|
      letters.each { |letter| memo[letter.downcase] = points }
      memo
    end
  end
end

module BookKeeping
  VERSION = 1
end
