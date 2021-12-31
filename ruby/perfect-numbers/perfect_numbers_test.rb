require 'minitest/autorun'
require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises RuntimeError do
      PerfectNumber.classify(-1)
    end
  end

  # def test_factors
  #   assert_equal [1], PerfectNumber.factors(13)
  #   assert_equal [1,2,3], PerfectNumber.factors(6)
  #   assert_equal [1, 2, 4, 7, 14], PerfectNumber.factors(28)
  #   assert_equal [1, 2, 3, 4, 6], PerfectNumber.factors(12)
  #   assert_equal [1, 2, 3, 4, 6, 8, 12], PerfectNumber.factors(24)
  # end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
