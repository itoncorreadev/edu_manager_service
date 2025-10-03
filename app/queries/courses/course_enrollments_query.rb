class Courses::CourseEnrollmentsQuery
  def initialize(course:)
    @course = course
  end

  def call
    @course.enrollments.includes(:user)
  end
end
