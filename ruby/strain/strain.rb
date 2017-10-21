module Strain
  def discard(&block)
    assert(false, &block)
  end

  def keep(&block)
    assert(true, &block)
  end

  private

  def assert(true_or_false)
    select { |element| yield(element) == true_or_false }
  end
end

class Array
  include Strain
end
