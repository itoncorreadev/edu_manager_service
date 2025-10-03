class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject
  before_action :set_lesson, only: %i[show update destroy]

  def index
    @lessons = @subject.lessons
    render json: @lessons
  end

  def show
    render json: @lesson
  end

  def create
    @lesson = @subject.lessons.new(lesson_params)
    if @lesson.save
      render json: @lesson, status: :created
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @lesson.update(lesson_params)
      render json: @lesson
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy
    head :no_content
  end

  private

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_lesson
    @lesson = @subject.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
end
