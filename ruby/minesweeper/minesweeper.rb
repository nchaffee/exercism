class Board
    def self.transform(rows)
        new(rows).to_s
    end

    MINE = '*'
    INVALID = %w{X}
    VALID = %w{+ - * |}

    def initialize(rows)
        validate(rows)
        @rows = build(rows)
        sweep
    end

    def validate(rows)
        raise ArgumentError if rows.any? do |row|
            row[0] == MINE ||
            row.chars.any?{|char| INVALID.include?(char)} ||
            row.length != rows.first.length
        end
    end

    def build(rows)
        rows.map(&:chars).map do |row|
            row.map do |sqr|
                VALID.include?(sqr) ? sqr : 0
            end
        end
    end

    def mine?(y,x)
        @rows[y][x] == MINE
    end

    def increment_adjactent(y,x)
        (y-1).upto(y+1) do |yy|
            (x-1).upto(x+1) do |xx|
                @rows[yy][xx] += 1 if @rows[yy][xx].class == Integer
            end
        end
    end

    def sweep
        @rows.each.with_index do |row, y|
            row.each.with_index do |sqr, x|
                increment_adjactent(y,x) if mine?(y,x)
            end
        end
    end

    def to_s
        @rows.map do |row|
            row.map{|sqr| sqr == 0 ? " " : sqr}
        end.map(&:join)
    end
end
