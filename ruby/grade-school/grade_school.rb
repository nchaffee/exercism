class School
  def initialize
    @grades = Hash.new([])
  end

  def students(grade)
    @grades[grade]
  end

  def students_by_grade
    @grades
    .map { |grade, students| { grade: grade, students: students } }
    .sort_by { |grades| grades[:grade] }
  end

  def add(name, grade)
    @grades[grade] = @grades[grade].dup.push(name).sort
  end
end

module BookKeeping
  VERSION = 3
end
