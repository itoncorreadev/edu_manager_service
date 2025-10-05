# frozen_string_literal: true

module Courses
  class CourseEnrollmentsQuery
    def initialize(course:)
      @course = course
    end

    def call
      @course.enrollments.includes(:user)
    end
  end
end
