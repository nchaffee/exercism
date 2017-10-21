class Array
  def discard(&block)
    assert(false, &block)
  end

  def keep(&block)
    assert(true, &block)
  end

  private

  def assert(true_or_false)
    inject([]) do |memo, element|
      memo << element if (yield(element)) == true_or_false
      memo
    end
  end
end
