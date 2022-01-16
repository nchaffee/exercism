class Element
    attr_reader :datum
    attr_accessor :next
    def initialize(datum)
        @datum = datum
    end

    def push(other)
        @next ? @next.push(other) : @next = other
    end

    def pop(other)
        if @next
            @next.pop(self)
        else
            other.next = nil 
            self
        end
    end
end

class SimpleLinkedList
    attr_accessor :next
    def initialize(list = [])
        list.each{|e| push(Element.new(e))}
    end

    def reverse!
        elems = list
        @next = nil
        elems.each{|e| e.next = nil}
        elems.each{|e| push(e)}
        self
    end

    def push(element)
        @next ? @next.push(element) : @next = element
        self
    end

    def pop
        @next && @next.pop(self)
    end

    def to_a
        list.map(&:datum)
    end

    def list
        result = []
        while tmp = self.pop do
            result << tmp
        end
        result
    end
end
