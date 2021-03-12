class Alphametics
    DIGITS = [*1..9,0]
    def self.solve(puzzle)
        letters = puzzle.scan(/\w/).uniq
        
        words,final = puzzle.split("==")
        words = words.split("+").map(&:strip)
        final = final.strip
        all_words = words + [final]
        
        solution = {}
        self.number_matrix(letters.size).each do |combo|
            possible_solution = letters.reduce({}) do |acc, letter|
                acc[letter] = combo.pop
                acc
            end

            # dictionary makes 199 addends test 20% faster, others slower
            dictionary, leading_zero = {}, false
            all_words.each do |word|
                if dictionary.has_key?(word)
                    dictionary[word][:count] += 1
                else
                    word_in_digits = word.chars.map{|char| possible_solution[char]}
                    if word_in_digits.first == 0
                        leading_zero = true
                        break
                    end
                    dictionary[word] = {count: 1, digits: word_in_digits}
                end
            end
            next if leading_zero

            addends = dictionary.map do |word,data|
                word == final ? 0 : (data[:digits].join.to_i) * data[:count]
            end.sum
            total = dictionary[final][:digits].join.to_i

            if addends == total
                solution = possible_solution
                break
            end
        end

        solution
    end

    # leaves out repeated numbers
    # Alphametics.number_matrix(2)
    # => [[0, 1], [0, 2], [0, 3]...[4, 2], [4, 3], [4, 5]...[9, 6], [9, 7], [9, 8]]
    def self.number_matrix(depth, combos = [])
        if depth == 1
            DIGITS.each {|num| combos.push([num])}
            combos
        else
            self.number_matrix(depth - 1, combos).reduce([]) do |acc, nums_ary|
                DIGITS.each do |num|
                    new_combo = nums_ary + [num]
                    acc.push(new_combo) if new_combo.size == new_combo.uniq.size
                end
                acc
            end
        end
    end
end
