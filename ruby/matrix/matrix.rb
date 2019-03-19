class Matrix
  def initialize(matrix_text)
    @matrix_text = matrix_text
  end

  def rows
    @matrix_text.lines.map do |line|
      line.split.map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end
