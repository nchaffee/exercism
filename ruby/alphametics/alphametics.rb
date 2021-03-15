class Alphametics
    DIGITS = [*1..9,0]
    def self.solve(puzzle)
        solution = {}
        letters = puzzle.scan(/\w/).uniq
        words,final = puzzle.split("==")
        words = words.split("+").map(&:strip)
        final = final.strip
        all_words = words + [final]
        
        (0..9).to_a.permutation(letters.size).each do |combo|
            possible_solution = letters.reduce({}) do |acc, letter|
                acc[letter] = combo.pop
                acc
            end

            # dictionary uglier & longer but makes 199 addends test faster
            dictionary, leading_zero = {}, false
            all_words.each do |word|
                if dictionary.has_key?(word)
                    dictionary[word][:count] += 1
                else
                    word_in_digits = word.chars.map{|char| possible_solution[char]}
                    (leading_zero = true; break) if word_in_digits.first == 0
                    dictionary[word] = {count: 1, digits: word_in_digits}
                end
            end
            next if leading_zero

            total = dictionary[final][:digits].join.to_i
            addends = dictionary.slice(*words).map do |_word,data|
                (data[:digits].join.to_i) * data[:count]
            end.sum

            (solution = possible_solution; break) if addends == total
        end

        solution
    end

    # leaves out repeated numbers but slower than Array#permutation
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
