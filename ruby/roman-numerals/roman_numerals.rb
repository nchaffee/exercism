class Integer
  def to_roman
    roman = ""

    (self.to_s.length - 1).downto(0) do |exponent|
      roman << roman_for(10**exponent)
    end
    roman
  end

  private

  def roman_for(digit)
    letters = {
        1    => {one: "I", five: "V"},
        10   => {one: "X", five: "L"},
        100  => {one: "C", five: "D"},
        1000 => {one: "M"}
    }

    roman = ""
    this_number = self.to_s[(-1*digit.to_s.length)].to_i

    case this_number
      when 1, 2, 3, 6, 7, 8
        roman << letters[digit][:five] if this_number > 5
        roman << letters[digit][:one] * (this_number % 5)
      when 4, 9
        roman << letters[digit][:one]
        roman << letters[digit * 10][:one] if this_number > 5
        roman << letters[digit][:five] if this_number < 5
      when 5
        roman << letters[digit][:five]
    end
    roman
  end
end

module BookKeeping
  VERSION = 2
end
