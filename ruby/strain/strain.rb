module Strain
  def discard(&block)
    assert(false, &block)
  end

  def keep(&block)
    assert(true, &block)
  end

  private

  def assert(true_or_false)
    each_with_object(dup) do |element, memo|
      memo.delete(element) unless (yield(element)) == true_or_false
    end
  end
end

class Array
  include Strain
end
