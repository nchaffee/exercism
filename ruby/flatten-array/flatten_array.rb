class FlattenArray
    def self.flatten(input)
        input.each_with_object([]) do |item, output| 
            unwind(item, output)
        end
    end

    def self.unwind(item, output)
        if item.class == Array
            item.each {|item| unwind(item, output)}
        else
            output << item unless item.nil?
        end
    end
end
