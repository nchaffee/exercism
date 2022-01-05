class Bucket
  attr_accessor :liters, :max_size, :label
  def initialize(target, max_size, label)
    @target, @max_size, @label = target, max_size, label
    @liters = 0
  end

  def empty?
    @liters == 0
  end

  def empty!
    @liters = 0
  end

  def fill!
    @liters = @max_size
  end

  def full?
    @liters == @max_size
  end

  def instant_winner?
    @max_size == @target
  end

  def pour_into(bucket)
    while !empty? && !bucket.full? do
      @liters -= 1
      bucket.liters += 1
    end    
  end

  def winner?
    @liters == @target
  end
end

class TwoBucket
  attr_reader :moves
  def initialize(size1, size2, target, first_bucket)
    @moves = 0
    @buckets = [[target, size1, 'one'],[target, size2, 'two']]
      .map{|data| Bucket.new(*data)}
      .sort_by!{|b| b.label == first_bucket ? 0 : 1}
    pour
  end

  def goal_bucket
    @buckets.first.label
  end

  def other_bucket
    @buckets.last.liters
  end

  private
  def pour
    bucket1, bucket2 = @buckets
    until bucket1.winner? || bucket2.winner? do      
      case
      when !bucket1.empty? && bucket2.instant_winner? then bucket2.fill!  
      when bucket2.full? then bucket2.empty!
      when bucket1.empty? then bucket1.fill!
      else bucket1.pour_into(bucket2)
      end
      @moves += 1
    end
    @buckets.sort_by!{|b| b.winner? ? 0 : 1}
  end  
end
