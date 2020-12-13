require 'rails_helper'

RSpec.describe TreatmentsController, type: :controller do
  context 'User logged in ' do
    before(:each) do
      http_login
    end

    let(:valid_attributes) { FactoryBot.attributes_for(:treatment) }

    let(:invalid_attributes) {
      {
        title: "test",
        description: "",
        date: nil,
        local: "",
        kind: :cirurgia
      }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        Treatment.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        treatment = Treatment.create! valid_attributes
        treatment.update(user_id: User.first.id)
        get :show, params: {id: treatment.to_param}, session: valid_session
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
        treatment = Treatment.create! valid_attributes
        treatment.update(user_id: User.first.id)
        get :edit, params: {id: treatment.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {
            title: "Tratamento para gripe"
          }
        }

        it "updates the requested treatment" do
          treatment = Treatment.create! valid_attributes
          treatment.update(user_id: User.first.id)
          put :update, params: {id: treatment.to_param, treatment: new_attributes}, session: valid_session
          treatment.reload
          expect(treatment.title).to eq(new_attributes[:title])
        end

        it "redirects to the treatment" do
          treatment = Treatment.create! valid_attributes
          treatment.update(user_id: User.first.id)
          put :update, params: {id: treatment.to_param, treatment: valid_attributes}, session: valid_session
          expect(response).to redirect_to(treatment)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          treatment = Treatment.create! valid_attributes
          treatment.update(user_id: User.first.id)
          put :update, params: {id: treatment.to_param, treatment: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested treatment" do
        treatment = Treatment.create! valid_attributes
        treatment.update(user_id: User.first.id)
        expect {
          delete :destroy, params: {id: treatment.to_param}, session: valid_session
        }.to change(Treatment, :count).by(-1)
      end

      it "redirects to the treatments list" do
        treatment = Treatment.create! valid_attributes
        treatment.update(user_id: User.first.id)
        delete :destroy, params: {id: treatment.to_param}, session: valid_session
        expect(response).to redirect_to(treatments_url)
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
