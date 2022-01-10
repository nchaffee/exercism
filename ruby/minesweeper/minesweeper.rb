class Board
    def self.transform(rows)
        raise ArgumentError if rows.any? do |row|
            row[0] == '*'|| row.chars.include?('X') || row.length != rows.first.length
        end
        num_rows = rows.map(&:chars).map do |row|
            row.map do |square|
                %w{+ - * |}.include?(square) ? square : 0
            end
        end
        num_rows.each.with_index do |row, y|
            row.each.with_index do |sqr, x|
                if num_rows[y][x] == "*"
                    (y-1).upto(y+1) do |yy|
                        (x-1).upto(x+1) do |xx|
                            num_rows[yy][xx] += 1 if num_rows[yy][xx].class == Integer
                        end
                    end
                end
            end
        end
        num_rows.map do |row|
            row.map{|square| square == 0 ? " " : square}
        end.map(&:join)
    end
end
