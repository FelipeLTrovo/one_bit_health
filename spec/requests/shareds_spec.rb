require 'rails_helper'

RSpec.describe "Shareds", type: :request do
  describe "GET /shareds" do
    it " without login need to be redirect to root" do
      get users_path
      expect(response).to have_http_status(302)
      expect(response.location).to eq("http://www.example.com/users/sign_in")
    end
  end
end
