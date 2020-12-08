require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    it " without login need to be redirect to root" do
      get users_path
      expect(response).to have_http_status(302)
      expect(response.location).to eq("http://www.example.com/users/sign_in")
    end
  end
end
