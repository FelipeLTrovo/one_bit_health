require 'rails_helper'

RSpec.describe SharedsController, type: :controller do
  before(:each) do
    http_login
  end

  let(:valid_attributes) { FactoryBot.attributes_for(:shared) }

  let(:invalid_attributes) {
    {
      user_id: nil,
      professional_id: nil,
      duedate: nil,
    }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      byebug
      Shared.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Shared" do
        expect {
          post :create, params: {shared: valid_attributes}, session: valid_session
        }.to change(Shared, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {shared: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end
end
