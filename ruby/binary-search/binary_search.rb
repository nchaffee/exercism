class BinarySearch
    def initialize(list)
        @list = list.sort
    end

    def search_for(target)
        return nil if @list.empty? || !target.between?(@list.first,@list.last)
        find(@list, target, 0)
    end

    def find(list, target, start)
        last = list.length - 1
        middle = last / 2
        case
        when list.first == target then start
        when list.last == target then start + last
        when list[middle] == target then start + middle 
        when list[middle] > target then find(list[start..(middle-1)], target, start)
        else find(list[(middle+1)..last], target, middle+1)
        end
    rescue
        nil
    end
end
