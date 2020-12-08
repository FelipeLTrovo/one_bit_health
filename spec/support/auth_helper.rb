module AuthHelper
  def http_login
    user_logged = create(:user)
    sign_in user_logged
  end
end
