require 'minitest/autorun'

class ArrayTest < Minitest::Test
  def test_no_block_is_passed
    result = [1, 2, 3, 4, 5, 6, 7, 8, 9].accumulate
    assert_instance_of Enumerator, result
    assert_equal 9, result.size
  end
end

module Accumulate
  def accumulate &block
    return to_enum(__method__) { size } unless block_given?
    copy = dup
    [].tap { |result| result.push yield(copy.shift) while copy.length > 0 }
  end
end

class Array
  include Accumulate
end

module BookKeeping
  VERSION = 1
end
