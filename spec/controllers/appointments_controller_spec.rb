require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  context 'User logged in ' do
    before(:each) do
      http_login
    end

    let(:valid_attributes) { FactoryBot.attributes_for(:appointment, user: User.first) }

    let(:invalid_attributes) {
      skip("Add a hash of attributes invalid for your model")
    }

    let(:valid_session) { {} }

    describe "GET #index" do
      it "returns a success response" do
        Appointment.create! valid_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        appointment = Appointment.create! valid_attributes
        appointment.update(user_id: User.first.id)
        get :show, params: {id: appointment.to_param}, session: valid_session
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
        appointment = Appointment.create! valid_attributes
        get :edit, params: {id: appointment.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Appointment" do
          expect {
            post :create, params: {appointment: valid_attributes}, session: valid_session
          }.to change(Appointment, :count).by(1)
        end

        it "redirects to the created appointment" do
          post :create, params: {appointment: valid_attributes}, session: valid_session
          expect(response).to redirect_to(Appointment.last)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {appointment: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested appointment" do
          appointment = Appointment.create! valid_attributes
          put :update, params: {id: appointment.to_param, appointment: new_attributes}, session: valid_session
          appointment.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the appointment" do
          appointment = Appointment.create! valid_attributes
          put :update, params: {id: appointment.to_param, appointment: valid_attributes}, session: valid_session
          expect(response).to redirect_to(appointment)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          appointment = Appointment.create! valid_attributes
          put :update, params: {id: appointment.to_param, appointment: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "destroys the requested appointment" do
        appointment = Appointment.create! valid_attributes
        expect {
          delete :destroy, params: {id: appointment.to_param}, session: valid_session
        }.to change(Appointment, :count).by(-1)
      end

      it "redirects to the appointments list" do
        appointment = Appointment.create! valid_attributes
        delete :destroy, params: {id: appointment.to_param}, session: valid_session
        expect(response).to redirect_to(appointments_url)
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
