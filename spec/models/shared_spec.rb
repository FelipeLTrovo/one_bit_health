# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  duedate         :date
#  professional_id :bigint
#  integer_id      :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Shared, type: :model do
  context "validations with shouldamatchers " do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :professional }
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :professional_id }
  end

  context "special validations " do
    let!(:shared) { create(:shared)}

    it "can't have past due_date" do
      shared.update(duedate: 1.day.ago)
      expect(shared.errors.keys).to include :duedate
    end

    it "is valid with future date" do
      shared.update(duedate: Date.current + 5.days)
      expect(shared.errors.keys).to_not include :duedate
    end

    it "can´t create duplicated registries" do
      shared_1 = Shared.new(user: shared.user, professional: shared.professional, duedate: shared.duedate)
      shared_1.valid?
      expect(shared_1.errors.messages[:duedate]).to eq(["Não pode haver compartilhamentos repetidos"])
    end
  end
end
