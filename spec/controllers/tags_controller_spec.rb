require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  context 'User logged in ' do
    before(:each) do
      http_login
    end

    let(:valid_attributes) { FactoryBot.attributes_for(:tag) }

    let(:invalid_attributes) {
      {
        content: ""
      }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        Tag.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        tag = Tag.create! valid_attributes
        get :show, params: {id: tag.to_param}, session: valid_session
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
        tag = Tag.create! valid_attributes
        get :edit, params: {id: tag.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {
            content: "Gripe"
          }
        }

        it "updates the requested treatment" do
          tag = Tag.create! valid_attributes
          put :update, params: {id: tag.to_param, tag: new_attributes}, session: valid_session
          tag.reload
          expect(tag.content).to eq(new_attributes[:content])
        end

        it "redirects to the treatment" do
          tag = Tag.create! valid_attributes
          put :update, params: {id: tag.to_param, tag: valid_attributes}, session: valid_session
          expect(response).to redirect_to(tag)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          tag = Tag.create! valid_attributes
          put :update, params: {id: tag.to_param, tag: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested treatment" do
        tag = Tag.create! valid_attributes
        expect {
          delete :destroy, params: {id: tag.to_param}, session: valid_session
        }.to change(Tag, :count).by(-1)
      end

      it "redirects to the treatments list" do
        tag = Tag.create! valid_attributes
        delete :destroy, params: {id: tag.to_param}, session: valid_session
        expect(response).to redirect_to(tags_url)
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
