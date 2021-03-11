class Alphametics
    def self.solve(puzzle)
        letters = puzzle.scan(/\w/).uniq
        puts letters.inspect
        
        words,final = puzzle.split("==")
        words = words.split("+").map(&:strip)
        final = final.strip
        puts words.inspect
        puts final.inspect
        
        solution = {}
        matrix = self.number_matrix([], letters, letters.size)
        # puts matrix.inspect

        matrix.each do |combo|
            possible_solution = letters.reduce({}) do |acc, letter|
                acc[letter] = combo.pop
                acc
            end
            
            numbers_to_add = (words + [final]).map do |word|
                word.chars.map{|char| possible_solution[char]}
            end
            next if numbers_to_add.any? {|num| num.first == 0}
            numbers_to_add = numbers_to_add.map(&:join).map(&:to_i)
            total = numbers_to_add.pop
            if numbers_to_add.sum == total
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
    <<-IDEAS
     can make matrix and brute force it
        can exclude repeated numbers
        10 numbers possible for 2-10 letters
     never use zero for a leading number
     return empty {} when no solution found

    IDEAS
end
