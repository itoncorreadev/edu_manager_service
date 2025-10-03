class UserMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome Email")
  end
end
