require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'validating a new user' do

    context ' with a role administrador' do
      let!(:user_admin) { create(:user_admin) }
      it ' has the right permissions' do
        permissions = {
          :can=>{
            :manage=>{"all"=>[]}
          },
          :cannot=>{}}
        expect(user_admin.permissions).to eq(permissions)
      end
    end

    context ' with a role patient' do
      let!(:user_patient) { create(:user_patient) }
      it ' has the right permissions' do
        permissions = {
          :can=>{
            :manage=>{"User"=>[], "Exam"=>[], "Treatment"=>[], "Shared"=>[], "Appointment"=>[]},
            :create=>{"Appointment"=>[], "Exam"=>[], "Treatment"=>[], "User"=>[], "Shared"=>[]},
            :new=>{"Appointment"=>[], "Exam"=>[], "Treatment"=>[], "User"=>[], "Shared"=>[]},
            :update=>{"Appointment"=>[], "Exam"=>[], "Treatment"=>[], "User"=>[], "Shared"=>[]},
            :edit=>{"Appointment"=>[], "Exam"=>[], "Treatment"=>[], "User"=>[], "Shared"=>[]}},
          :cannot=>{:manage=>{"Tag"=>[]}}}
        expect(user_patient.permissions).to eq(permissions)
      end
    end
  end
end
