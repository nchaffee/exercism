# 23, 23
# 194, 222
# 639, 580

class Alphametics
    def self.solve(puzzle)
        letters = puzzle.scan(/\w/).uniq
        
        words,final = puzzle.split("==")
        words = words.split("+").map(&:strip)
        final = final.strip
        
        solution = {}
        matrix = self.number_matrix([], letters, letters.size)

        matrix.each do |combo|
            possible_solution = letters.reduce({}) do |acc, letter|
                acc[letter] = combo.pop
                acc
            end
            
            dictionary = {}
            (words + [final]).each do |word|
                if dictionary.has_key?(word)
                    dictionary[word][:count] += 1
                else
                    dictionary[word] = {
                        count: 1,
                        digits: word.chars.map{|char| possible_solution[char]}
                    }
                end
            end

            next if dictionary.any? {|word,data| data[:digits].first == 0}

            addends = dictionary.map do |word,data|
                (data[:digits].join.to_i) * data[:count] unless word == final
            end.compact.sum
            total = dictionary[final][:digits].join.to_i

            if addends == total
                solution = possible_solution
                break
            end
        end

        solution
    end

    def self.number_matrix(combos, letters, depth)
        if depth == 1
            10.times {|num| combos.push([num])}
            combos
        else
            self.number_matrix(combos, letters, depth - 1).reduce([]) do |acc, nums_ary| 
                10.times do |num| 
                    new_combo = nums_ary + [num]
                    acc.push(new_combo) if new_combo.size == new_combo.uniq.size
                end
                acc
            end
        end
    end
end
