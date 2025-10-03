class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: %i[show update destroy]

  def index
    if params[:subject_id]
      @lessons = Lesson.where(subject_id: params[:subject_id])
    else
      @lessons = Lesson.all
    end
    render json: @lessons
  end

  def show
    render json: @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
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

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content, :subject_id)
  end
end
