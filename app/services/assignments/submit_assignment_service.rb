module Assignments
  class SubmitAssignmentService
    def initialize(assignment:, student:, content:)
      @assignment = assignment
      @student = student
      @content = content
    end

    def call
      submission = @assignment.submissions.new(user: @student, content: @content)
      if submission.save
        { success: true, submission: submission }
      else
        { success: false, message: submission.errors.full_messages.join(", ") }
      end
    end
  end
end
