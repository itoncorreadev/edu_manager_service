module Assignments
  class CreateAssignmentService
    def initialize(lesson:, user:, params:)
      @lesson = lesson
      @user = user
      @params = params
    end

    def call
      assignment = @lesson.assignments.new(@params.merge(user: @user))
      if assignment.save
        { success: true, assignment: assignment }
      else
        { success: false, message: assignment.errors.full_messages.join(", ") }
      end
    end
  end
end
