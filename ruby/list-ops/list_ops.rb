class ListOps
  class << self
    def factorial_reducer(some_ary)
      sum = 1
      while some_ary[0] != nil do
        sum *= some_ary.pop
      end
      sum
    end

    def sum_reducer(some_ary)
      sum = 0
      while some_ary[0] != nil do
        sum += some_ary.pop
      end
      sum
    end

    def filterer(some_ary, &block)
      old_ary = some_ary.dup.push(:end)
      new_ary = []
      while old_ary[0] != :end do
        item = old_ary.shift
        new_ary.push(item) if block.call(item) == true
      end
      new_ary
    end

    def mapper(some_ary, &block)
      old_ary = some_ary.dup.push(:end)
      new_ary = []
      while old_ary[0] != :end do
        new_ary.push(block.call(old_ary.shift))
      end
      new_ary
    end

    def concatter(some_ary, some_ary2)
      ary1 = some_ary.dup
      ary2 = some_ary2.dup.push(:end)

      loop do
        break if ary2[0] == :end
        next_item = ary2.shift        
        ary1.push(next_item)
      end
      ary1
    end

    def reverser(some_ary)
      old_ary = some_ary.dup.unshift(:end)
      new_ary = []
      while old_ary.last != :end do
        new_ary.push(old_ary.pop)
      end
      new_ary
    end

    def arrays(some_ary)
      count = 0
      ary = some_ary.dup.unshift(:end)
      while ary.pop != :end do
        count += 1
      end
      count
    end
  end
end