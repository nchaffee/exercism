class PhoneNumber
  ALLOWED_EXCHANGE_DIGITS = ('2'..'9').freeze
  ALLOWED_DIGITS = ('0'..'10').freeze

  def self.clean(submitted_number)
    phone_number = submitted_number
                     .chars
                     .select { |digit| ALLOWED_DIGITS.include?(digit) }
                     .join
    phone_number[0] = '' if phone_number[0] == '1'

    Validator.validate(phone_number)
  end

  class Validator
    def self.validate(phone_number)
      valid_size = phone_number.size == 10
      valid_exchange_code = ALLOWED_EXCHANGE_DIGITS.include?(phone_number[3])

      valid_size && valid_exchange_code ? phone_number : nil
    end
  end
end

module BookKeeping
  VERSION = 2
end
