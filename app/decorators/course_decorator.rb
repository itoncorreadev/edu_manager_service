class CourseDecorator
  def initialize(course)
    @course = course
  end

  def title_with_teacher
    "#{@course.title} - Professor: #{@course.teacher.email}"
  end

  def students_count
    @course.students.count
  end

  def subjects_list
    @course.subjects.map(&:name).join(", ")
  end

  def summary
    "#{title_with_teacher} | Matérias: #{subjects_list} | Alunos: #{students_count}"
  end
end
