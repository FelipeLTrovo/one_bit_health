require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'User logged in ' do
    before(:each) do
      http_login
    end

    let(:valid_attributes) {
      {
        email: "teste@teste.com",
        password: "password",
        name: "Administrador",
        role: :admin
      }
    }

    let(:invalid_attributes) {
      {
        email: "aaaa",
        password: "",
        name: "",
        role: nil
      }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        User.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        user = User.create! valid_attributes
        get :show, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #new" do
      it "returns a success response" do
        get :new, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #edit" do
      it "returns a success response" do
        user = User.create! valid_attributes
        get :edit, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {
            name: "Administrador 2222"
          }
        }

        it "updates the requested user" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
          user.reload
          expect(user.name).to eq(new_attributes[:name])
        end

        it "redirects to the user" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
          expect(response).to redirect_to(user)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, params: {id: user.to_param}, session: valid_session
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        delete :destroy, params: {id: user.to_param}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end
  end

  context "User not logged" do
    it "can't access action index and be redirected(status 302)" do
      get(:index)
      expect(response).to have_http_status(302)
    end

    it "can't access action index and be redirected to 'sign_in'" do
      get(:index)
      expect(response.location).to eq("http://test.host/users/sign_in")
    end
  end
end
