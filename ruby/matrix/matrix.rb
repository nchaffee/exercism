class Matrix
  def initialize matrix_text
    @matrix_text = matrix_text
  end

  def rows
    @matrix_text.
    split("\n").
    map{|row| row.split(" ").map(&:to_i)}
  end

  def columns
    rows.inject(Array.new(rows.size) { Array.new }) do |result, row|
      row.each_with_index do |element, index|
        result[index] << element
      end
      result
    end
  end
end
