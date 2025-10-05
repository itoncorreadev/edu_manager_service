# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  def index
    @courses = policy_scope(Course)
    render json: @courses, each_serializer: CourseSerializer
  end

  def show
    authorize @course
    render json: @course, serializer: CourseSerializer
  end

  def create
    @course = Course.new(course_params.merge(teacher: current_user))
    authorize @course
    if @course.save
      render json: @course, serializer: CourseSerializer, status: :created
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @course
    if @course.update(course_params)
      render json: @course, serializer: CourseSerializer
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @course
    @course.destroy
    head :no_content
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
