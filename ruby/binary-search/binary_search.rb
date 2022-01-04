class BinarySearch
    def initialize(list)
        @list = list.sort
        @first = 0
        @last = list.length - 1
    end

    def search_for(target)
        return nil if @list.empty? || @first + 1 == @last
        return @first if @list[@first] == target
        return @last if @list[@last] == target
        middle = (@last - @first) / 2 + @first
        return middle if @list[middle] == target
        if @list[middle] > target
            @last = middle
            search_for(target)
        else
            @first = middle
            search_for(target)
        end
    end
end
