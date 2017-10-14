class PhoneNumber
  ALLOWED_DIGITS = ('0'..'10').freeze
  ALLOWED_EXCHANGE_DIGITS = ('2'..'9').freeze

  def self.clean(submitted_number)
    new(submitted_number).validate
  end

  def initialize(phone_number)
    @phone_number = phone_number
                    .chars
                    .select { |digit| ALLOWED_DIGITS.include?(digit) }
                    .join
                    .tap { |number| number[0] = '' if number[0] == '1' }
  end

  def validate
    valid_size = @phone_number.size == 10
    valid_exchange_code = ALLOWED_EXCHANGE_DIGITS.include?(@phone_number[3])

    valid_size && valid_exchange_code ? @phone_number : nil
  end
end

module BookKeeping
  VERSION = 2
end
