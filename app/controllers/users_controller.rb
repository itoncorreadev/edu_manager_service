class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:create]
  before_action :set_user, only: [:show]

  def index
    @user = User.all

    render json: @user
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_content
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end