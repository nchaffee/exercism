Bucket = Struct.new(:liters, :max_size)

class TwoBucket
  attr_reader :goal_bucket, :moves, :other_bucket
  def initialize(bucket_one_max_size, bucket_two_max_size, desired_liters, starting_bucket)
    @starting_bucket = starting_bucket
    @bucket_one_max_size = bucket_one_max_size
    @bucket_two_max_size = bucket_two_max_size
    @desired_liters = desired_liters
    @moves = 0
    @bucket_one = Bucket.new(0, bucket_one_max_size)
    @bucket_two = Bucket.new(0, bucket_two_max_size) 
    start_pouring
  end

  def start_pouring
    until @bucket_one.liters == @desired_liters || @bucket_two.liters == @desired_liters do
      @starting_bucket == 'one' ? small_bucket_process : large_bucket_process
    end
    @goal_bucket = @desired_liters == @bucket_one.liters ? 'one' : 'two'
    @other_bucket = @desired_liters == @bucket_one.liters ? @bucket_two.liters : @bucket_one.liters
  end

  def large_bucket_process
    if empty?(@bucket_two)
      fill(@bucket_two)
    elsif full?(@bucket_one)
      empty!(@bucket_one)
    else
      pour(@bucket_two)
    end
  end

  def small_bucket_process
    if !empty?(@bucket_one) && @bucket_two.max_size == @desired_liters
      fill(@bucket_two)
    elsif full?(@bucket_two)
      empty!(@bucket_two)
    elsif empty?(@bucket_one)
      fill(@bucket_one)
    else
      pour(@bucket_one)
    end 
  end

  def pour(bucket)
    receiving_bucket = bucket == @bucket_one ? @bucket_two : @bucket_one
    while (bucket.liters > 0) && (receiving_bucket.liters < receiving_bucket.max_size) do
      bucket.liters -= 1
      receiving_bucket.liters += 1
    end
    @moves += 1
  end

  def fill(bucket)
    bucket.liters = bucket.max_size
    @moves += 1
  end

  def empty!(bucket)
    bucket.liters = 0
    @moves += 1
  end

  def empty?(bucket)
    bucket.liters == 0
  end

  def full?(bucket)
    bucket.liters == bucket.max_size
  end
# To conclude, the only valid moves are:
# - pouring from either bucket to another
# - emptying either bucket and doing nothing to the other
# - filling either bucket and doing nothing to the other
end
