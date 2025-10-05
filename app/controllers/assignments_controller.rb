# frozen_string_literal: true

class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: %i[show update destroy]

  def index
    @assignments = params[:lesson_id] ? Assignment.where(lesson_id: params[:lesson_id]) : Assignment.all
    render json: @assignments
  end

  def show
    render json: @assignment
  end

  def create
    @assignment = Assignment.new(assignment_params.merge(user: current_user))
    if @assignment.save
      render json: @assignment, status: :created
    else
      render json: { errors: @assignment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: { errors: @assignment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy
    head :no_content
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, :status, :lesson_id)
  end
end
