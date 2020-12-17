require 'rails_helper'

RSpec.describe ExamsController, type: :controller do
  context 'User logged in ' do
    before(:each) do
      http_login
    end

    let(:valid_attributes) { FactoryBot.attributes_for(:exam, user: User.first) }

    let(:invalid_attributes) {
      Exam.new.attributes
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        Exam.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        exam = Exam.create! valid_attributes
        exam.update(user_id: User.first.id)
        get :show, params: {id: exam.to_param}, session: valid_session
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
        exam = Exam.create! valid_attributes
        get :edit, params: {id: exam.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new exam" do
          expect {
            post :create, params: {exam: valid_attributes}, session: valid_session
          }.to change(Exam, :count).by(1)
        end

        it "redirects to the created exam" do
          post :create, params: {exam: valid_attributes}, session: valid_session
          expect(response).to redirect_to("/exams/#{Exam.last.id}")
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {exam: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          {
            description: "Teste - 1"
          }
        }

        it "updates the requested exam" do
          exam = Exam.create! valid_attributes
          put :update, params: {id: exam.to_param, exam: new_attributes}, session: valid_session
          exam.reload
          expect(exam.description).to eq(new_attributes[:description])
        end

        it "redirects to the exam" do
          exam = Exam.create! valid_attributes
          put :update, params: {id: exam.to_param, exam: valid_attributes}, session: valid_session
          expect(response).to redirect_to(exam)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          exam = Exam.create! valid_attributes
          put :update, params: {id: exam.to_param, exam: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested exam" do
        exam = Exam.create! valid_attributes
        expect {
          delete :destroy, params: {id: exam.to_param}, session: valid_session
        }.to change(Exam, :count).by(-1)
      end

      it "redirects to the exams list" do
        exam = Exam.create! valid_attributes
        delete :destroy, params: {id: exam.to_param}, session: valid_session
        expect(response).to redirect_to(exams_url)
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
