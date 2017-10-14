class PhoneNumber
  ALLOWED_EXCHANGE_DIGITS = ('2'..'9').freeze
  ALLOWED_DIGITS = ('0'..'10').freeze

  def self.clean(submitted_number)
    cleaned_number = submitted_number
                     .chars
                     .select { |digit| ALLOWED_DIGITS.include?(digit) }
                     .join
    cleaned_number[0] = '' if cleaned_number[0] == '1'

    valid_size = cleaned_number.size == 10
    valid_exchange_code = ALLOWED_EXCHANGE_DIGITS.include?(cleaned_number[3])

    valid_size && valid_exchange_code ? cleaned_number : nil
  end
end

module BookKeeping
  VERSION = 2
end
