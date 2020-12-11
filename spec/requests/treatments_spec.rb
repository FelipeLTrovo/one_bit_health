require 'rails_helper'

RSpec.describe "Treatments", type: :request do

  describe "GET /treatments" do
    it " without login need to be redirect to root" do
      get treatments_path
      expect(response).to have_http_status(302)
      expect(response.location).to eq("http://www.example.com/users/sign_in")
    end
  end
end
