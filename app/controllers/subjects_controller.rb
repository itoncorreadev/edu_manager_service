class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course
  before_action :set_subject, only: %i[show update destroy]

  def index
    @subjects = @course.subjects
    render json: @subjects
  end

  def show
    render json: @subject
  end

  def create
    @subject = @course.subjects.new(subject_params)
    if @subject.save
      render json: @subject, status: :created
    else
      render json: { errors: @subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: { errors: @subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
    head :no_content
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_subject
    @subject = @course.subjects.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
