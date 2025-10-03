
module ApiHelpers
  def auth_headers(user)
    token = user.authentication_token || user.generate_authentication_token!
    { "Authorization" => "Bearer #{token}" }
  end
end
