class Assignments::PendingAssignmentsQuery
  def initialize(user:)
    @user = user
  end

  def call
    Assignment.joins(:lesson)
              .joins("INNER JOIN enrollments ON enrollments.course_id = lessons.subjects.course_id")
              .where(enrollments: { user_id: @user.id })
              .where(status: :pending)
  end
end
