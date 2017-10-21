module Strain
  def keep
    select { |element| yield(element) }
  end

  def discard
    reject { |element| yield(element) }
  end
end

class Array
  include Strain
end
