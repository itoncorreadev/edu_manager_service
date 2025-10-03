class Notifications::NewEnrollmentJob < ApplicationJob
  queue_as :default

  def perform(student_id, course_id)
    student = User.find(student_id)
    course = Course.find(course_id)
    Notification.create!(user: student, message: "Você foi matriculado no curso #{course.title}")
    UserMailer.with(user: student, course: course).new_enrollment_email.deliver_now
  end
end
