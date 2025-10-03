class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[create]

  def index
    if current_user.teacher?
      @enrollments = Enrollment.joins(:course).where(courses: { teacher_id: current_user.id })
    else
      @enrollments = current_user.enrollments
    end
    render json: @enrollments
  end

  def create
    enrollment = Enrollment.new(user: current_user, course: @course)
    if enrollment.save
      render json: enrollment, status: :created
    else
      render json: { errors: enrollment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end
