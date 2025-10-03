module Enrollments
  class EnrollStudentService
    def initialize(student:, course:)
      @student = student
      @course = course
    end

    def call
      return { success: false, message: "Aluno já matriculado" } if Enrollment.exists?(user: @student, course: @course)

      enrollment = Enrollment.create(user: @student, course: @course)
      if enrollment.persisted?
        Notifications::NewEnrollmentJob.perform_later(@student.id, @course.id)
        { success: true, enrollment: enrollment }
      else
        { success: false, message: enrollment.errors.full_messages.join(", ") }
      end
    end
  end
end
