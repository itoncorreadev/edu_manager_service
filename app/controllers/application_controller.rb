# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  before_action :authenticate_user_from_token!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user_from_token!
    token = request.headers["Authorization"]&.split("Bearer ")&.last
    return unless token

    user = User.find_by(authentication_token: token)
    sign_in(user, store: false) if user
  end

  def user_not_authorized
    render json: { error: "You are not authorized to perform this action." }, status: :forbidden
  end
end
