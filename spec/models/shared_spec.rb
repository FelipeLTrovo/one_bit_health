# == Schema Information
#
# Table name: shareds
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  sharedable_type :string           not null
#  sharedable_id   :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Shared, type: :model do
  before(:each) do
    @shared = create(:shared)
  end

  subject { @shared }

  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :professional }
  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :duedate }
  it { is_expected.to validate_presence_of :professional_id }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:professional_id, :duedate) }

  it "can't have past due_date" do
    subject.duedate = 1.day.ago
    subject.valid?
    expect(subject.errors.keys).to include :duedate
  end

  it "is valid with future date" do
    subject.duedate = Date.current + 7.days
    subject.valid?
    expect(subject.errors.keys).to_not include :duedate
  end
end