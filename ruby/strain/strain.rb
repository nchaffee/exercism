module Strain
  def keep
    select { |element| yield(element) }
  end

  def discard(&block)
    reject { |element| keep(&block).include?(element) }
  end
end

class Array
  include Strain
end
