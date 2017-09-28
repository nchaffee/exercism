module RomanNumeral
  ROMAN_NUMERALS = {
    1    => { one: 'I', five: 'V' },
    10   => { one: 'X', five: 'L' },
    100  => { one: 'C', five: 'D' },
    1000 => { one: 'M' }
  }.freeze

  def to_roman
    (to_s.length - 1).downto(0).inject('') do |roman, exponent|
      roman << roman_for(10**exponent)
    end
  end

  private

  def roman_for(digit)
    roman = ''
    this_number = to_s[(-1 * digit.to_s.length)].to_i

    case this_number
    when 1, 2, 3
      roman << ROMAN_NUMERALS[digit][:one] * this_number
    when 6, 7, 8
      roman << ROMAN_NUMERALS[digit][:five]
      roman << ROMAN_NUMERALS[digit][:one] * (this_number - 5)
    when 4
      roman << ROMAN_NUMERALS[digit][:one]
      roman << ROMAN_NUMERALS[digit][:five]
    when 9
      roman << ROMAN_NUMERALS[digit][:one]
      roman << ROMAN_NUMERALS[digit * 10][:one]
    when 5
      roman << ROMAN_NUMERALS[digit][:five]
    end
    roman
  end
end

class Integer
  include RomanNumeral
end

module BookKeeping
  VERSION = 2
end
