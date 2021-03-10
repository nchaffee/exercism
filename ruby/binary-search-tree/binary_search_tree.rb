class Bst
    attr_accessor :data, :left, :right
    def initialize(num)
        @data = num
    end

    def each
        return all_data.to_enum unless block_given?
        all_data.each {|data| yield(data)}
    end

    def all_data
        data = [@data]
        [@left, @right].each{|node| data << node.all_data if node}
        data.flatten.sort
    end

    def insert(num)
        num > @data ? insert_right(num) : insert_left(num)
    end

    def insert_left(num)
        @left.nil? ? @left = Bst.new(num) : @left.insert(num)
    end

    def insert_right(num)
        @right.nil? ? @right = Bst.new(num) : @right.insert(num)
    end
end
