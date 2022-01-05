class Bucket
  attr_accessor :liters, :max_size, :label
  def initialize(liters, max_size, desired_liters, label)
    @liters, @max_size, @desired_liters, @label = liters, max_size, desired_liters, label
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
    @max_size == @desired_liters
  end

  def winner?
    @liters == @desired_liters
  end
end

class TwoBucket
  attr_reader :moves
  def initialize(bucket_one_max_size, bucket_two_max_size, desired_liters, starting_bucket)
    @moves = 0
    @buckets = [
      @bucket_one = Bucket.new(0, bucket_one_max_size, desired_liters, 'one'),
      @bucket_two = Bucket.new(0, bucket_two_max_size, desired_liters, 'two')
    ]
    @buckets.reverse! if starting_bucket == 'two'
    pour
  end

  def goal_bucket
    @goal_bucket ||= @buckets.find(&:winner?).label
  end
  
  def other_bucket
    @other_bucket ||= @buckets.find{|b| b.label != @goal_bucket}.liters
  end

  private
  def pour
    bucket1, bucket2 = @buckets
    until bucket1.winner? || bucket2.winner? do      
      case
      when !bucket1.empty? && bucket2.instant_winner? then bucket2.fill!  
      when bucket2.full? then bucket2.empty!
      when bucket1.empty? then bucket1.fill!
      else 
        while !bucket1.empty? && !bucket2.full? do
          bucket1.liters -= 1
          bucket2.liters += 1
        end    
      end
      @moves += 1
    end
  end
end
