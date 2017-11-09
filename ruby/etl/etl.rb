class ETL
  def self.transform points_n_letters
    points_n_letters.each_with_object({}) do |(points, letters), memo|
      letters.each { |letter| memo[letter.downcase] = points }
    end
  end
end

module BookKeeping
  VERSION = 1
end
